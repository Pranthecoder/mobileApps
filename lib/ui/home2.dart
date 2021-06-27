import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class BillSplitter extends StatefulWidget {

  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: <Widget>[
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
                color: Colors.indigo
              ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Total price squiggz", style: TextStyle(
                        color: Colors.white
                      ),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("\$ ${calculateTotalPerPerson(_billAmount, _personCounter, _tipPercentage)}",
                //       child: Text("\$ ${calculateTotalPerPerson(calculateTotalTip(_billAmount, _personCounter, _tipPercentage),_billAmount, _personCounter)}",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize:
                            50),
                        ),
                      )
                    ],
                  ),
                )
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.blueGrey.shade100,
                  style: BorderStyle.solid
                ),
                  borderRadius: BorderRadius.circular(12.0)
              ),
              child: Column(
                children: <Widget>[
TextField(
  keyboardType: TextInputType.numberWithOptions(decimal: true),
  style: TextStyle(color: Colors.grey),
  decoration: InputDecoration(
    prefixText: "Bill Amount: ",
    prefixIcon: Icon(Icons.attach_money)
  ),
  onChanged: (String value) {
    try {
      _billAmount = double.parse(value);
    }
    catch (exception) {
      _billAmount = 0.0;
    }
  }
),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Split", style: TextStyle(
                          color: Colors.indigo
                        ),),
                        Row(
                          children: <Widget>[
                            InkWell(
                      onTap: () {
                        setState(() {
                          if (_personCounter > 1) {
                            _personCounter--;
                           }
                        });
                       },
                       child: Container(
                      width: 40.0,
                    height: 40.0, 
                         margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.indigo.withOpacity(0.8)
                      ),
                         child: Center(
                               child: Text(
                                 "-",
                                 style: TextStyle(
                                   color: Colors.lightBlueAccent,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 25.0


                                 )
                               ),
                             ),
                           ),
                         ),
                            Text("$_personCounter", style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                              fontSize: 17
                            ),),

                            InkWell(
                              onTap: (){
                                setState(() {
                                  _personCounter++;
                                });
                              },
                              child:Container(
                                width: 40.0,
                                height: 40.0,
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.indigo.withOpacity(0.8)
                                ),
                                child: Center(
                                  child: Text("+",
                                    style: TextStyle(
                                      color: Colors.lightBlueAccent,

                                      fontSize: 25.0
                                    ),

                                  ),
                                ),
                              )

                            ),





                          ],
                        ),

                      ]

                    ),


                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Center(
                          child: Text("Tip",
                            style: TextStyle(
                                color: Colors.indigo
                            ),),
                        ),
                        Text("\$ ${calculateTotalTip(_billAmount, _personCounter, _tipPercentage)}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),

                  ),

                  Column(
                    children: <Widget>[
                      Text("$_tipPercentage%"),
                      Slider(
                          min: 0,
                          max: 100,
                          activeColor: Colors.purple,
                          inactiveColor: Colors.indigo,
                          divisions: 20,

                          value: _tipPercentage.toDouble(), onChanged: (double newValue){

                               setState(() {
                                _tipPercentage = newValue.round();

                               });

                      }
                      )
                    ],
                  )










                ],
              ),
              )
          ],
        )
      ),
    );
  }
  calculateTotalPerPerson(double billAmount, int splitBy, int tipPercentage) {

    var totalPerPerson = (calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount) / splitBy;
    return totalPerPerson;
  }

  calculateTotalTip(double billAmount, int splitBy, int tipPercentage){
    double totalTip = 0.0;

    if (billAmount < 0 || billAmount.toString().isEmpty || _billAmount == null) {

    }
    else {
      totalTip = (billAmount * _tipPercentage) / 100;
    }
    return totalTip;
  }
}

class Wisdomquote extends StatefulWidget {

  @override
  _WisdomquoteState createState() => _WisdomquoteState();
}

class _WisdomquoteState extends State<Wisdomquote> {
   int _index = 0;
  List quotes = ["The greatest glory in living lies not in never falling, but in rising every time we fall. -Nelson Mandela", "The way to get started is to quit talking and begin doing. - Walt Disney", "Your time is limited, so don't waste it living someone else's life. Don't be trapped by dogma – which is living with the results of other people's thinking. - Steve Jobs", "If life were predictable it would cease to be life, and be without flavor. - Elanor Roosavelt"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 350,
                height: 200,
                margin: EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(18)
                ),

