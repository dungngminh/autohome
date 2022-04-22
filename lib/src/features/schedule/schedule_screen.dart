import 'package:autohome/src/core/common/base_state.dart';
import 'package:autohome/src/core/theme/palette.dart';
import 'package:autohome/src/features/schedule/controller/schedule_controller.dart';
import 'package:autohome/src/model/schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                  return AlertDialog(
                    title: Text(
                      "Thêm lịch trình",
                      style: TextStyle(color: Palette.mainBlue),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          ref
                              .read(scheduleSetupProvider.notifier)
                              .addSchedule(Schedule());
                        },
                        child: Text("Thêm lịch"),
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


