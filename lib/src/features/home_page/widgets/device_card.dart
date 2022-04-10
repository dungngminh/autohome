import 'dart:developer';

import 'package:autohome/src/core/enum/enum.dart';
import 'package:autohome/src/core/theme/palette.dart';
import 'package:autohome/src/features/home_page/controller/status_device_controller.dart';
import 'package:autohome/src/model/device.dart';
// import 'package:autohome/src/di/injector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DeviceCard extends StatefulWidget {
  const DeviceCard({
    Key? key,
    required this.color,
    required this.device,
  }) : super(key: key);

  final Device device;
  final Color color;
  @override
  State<DeviceCard> createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  late bool status;

  @override
  void initState() {
    status = mapToStatus[widget.device.status]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.only(left: 24, bottom: 8, right: 24),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Palette.elementBlue.withOpacity(0.7),
                    child: Icon(
                      mapToDeviceType[widget.device.type] == DeviceType.led
                          ? PhosphorIcons.lightbulbFill
                          : (mapToDeviceType[widget.device.type] ==
                                  DeviceType.fan
                              ? PhosphorIcons.wind
                              : PhosphorIcons.lightbulbFilament),
                      color: Palette.mainBlue,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    widget.device.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Palette.textBlack,
                    ),
                  ),
                ],
              ),
              ClipOval(
                child: Material(
                    color: Colors.transparent,
                    child: Consumer(builder: (context, ref, child) {
                      final action = ref.read(actionDeviceProvider);

                      return CupertinoSwitch(
                        trackColor: Palette.elementLightGray,
                        activeColor: Palette.mainBlue,
                        onChanged: (value) async {
                          log("hello");
                          // Fluttertoast.showToast(
                          //     msg: value
                          //         ? "Đang bật ${widget.device.name}"
                          //         : "Đang tắt ${widget.device.name}");
                          await action
                              .deviceAction(
                                  device: widget.device, status: status)
                              .then((_) {
                            setState(() {
                              status = value;
                            });
                            // Fluttertoast.showToast(
                            //     msg: value
                            //         ? "Đã bật ${widget.device.name}"
                            //         : "Đã tắt ${widget.device.name}"),
                          }).catchError((error, __) {
                            //   AppUtils.logger(error!,
                            //       location: runtimeType, isError: true);
                            //   Fluttertoast.showToast(
                            //       msg: value
                            //           ? "Bật ${widget.device.name} không thành công, vui lòng thử lại"
                            //           : "Tắt ${widget.device.name} không thành công, vui lòng thử lại");
                            // });
                          });
                        },
                        value: status,
                      );
                    })),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              const Text(
                "Màu sắc",
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Palette.elementLightGray,
                  ),
                  child: Text(
                    widget.device.location,
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
        ],
      ),
    );
  }
}
