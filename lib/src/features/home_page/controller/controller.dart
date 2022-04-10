// Future<void> createNewSchedule() async {
//     try {
//       final formData = FormData.fromMap(<String, String>{
//         "device": "Led0",
//         "devicestatus": "On",
//         "timesettings": "35",
//       });
//       final Response<String> response =
//           await injector.get<Dio>().post("/schedule/cron", data: formData);
//       if (response.statusCode == 200) {
//         AppUtils.logger(response.data!, location: runtimeType);
//       } else {
//         AppUtils.logger(response.data!, location: runtimeType, isError: true);
//       }
//     } catch (e) {
//       AppUtils.logger(e, location: runtimeType, isError: true);
//       rethrow;
//     }
//   }

// Future<void> createNewDevice() {}

import 'package:autohome/src/features/home_page/controller/state.dart';
import 'package:autohome/src/model/device.dart';
import 'package:autohome/src/repository/data_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deviceProvider =
    AutoDisposeStateNotifierProvider<DeviceController, State<List<Device>>>(
        (ref) {
  return DeviceController(dataRepository: ref.watch(dataRepositoryProvider));
});

class DeviceController extends StateNotifier<State<List<Device>>> {
  final DataRepository dataRepository;
  DeviceController({required this.dataRepository})
      : super(const State<List<Device>>.initial()) {
    getDataDevice();
  }

  Future<void> getDataDevice() async {
    try {
      state = const State<List<Device>>.loading();
      final data = await dataRepository.getDeviceData();
      state = State<List<Device>>.loaded(data);
    } catch (e) {
      state = const State<List<Device>>.error("Error");
    }
  }
}
