import 'package:autohome/src/core/enum/enum.dart';
import 'package:autohome/src/model/device.dart';

const Map<String, DeviceType> deviceTypeMapping = {
  'Motor': DeviceType.fan,
  'Led': DeviceType.led
};

const Map<String, bool> statusMapping = {
  'on': true,
  'off': false,
};

const Map<bool, String> actionMapping = {
  true: 'turnoff',
  false: 'turnon',
};

extension DeviceX on Device {
  DeviceType mapToDeviceType() {
    return deviceTypeMapping[type]!;
  }

  bool mapToStatus() {
    return statusMapping[status]!;
  }
}
