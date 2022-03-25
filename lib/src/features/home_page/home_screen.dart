import 'package:autohome/src/core/theme/palette.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final PageController pageController;
  int currentPage = 0;
  late List<bool> listRoomSelectedStatus;

  final listRoom = <String>[
    "Yêu thích",
    "Nhà bếp",
    "Phòng khách",
    "Phòng ngủ 1",
    "Phòng ngủ 2"
  ];

  @override
  void initState() {
    pageController = PageController();
    listRoomSelectedStatus = List.filled(listRoom.length, false)..first = true;
    super.initState();
  }

  void changePage(int value) {
    setState(() {
      currentPage = value;
    });
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < 3; i++) {
      list.add(
          i == currentPage ? _buildIndicator(true) : _buildIndicator(false));
    }
    return list;
  }

  Widget _buildIndicator(bool isChanged) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      height: 8,
      width: isChanged ? 24 : 8,
      decoration: BoxDecoration(
        color: isChanged ? Palette.textGray : Palette.textGray.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).padding.top - 24.0),
        child: ListView(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Mừng bạn về nhà, Nguyễn Minh Dũng",
                      style: TextStyle(
                        height: 28 / 22,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Palette.textBlack,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Badge(
                      position: const BadgePosition(end: 0, top: 0),
                      badgeColor: Palette.elementPink,
                      badgeContent: const SizedBox.square(
                        dimension: 6,
                      ),
                      child: const CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 28,
                        backgroundImage: AssetImage("assets/images/komkat.png"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 180,
              child: PageView(onPageChanged: changePage, children: [
                const EnergyUsageCard(),
                TemperatureAndHumidityCard(
                  key: UniqueKey(),
                ),
                TemperatureAndHumidityCard(
                  key: UniqueKey(),
                ),
              ]),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: _buildPageIndicator(),
            ),
            SizedBox(
              height: 100,
              child: ListView.separated(
                padding: const EdgeInsets.only(
                  left: 24,
                  top: 24,
                  bottom: 16,
                ),
                itemCount: listRoom.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ChipButton(
                    onChipAction: () {
                      setState(() {
                        if (!listRoomSelectedStatus[index]) {
                          listRoomSelectedStatus =
                              List.filled(listRoom.length, false);
                          listRoomSelectedStatus[index] = true;
                        }
                      });
                    },
                    roomName: listRoom[index],
                    isSeleted: listRoomSelectedStatus[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 8);
                },
              ),
            ),
            Container(
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
                            backgroundColor:
                                Palette.elementBlue.withOpacity(0.7),
                            child: const Icon(
                              PhosphorIcons.lightbulbFill,
                              color: Palette.mainBlue,
                              size: 28,
                            ),
                          ),
                          const SizedBox(width: 16),
                          const Text(
                            "Đèn chính",
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
                  const SizedBox(
                    height: 24,
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
                        richMessage:
                            TextSpan(text: "Độ ẩm hiện tại là ", children: [
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
            )
          ],
        ),
      ),
    );
  }
}
