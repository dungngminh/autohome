import 'package:autohome/src/core/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AddDeviceScreen extends StatelessWidget {
  const AddDeviceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                      backgroundColor: Palette.elementLightGray,
                      child: Icon(PhosphorIcons.caretLeftBold,
                          color: Palette.elementBlack),
                    ),
                  ),
                  const Text(
                    "Thêm thiết bị mới",
                    style: TextStyle(
                      color: Palette.textBlack2,
                      fontSize: 22,
                      height: 28 / 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  /// Using for center Title
                  const CircleAvatar(
                    backgroundColor: Colors.transparent,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const AddDevicePanel()
          ],
        ),
      ),
    );
  }
}

class AddDevicePanel extends StatefulWidget {
  const AddDevicePanel({
    Key? key,
  }) : super(key: key);

  @override
  State<AddDevicePanel> createState() => _AddDevicePanelState();
}

class _AddDevicePanelState extends State<AddDevicePanel> {
  final _deviceTypeMapping = <String, String>{'Led': 'Đèn', 'Motor': 'Quạt'};
  // final _deviceStatusMapping = <String, String>{}
  late String _selectedDeviceType;
  late String _stringImage;
  

  late final TextEditingController _nameDeviceController;
  late final TextEditingController _locationController;


  @override
  void initState() {
    super.initState();
    _selectedDeviceType = _deviceTypeMapping.entries.first.value;
    _stringImage = _selectedDeviceType;
  }

  void onDeviceTypeChooseAction(String? newValue) {
    if (newValue is String) {
      setState(() {
        _selectedDeviceType = newValue;
        _stringImage = newValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Column(children: [
                const TextField(
                  decoration: InputDecoration(
                    hintText: "Tên thiết bị",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                DropdownButtonFormField<String>(
                  value: _selectedDeviceType,
                  decoration: const InputDecoration(
                    hintText: "Loại thiết bị",
                    border: OutlineInputBorder(),
                  ),
                  items: _deviceTypeMapping.values
                      .map<DropdownMenuItem<String>>(((e) {
                    return DropdownMenuItem(
                      child: Text(e),
                      value: e,
                    );
                  })).toList(),
                  onChanged: onDeviceTypeChooseAction,
                ),
                const SizedBox(
                  height: 8,
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: "Nơi đặt thiết bị",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: "Trạng thái",
                    border: OutlineInputBorder(),
                  ),
                ),
              ]),
            ),
            Expanded(
              flex: 3,
              child: Text(_stringImage),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 16),
          child: Material(
            color: Palette.mainBlue,
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              onTap: () {},
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
                  "Thêm thiết bị mới",
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
        )
      ],
    );
  }
}
