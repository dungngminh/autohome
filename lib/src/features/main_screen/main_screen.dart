import 'package:autohome/src/core/theme/palette.dart';
import 'package:autohome/src/features/home_page/home_screen.dart';
import 'package:autohome/src/features/schedule/schedule_screen.dart';
import 'package:autohome/src/features/scripts/scrips_screen.dart';
import 'package:autohome/src/features/settings/setting_screen.dart';
import 'package:autohome/src/features/voice/voice_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  void changeIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          HomeScreen(),
          ScheduleScreen(),
          VoiceScreen(),
          ScriptsScreen(),
          SettingScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            blurRadius: 14,
            offset: const Offset(0, -5),
            color: Palette.shadowBlack.withOpacity(0.06),
          )
        ]),
        child: BottomAppBar(
          notchMargin: 8,
          clipBehavior: Clip.hardEdge,
          shape: const CircularNotchedRectangle(),
          child: Container(
            height: 75,
            decoration: const BoxDecoration(color: Palette.backgroundColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        IconlyBold.home,
                        size: 26,
                        color: _currentIndex == 0
                            ? Palette.elementBlack
                            : Palette.elementBlue,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Trang chủ",
                        style: TextStyle(
                          letterSpacing: -0.03,
                          color: _currentIndex == 0
                              ? Palette.elementBlack
                              : Palette.elementBlue,
                        ),
                      )
                    ],
                  ),
                  onPressed: () => changeIndex(0),
                ),
                MaterialButton(
                  padding: const EdgeInsets.only(right: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        IconlyBold.timeSquare,
                        size: 26,
                        color: _currentIndex == 1
                            ? Palette.elementBlack
                            : Palette.elementBlue,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Lịch trình",
                        style: TextStyle(
                          letterSpacing: -0.03,
                          color: _currentIndex == 1
                              ? Palette.elementBlack
                              : Palette.elementBlue,
                        ),
                      )
                    ],
                  ),
                  onPressed: () => changeIndex(1),
                ),
                MaterialButton(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        IconlyBold.document,
                        size: 26,
                        color: _currentIndex == 3
                            ? Palette.elementBlack
                            : Palette.elementBlue,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Kịch bản",
                        style: TextStyle(
                          letterSpacing: -0.03,
                          color: _currentIndex == 3
                              ? Palette.elementBlack
                              : Palette.elementBlue,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () => changeIndex(3),
                ),
                MaterialButton(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        IconlyBold.setting,
                        size: 26,
                        color: _currentIndex == 4
                            ? Palette.elementBlack
                            : Palette.elementBlue,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Cài đặt",
                        style: TextStyle(
                          fontSize: 12,
                          color: _currentIndex == 4
                              ? Palette.elementBlack
                              : Palette.elementBlue,
                        ),
                      )
                    ],
                  ),
                  onPressed: () => changeIndex(4),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 14,
              offset: Offset(0, 4),
              color: Palette.shadowBlue,
            ),
          ],
          shape: BoxShape.circle,
        ),
        child: FloatingActionButton(
          backgroundColor: Palette.mainBlue,
          child: const Icon(
            IconlyBold.voice,
          ),
          onPressed: () => changeIndex(2),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
