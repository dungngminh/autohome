import 'package:autohome/src/core/enum/enum.dart';
import 'package:autohome/src/model/device.dart';

const Map<String, DeviceType> deviceTypeMapping = {
  'fan': DeviceType.fan,
  'led': DeviceType.led
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
  DeviceType get mapToDeviceType {
    return deviceTypeMapping[type]!;
  }

  bool get mapToStatus {
    return statusMapping[status]!;
  }
}
