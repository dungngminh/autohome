enum DeviceType {
  fan,
  led,
  ledRGB,
}

const Map<String, DeviceType> mapToDeviceType = {
  "Motor": DeviceType.fan,
  "Led": DeviceType.led
};

const Map<String, bool> mapToStatus = {
  "on": true,
  "off": false,
};

const Map<bool, String> mapToAction = {
  true: "turnoff",
  false: "turnon",
};
