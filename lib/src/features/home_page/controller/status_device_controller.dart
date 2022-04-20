import 'package:autohome/src/core/extenstion/device_x.dart';
import 'package:autohome/src/model/device.dart';
import 'package:autohome/src/repository/data_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actionDeviceProvider = AutoDisposeProvider<StatusDeviceController>((ref) {
  final repo = ref.watch<DataRepository>(dataRepositoryProvider);
  return StatusDeviceController(dataRepository: repo);
});

class StatusDeviceController {
  final DataRepository dataRepository;
  StatusDeviceController({required this.dataRepository});

  Future<void> deviceAction(
      {required Device device, required bool status}) async {
    try {
      await dataRepository.doDeviceAction(
        name: device.name,
        deviceType: device.type.toLowerCase(),
        action: actionMapping[status]!,
      );
    } catch (e) {
      throw Exception();
    }
  }
}
