import 'package:flutter/material.dart';

class bizcard extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deez"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
               _getCard(),
              _getAvatar()
            ]
        ),
      ),
    );
  }

  Container _getCard() {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.all(50.0),
      decoration: BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.circular(14.5)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Praneeth Gundapu",
          style: TextStyle( fontSize: 20.9,
          color:Colors.white,
          fontWeight: FontWeight.w500),),
          Text("praneethgundapu04@gmail.com"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.person_outline),
              Text("Youtube: Praneeth Gundapu")
            ]
          )
        ]
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        border: Border.all(color: Colors.redAccent, width:1.5),
        image: DecorationImage(image: NetworkImage("https://picsum.photos/300/300"),
        fit: BoxFit.cover)
      ),
    );

  }
}