                child: Center(
                  child: Text(quotes[_index % quotes.length],
                  style: TextStyle(fontSize: 25.0,
                    fontWeight: FontWeight.w300,),
                  ),
                ),
              ),
          Divider(thickness: 1.3,),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: FlatButton.icon(onPressed: quoteGetter,
              color: Colors.cyanAccent,
              icon: Icon(Icons.access_alarm_rounded),
              label: Text("New quote", style: TextStyle(
              ),),),

          ),

            ],
          )

          ),
      )
    );
  }

  void quoteGetter() {
    setState(() {
      _index += 1;
    });

  }
}

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;
  List quotes = [
    "The greatest glory in living lies not in never falling, but in rising every time we fall. -Nelson Mandela", "The way to get started is to quit talking and begin doing. - Walt Disney", "Your time is limited, so don't waste it living someone else's life. Don't be trapped by dogma – which is living with the results of other people's thinking. - Steve Jobs", "If life were predictable it would cease to be life, and be without flavor. - Elanor Roosavelt"
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Spot Checker"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 350,
                height: 200,
                margin: EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(14.5)

                ),
            child: Center(child: Text("The record daily highs were seen this week in parts of Arizona, California, New Mexico, Montana, Wyoming and Utah. Phoenix, which is baking in some of the U.S. West’s hottest weather, topped out at 118 degrees Thursday, while Palm Springs, California, tied its all-time high of 123 degrees – reaching that number for the first time since 1995 and the fourth time in history.",
            style: TextStyle(
              color: Colors.black,
              fontStyle: FontStyle.italic,
              fontSize: 16.5
            ))))
                ,

            Divider(thickness: 2.3,),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: FlatButton.icon(onPressed: _showQuote,
                   color: Colors.indigo,
                   icon: Icon(Icons.arrow_forward),
                  label: Text("Check info now",
                  style: TextStyle(
                    fontSize: 18.8,
                    color: Colors.blue
                  ),
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showQuote() {
    setState(() {
      _index += 1;
    });


  }

}

class bizzcard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: Text("El esta mi app"),
      centerTitle: true,
      backgroundColor: Colors.redAccent,),
      body: Container(

        color: Colors.amber,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            _bizdetails(),
            _getAvatar()
          ],
        ),
      ),



    );
  }
  Container _bizdetails(){
    return Container(
        width: 350,
        height: 200,
        margin: EdgeInsets.all(3.0),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.5),
          color:Colors.deepPurple,
      ),
        child: Column(
          children: <Widget>[

            Text("Praneeth",
          style: TextStyle(fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              fontSize: 20,
              color:Colors.white,)),
            Text("Gundapu",
                style: TextStyle(fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  color:Colors.white,)),
            Text("Student"),
            Text("***"),
            Text("63274 Lane 8238",
              style: TextStyle(fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              fontSize: 15,
              color:Colors.white,)),

            Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.phone_android_rounded),
                Text("555-555-5555")
              ],
            ),


          ],
        )
    );
  }

  Container _getAvatar(){
    return Container(
      height: 85,
      width: 85,
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        border: Border.all(color: Colors.redAccent, width: 1.2),
        image: DecorationImage(image: NetworkImage("https://lh3.googleusercontent.com/B4_znR04T7ksgu__c2F4LqvscUHZeV79vjZTw2eCjdqeBiiurtQACAOAXFoVv72i34bh1bCfCUvf_du1iXjSJHq39f_zgQKvHx4ed8hYQwiLtH3tifZ7u81fYcLjGqMC9DnJCyAE9yPnxkBYMq3m10U2Qs2fwbjdAx7DuVsqn8Uc69Zy3qDsE3j4qPmkD8XpF7s1yScO5Txc_Ay-pLjzJWZ-d1Z950oUTTaqKZvUTiE3XEGkFTCVLo4jxAgyPkT708HVhoC3JvWWWuzdiYqfzSVih8e-ED9ig_h8FikFCcicqWkqYqo6azlobS7N5-n2Q2i0KezDEZrX7t4KSBehNJVK6M6Zaa3w79UzpWZQzfiVNg7qnf79nNFvH3ZTab4-cFVQep2C-exPcTsQFtKep0irI6OqRjJvi7O-CQWh2ZM_km3mnQNFh21xZXj80G7UK8bX1alrFdi8MZHFhG3kOoZxWmXJrEc4FYcHMAWDTCQRbSpPZYCIhut5g2lSiHOOn_6Zi_11yOTuKENNY-S2Pp3y4S4y0sIJmK3l98aS1T1ef1yBb4pc9bGNPTg92wkwV22bTLwMqv4LlGs3LIix5a5fFPPCtihx947L8soLPMoljp_9BankLYjfw6-Eu2vc4v-BTGLQ5VimoZbvlip0tiLemxprfgv9s_CfWt3cB-A-UArrP2OotmtqVr2cSvUh-uTCgt3_Kx5JUlAk6jI5WaE=w1081-h720-no?authuser=0"),
        fit: BoxFit.cover)
      ),
    );
  }


}
