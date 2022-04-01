import 'dart:developer';

import 'package:autohome/src/core/theme/palette.dart';
import 'package:autohome/src/di/injector.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DeviceCard extends StatefulWidget {
  const DeviceCard({
    Key? key,
    required this.ledName,
    required this.color,
  }) : super(key: key);

  final String ledName;
  final Color color;

  @override
  State<DeviceCard> createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  bool status = false;

  Future<void> ledAction(bool value) async {
    try {
      String st = value ? "turnon" : "turnoff";
      await injector
          .get<Dio>()
          .get('/led?ledname=${widget.ledName}&ledstatus=$st')
          .then((rs) {
        setState(() {
          status = value;
        });
        log(status.toString());
      });
    } catch (e) {
      rethrow;
    }
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
                    child: const Icon(
                      PhosphorIcons.lightbulbFill,
                      color: Palette.mainBlue,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    "Đèn chính ${widget.ledName}",
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
                  child: CupertinoSwitch(
                    trackColor: Palette.elementLightGray,
                    activeColor: Palette.mainBlue,
                    // onChanged: (value) => widget.onSwitchAction(),
                    onChanged: (value) async {
                      await ledAction(value);
                    },
                    value: status,
                  ),
                ),
              )
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
                      color: widget.color),
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
                  child: const Text(
                    "Phòng khách",
                    style: TextStyle(
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
