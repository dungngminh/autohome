import 'package:autohome/src/core/theme/palette.dart';
import 'package:autohome/src/features/home_page/controller/device_controller.dart';
import 'package:autohome/src/features/home_page/widgets/chip_button.dart';
import 'package:autohome/src/features/home_page/widgets/device_card.dart';
import 'package:autohome/src/features/home_page/widgets/energy_usage_card.dart';
import 'package:autohome/src/features/home_page/widgets/temperature_and_humidity_card.dart';
import 'package:autohome/src/model/device.dart';
// import 'package:autohome/src/di/injector.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final PageController pageController;
  int currentPage = 0;
  late List<bool> listDeviceStatus;

  @override
  void initState() {
    pageController = PageController();
    listDeviceStatus = List.filled(3, false);
    // getAllDevice();
    super.initState();
  }

  void changePage(int value) {
    setState(() {
      currentPage = value;
    });
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < 2; i++) {
      list.add(
        i == currentPage ? _buildIndicator(true) : _buildIndicator(false),
      );
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
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => ref.read(deviceProvider.notifier).getDataDevice(),
          color: Palette.mainBlue,
          child: ListView(
            padding: const EdgeInsets.only(top: 16.0, bottom: 24.0),
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  right: 24.0,
                  bottom: 16.0,
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Mừng bạn về nhà, Nguyễn Minh Dũng',
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
                          backgroundImage:
                              AssetImage('assets/images/komkat.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 180,
                child: PageView(
                  onPageChanged: changePage,
                  children: const [
                    TemperatureAndHumidityCard(),
                    EnergyUsageCard(),
                  ],
                ),
              ),
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: _buildPageIndicator(),
              ),
              const DevicePanel(),
              DeviceCard(
                device: Device(
                  name: 'motor1',
                  location: 'Phòng khách',
                  status: 'off',
                  type: 'fan',
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                child: Material(
                  color: Palette.mainBlue,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: () async {
                      final isRefresh =
                          await Navigator.pushNamed(context, '/add');
                      if (isRefresh == null) {
                        return;
                      } else if (isRefresh as bool) {
                        await ref.read(deviceProvider.notifier).getDataDevice();
                      }
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                            color: Palette.shadowBlack.withOpacity(.1),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Thêm thiết bị mới',
                        style: TextStyle(
                          color: Palette.backgroundColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          height: 22 / 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DevicePanel extends StatefulWidget {
  const DevicePanel({Key? key}) : super(key: key);

  @override
  State<DevicePanel> createState() => _DevicePanelState();
}

class _DevicePanelState extends State<DevicePanel> {
  late List<bool> listRoomSelectedStatus;

  final listRoom = <String>[
    'Yêu thích',
    'Nhà bếp',
    'Phòng khách',
    'Phòng ngủ 1',
    'Phòng ngủ 2'
  ];

  @override
  void initState() {
    listRoomSelectedStatus = List.filled(listRoom.length, false)..first = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: ListView.separated(
            padding: const EdgeInsets.only(
              left: 24,
              top: 24,
              bottom: 16,
              right: 24,
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
        Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(deviceProvider);
            return state.maybeWhen(
              error: (errorMessage) {
                return const SizedBox();
              },
              loaded: (List<Device> devices) {
                return Column(
                  children: devices
                      .map(
                        ((device) => DeviceCard(
                              color: Colors.red,
                              device: device,
                            )),
                      )
                      .toList(),
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              orElse: () => const SizedBox(),
            );
          },
        ),
      ],
    );
  }
}
