import 'package:flutter/material.dart';
class myApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.lightBlueAccent,
        child: Center(
            child: Text('Hallo Flaateer', textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 23.4,
                  fontStyle: FontStyle.italic
              ),)
        )

    );
  }
}
