import 'package:autohome/src/core/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TemperatureAndHumidityCard extends StatefulWidget {
  const TemperatureAndHumidityCard({
    Key? key,
  }) : super(key: key);

  @override
  State<TemperatureAndHumidityCard> createState() =>
      _TemperatureAndHumidityCardState();
}

class _TemperatureAndHumidityCardState
    extends State<TemperatureAndHumidityCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
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
                        PhosphorIcons.thermometerFill,
                        color: Palette.mainBlue,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      "Nhiệt độ\nvà độ ẩm",
                      style: TextStyle(
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
                    child: IconButton(
                      icon: const Icon(
                        PhosphorIcons.arrowsClockwise,
                        color: Palette.mainBlue,
                        size: 28,
                      ),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
            Opacity(
              opacity: 0.2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
                child: Container(
                  height: 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Palette.mainBlue,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                const Tooltip(
                  message: "Nhiệt độ",
                  child: Icon(
                    PhosphorIcons.thermometer,
                    color: Palette.elementGray,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 8),
                const Tooltip(
                  richMessage:
                      TextSpan(text: "Nhiệt độ hiện tại là ", children: [
                    TextSpan(
                      text: "29°C",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ]),
                  child: Text(
                    "29°C",
                    style: TextStyle(
                      fontSize: 24,
                      height: 1.2,
                      letterSpacing: 0.5,
                      color: Palette.mainBlue,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                const Tooltip(
                  message: "Nhiệt độ",
                  child: Icon(
                    PhosphorIcons.drop,
                    color: Palette.elementGray,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 8),
                const Tooltip(
                  richMessage: TextSpan(text: "Độ ẩm hiện tại là ", children: [
                    TextSpan(
                      text: "72%",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ]),
                  child: Text(
                    "72%",
                    style: TextStyle(
                      fontSize: 24,
                      height: 1.2,
                      letterSpacing: 0.5,
                      color: Palette.mainBlue,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Spacer(),
                ClipOval(
                  child: Material(
                    color: Colors.transparent,
                    child: IconButton(
                      tooltip: "Xem thống kê",
                      icon: const Icon(
                        PhosphorIcons.chartLine,
                        color: Palette.mainBlue,
                        size: 28,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
