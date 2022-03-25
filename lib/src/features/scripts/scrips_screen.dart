import 'package:flutter/material.dart';

class ScriptsScreen extends StatelessWidget {
  const ScriptsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Scripts Screen")),
        body: const Center(child: Text("Scripts screen")));
  }
}
