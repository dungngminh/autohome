import 'package:autohome/src/core/theme/palette.dart';
import 'package:flutter/material.dart';

class ChipButton extends StatelessWidget {
  const ChipButton({
    Key? key,
    required this.isSeleted,
    required this.roomName,
    required this.onChipAction,
  }) : super(key: key);

  final bool isSeleted;
  final String roomName;
  final VoidCallback onChipAction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChipAction,
      borderRadius: BorderRadius.circular(32),
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Palette.backgroundColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              offset: const Offset(0, 4),
              color: Palette.shadowBlack.withOpacity(0.06),
            ),
          ],
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 100),
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            height: 22 / 15,
            color: isSeleted ? Palette.textBlack : Palette.textGray,
          ),
          child: Center(
            child: Text(roomName),
          ),
        ),
      ),
    );
  }
}
