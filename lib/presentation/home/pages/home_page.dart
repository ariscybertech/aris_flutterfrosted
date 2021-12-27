import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_frosted/presentation/home/widgets/blur_dialog.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _opacity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _setLocalOpacity();

          // ALTERNATIVELY: Fullscreen blur
          // _setDialogOpacity();
        },
        child: Icon(Icons.ac_unit),
      ),
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.network(
              "https://source.unsplash.com/random",
            ),
          ),
          AnimatedOpacity(
            duration: Duration(milliseconds: 100),
            opacity: _opacity,
            child: Align(
              alignment: Alignment.center,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.80),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.6),
                            blurRadius: 14,
                            offset: Offset(0, 10))
                      ]),
                  child: Text("Hello, World!"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _setLocalOpacity() {
    if (_opacity == 0) {
      setState(() => _opacity = 1);
    } else {
      setState(() => _opacity = 0);
    }
  }

  _setDialogOpacity() {
    showDialog(context: context, builder: (context) => BlurDialog());
  }
}
