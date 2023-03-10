// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class YourLibrary extends StatelessWidget {
  const YourLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Text(
        'YourLibrary',
        style: TextStyle(fontSize: 40, color: Colors.white),
      ),
    );
  }
}
