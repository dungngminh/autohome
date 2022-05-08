import 'package:autohome/src/core/enum/enum.dart';
import 'package:autohome/src/core/extenstion/device_x.dart';
import 'package:autohome/src/core/extenstion/string_x.dart';
import 'package:autohome/src/core/theme/palette.dart';
import 'package:autohome/src/core/utils/app_utils.dart';
import 'package:autohome/src/features/home_page/controller/action_device_controller.dart';
import 'package:autohome/src/model/device.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DeviceCard extends StatefulWidget {
  const DeviceCard({
    Key? key,
    this.color,
    required this.device,
  }) : super(key: key);

  final Device device;
  final Color? color;
  @override
  State<DeviceCard> createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  late ValueNotifier<bool> statusNotifier;
  late ValueNotifier<double> valueSlider;

  @override
  void initState() {
    statusNotifier = ValueNotifier(widget.device.mapToStatus());
    if (widget.device.mapToDeviceType() == DeviceType.fan) {
      valueSlider = ValueNotifier(20.0);
    } else {
      valueSlider = ValueNotifier(0.0);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.only(left: 24, bottom: 12, right: 24),
      decoration: BoxDecoration(
        color: Palette.backgroundColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: const Offset(0, 2),
            color: Palette.shadowBlack.withOpacity(0.1),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Palette.elementBlue.withOpacity(0.7),
                child: Icon(
                  widget.device.mapToDeviceType() == DeviceType.led
                      ? PhosphorIcons.lightbulbFill
                      : (widget.device.mapToDeviceType() == DeviceType.fan
                          ? PhosphorIcons.wind
                          : PhosphorIcons.lightbulbFilament),
                  color: Palette.mainBlue,
                  size: 28,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  widget.device.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Palette.textBlack,
                  ),
                ),
              ),
              ValueListenableBuilder<bool>(
                valueListenable: statusNotifier,
                builder: (context, status, child) {
                  return Consumer(
                    builder: (context, ref, child) {
                      return CupertinoSwitch(
                        trackColor: Palette.elementLightGray,
                        activeColor: Palette.mainBlue,
                        onChanged: (value) async {
                          if (widget.device.mapToDeviceType() ==
                              DeviceType.fan) {
                            Fluttertoast.showToast(
                              msg: value
                                  ? 'Đang bật ${widget.device.name}'
                                  : 'Đang tắt ${widget.device.name}',
                            );
                            await ref
                                .read(actionDeviceProvider)
                                .doFanAction(
                                  nameFan: widget.device.name,
                                  value: value ? 20 : 0,
                                )
                                .then((_) {
                              statusNotifier.value = value;
                              valueSlider.value = value ? 20 : 0;
                              Fluttertoast.showToast(
                                msg: value
                                    ? 'Đã bật ${widget.device.name}'
                                    : 'Đã tắt ${widget.device.name}',
                              );
                            }).catchError((error, __) {
                              AppUtils.logger(
                                error,
                                location: runtimeType,
                                isError: true,
                              );
                              Fluttertoast.showToast(
                                msg: value
                                    ? 'Bật ${widget.device.name} không thành công,\nvui lòng thử lại'
                                    : 'Tắt ${widget.device.name} không thành công,\nvui lòng thử lại',
                              );
                            });
                          } else {
                            Fluttertoast.showToast(
                              msg: value
                                  ? 'Đang bật ${widget.device.name}'
                                  : 'Đang tắt ${widget.device.name}',
                            );
                            await ref
                                .read(actionDeviceProvider)
                                .doLedAction(
                                  nameLed: widget.device.name,
                                  status: status,
                                )
                                .then((_) {
                              statusNotifier.value = value;
                              Fluttertoast.showToast(
                                msg: value
                                    ? 'Đã bật ${widget.device.name}'
                                    : 'Đã tắt ${widget.device.name}',
                              );
                            }).catchError((error, __) {
                              AppUtils.logger(
                                error,
                                location: runtimeType,
                                isError: true,
                              );
                              Fluttertoast.showToast(
                                msg: value
                                    ? 'Bật ${widget.device.name} không thành công,\nvui lòng thử lại'
                                    : 'Tắt ${widget.device.name} không thành công,\nvui lòng thử lại',
                              );
                            });
                          }
                        },
                        value: status,
                      );
                    },
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          IgnorePointer(
            ignoring: !statusNotifier.value,
            child: Opacity(
              opacity: statusNotifier.value ? 1.0 : 0.6,
              child: widget.device.mapToDeviceType() == DeviceType.fan
                  ? Row(
                      children: [
                        const Text(
                          'Tốc độ',
                          style: TextStyle(
                            color: Palette.textBlack,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: ValueListenableBuilder<double>(
                            valueListenable: valueSlider,
                            builder: (context, value, child) {
                              return Consumer(
                                builder: (context, ref, child) {
                                  return Slider(
                                    onChanged: (newValue) {
                                      valueSlider.value = newValue;
                                      if (newValue == 0.0) {
                                        statusNotifier.value = false;
                                      }
                                    },
                                    value: value,
                                    onChangeStart: (value) {},
                                    onChangeEnd: (value) async {
                                      await ref
                                          .read(actionDeviceProvider)
                                          .doFanAction(
                                            nameFan: widget.device.name,
                                            value: int.parse(
                                              value.toStringAsFixed(0),
                                            ),
                                          )
                                          .then((_) {
                                        Fluttertoast.showToast(
                                          msg: value == 0.0
                                              ? 'Đã tắt ${widget.device.name}'
                                              : 'Đã chỉnh tốc độ ${widget.device.name} ${value.toStringAsFixed(0)}',
                                        );
                                      }).catchError((error, __) {
                                        AppUtils.logger(
                                          error,
                                          location: runtimeType,
                                          isError: true,
                                        );
                                        Fluttertoast.showToast(
                                          msg:
                                              'Chỉnh tốc độ ${widget.device.name} ${value.toStringAsFixed(0)} không thành công,\nvui lòng thử lại',
                                        );
                                      });
                                    },
                                    divisions: 3,
                                    max: 50,
                                    min: 0,
                                    label: value.toStringAsFixed(0),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Material(
                          color: Colors.transparent,
                          child: Ink(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: Palette.elementLightGray,
                            ),
                            child: Text(
                              widget.device.location
                                  .convertSmallerLocationName(),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Palette.textGray,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        const Text(
                          'Màu sắc',
                          style: TextStyle(
                            color: Palette.textBlack,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 40,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: widget.color,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Material(
                          color: Colors.transparent,
                          child: Ink(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: Palette.elementLightGray,
                            ),
                            child: Text(
                              widget.device.location
                                  .convertSmallerLocationName(),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Palette.textGray,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          )
        ],
      ),
    );
  }
}
