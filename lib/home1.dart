import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class notMyApp extends StatelessWidget {
_tapButton(){
  debugPrint("Yerr issa boy faze jarvis");
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Floyd finna winna'),

        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.email), onPressed: _tapButton),
          IconButton(icon: Icon(Icons.access_alarm_rounded), onPressed: () => debugPrint("yerrrrrrrrrr"))
        ],
      ),
        backgroundColor: Colors.deepPurple,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            custombutton()
          ],
        ),


      )
    );
  }
}
class custombutton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        final snackBar = SnackBar(content: Text("Hello Again"),
        backgroundColor: Colors.amberAccent,);

        Scaffold.of(context).showSnackBar(snackBar);
      },

      child: Container(
        padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
          color: Colors.deepOrangeAccent,
          borderRadius: BorderRadius.circular(8.0)
      ),
    child: Text("Button"),
      )
    );
  }
}
