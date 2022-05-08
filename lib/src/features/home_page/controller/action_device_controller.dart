import 'package:autohome/src/core/extenstion/device_x.dart';
import 'package:autohome/src/repository/data_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actionDeviceProvider = AutoDisposeProvider<StatusDeviceController>((ref) {
  final repo = ref.watch<DataRepository>(dataRepositoryProvider);
  return StatusDeviceController(dataRepository: repo);
});

class StatusDeviceController {
  final DataRepository dataRepository;
  StatusDeviceController({required this.dataRepository});

  Future<void> doLedAction({
    required String nameLed,
    required bool status,
  }) async {
    try {
      await dataRepository.doLedAction(
        action: actionMapping[status]!,
        name: nameLed,
      );
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> doFanAction({
    required String nameFan,
    required int value,
  }) async {
    try {
      await dataRepository.doFanAction(
        name: nameFan,
        value: value,
      );
    } catch (e) {
      throw Exception();
    }
  }
}
