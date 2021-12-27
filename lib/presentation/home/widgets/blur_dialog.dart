import 'dart:ui';

import 'package:flutter/material.dart';

class BlurDialog extends StatefulWidget {
  @override
  _BlurDialogState createState() => _BlurDialogState();
}

class _BlurDialogState extends State<BlurDialog> {
  double _opacity = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _opacity = 1);
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
      child: Dialog(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Text("Hello, World!"),
        ),
      ),
    );
  }
}
