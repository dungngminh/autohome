import 'dart:developer';

import 'package:autohome/src/core/common/base_state.dart';
import 'package:autohome/src/core/theme/palette.dart';
import 'package:autohome/src/features/home_page/controller/device_controller.dart';
import 'package:autohome/src/features/schedule/controller/schedule_controller.dart';
import 'package:autohome/src/model/schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ScheduleScreen extends ConsumerWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<BaseState<List<Schedule>>>(
      scheduleSetupProvider,
      (_, next) {
        next.whenOrNull(error: (errorMessage) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage ?? "cac"),
            ),
          );
        }, loading: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Dang them lich"),
            ),
          );
        });
      },
    );
    final state = ref.watch(scheduleSetupProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lịch trình"),
        actions: [
          IconButton(
            icon: const Icon(PhosphorIcons.plusBold),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  List<String> deviceName = [];
                  ref.watch(deviceProvider).whenOrNull(loaded: (data) {
                    deviceName.addAll(data.map((device) => device.name));
                  });
                  final listStatus = <String>['On', 'Off'];
                  return AlertDialog(
                    title: const Text(
                      "Thêm lịch trình",
                      style: TextStyle(
                        color: Palette.mainBlue,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Consumer(builder: (context, ref, child) {
                          return DropdownButton<String>(
                            items: deviceName
                                .map((e) => DropdownMenuItem<String>(
                                      child: Text(e),
                                      value: e,
                                    ))
                                .toList(),
                            onChanged: (String? value) {
                              ref.read(deviceNameProvider.notifier).state =
                                  value!;
                              log(ref.watch(deviceNameProvider));
                            },
                            value: ref.watch(deviceNameProvider),
                          );
                        }),
                        Consumer(builder: (context, ref, child) {
                          return DropdownButton<String>(
                            items: listStatus
                                .map((e) => DropdownMenuItem<String>(
                                      child: Text(e),
                                      value: e,
                                    ))
                                .toList(),
                            onChanged: (String? value) {
                              ref.read(deviceStatusProvider.notifier).state =
                                  value!;
                            },
                            value: ref.watch(deviceStatusProvider),
                          );
                        }),
                        TextField(
                          readOnly:
                              true, //set it true, so that user will not able to edit text
                          onTap: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              initialTime: TimeOfDay.now(),
                              context: context,
                            );

                            if (pickedTime != null) {
                              print(
                                  pickedTime.format(context)); //output 10:51 PM
                              DateTime parsedTime = DateFormat.jm()
                                  .parse(pickedTime.format(context).toString());
                              //converting to DateTime so that we can further format on different pattern.
                              print(
                                  parsedTime); //output 1970-01-01 22:53:00.000
                              String tempTime =
                                  DateFormat('mm:HH').format(parsedTime);
                              final temp = tempTime.split(':');
                              String formattedTime = temp[0];
                              ':' + temp[1];
                              log(formattedTime); //output 14:59:00
                              //DateFormat() is from intl package, you can format the time on any pattern you need.

                            } else {
                              print("Time is not selected");
                            }
                          },
                        )
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Thêm",
                          style: TextStyle(
                              color: Palette.mainBlue,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Hủy",
                          style: TextStyle(color: Palette.mainBlue),
                        ),
                      )
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
      body: Center(
        child: state.whenOrNull(
          loaded: (data) {
            return data.isEmpty
                ? const Text("No schedule here")
                : ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(data[index].device),
                      );
                    },
                  );
          },
        ),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     TextButton(
        //       onPressed: () {},
        //       child: const Text("show"),
        //     )
        //   ],
        // ),
      ),
    );
  }
}

// class ScheduleScreen extends StatefulWidget {
//   const ScheduleScreen({Key? key}) : super(key: key);

//   @override
//   State<ScheduleScreen> createState() => _ScheduleScreenState();
// }

// class _ScheduleScreenState extends State<ScheduleScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("ScheduleScreen"),
//       ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       TextButton(
      //         onPressed: () {},
      //         child: const Text("show"),
      //       )
      //     ],
      //   ),
      // ),
//     );
//   }
// }


