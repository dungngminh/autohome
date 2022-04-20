import 'package:autohome/src/core/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class EnergyUsageCard extends StatefulWidget {
  const EnergyUsageCard({
    Key? key,
  }) : super(key: key);

  @override
  State<EnergyUsageCard> createState() => _EnergyUsageCardState();
}

class _EnergyUsageCardState extends State<EnergyUsageCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
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
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffF7759C),
              Color(0xffFF6BA1),
            ],
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Palette.backgroundColor,
                      child: Icon(
                        PhosphorIcons.lightningFill,
                        color: Palette.yellowColor,
                        size: 28,
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      "Thống kê\ntiêu thụ điện",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Palette.backgroundColor,
                      ),
                    ),
                  ],
                ),
                ClipOval(
                  child: Material(
                    color: Colors.transparent,
                    child: IconButton(
                      icon: const Icon(
                        PhosphorIcons.arrowsClockwise,
                        color: Palette.backgroundColor,
                        size: 28,
                      ),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
            Opacity(
              opacity: 0.3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
                child: Container(
                  height: 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Palette.backgroundColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Hôm nay",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Palette.backgroundColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: const [
                          Icon(
                            IconlyBold.arrowUp3,
                            color: Palette.backgroundColor,
                          ),
                          Text(
                            "30.7 kWh",
                            style: TextStyle(
                              fontSize: 18,
                              color: Palette.backgroundColor,
                              height: 1.3,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Tháng này",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Palette.backgroundColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: const [
                          Icon(
                            IconlyBold.arrowUp3,
                            color: Palette.backgroundColor,
                          ),
                          Text(
                            "235.37 kWh",
                            style: TextStyle(
                              fontSize: 18,
                              color: Palette.backgroundColor,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
