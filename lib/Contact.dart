import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class Contact extends StatelessWidget {
  final dbRef = FirebaseDatabase.instance.reference();
  
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Column(
        children: [
          StreamBuilder(
              stream: dbRef.onValue,
              builder: (context, snapshot) {
                if (snapshot.hasData && !snapshot.hasError) {
                  return Column(
                    children: [
                       SizedBox(
                      height: 40.0,
                    ),
                      Column(
                        children: [
                           Row(
            children: [
              SizedBox(
                width: 100.0,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  SizedBox(
                    width: 150.0,
                    height: 150.0,
                    child: LiquidCircularProgressIndicator(
                      value: 0.65, // Defaults to 0.5.
                      valueColor: AlwaysStoppedAnimation(Colors
                          .blue), // Defaults to the current Theme's accentColor.
                      backgroundColor: Colors
                          .white, // Defaults to the current Theme's backgroundColor.
                      borderColor: Colors.blue,
                      borderWidth: 2.0,
                      direction: Axis
                          .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                      center: Text(
                        snapshot.data.snapshot.value['Water Level']
                                      .toString() +"%",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Text(
                    "Water Level",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 10.0),
              Column(
                children: [
                  SizedBox(
                    width: 50.0,
                    height: 200.0,
                    child: LiquidLinearProgressIndicator(
                      value: 0.6, // Defaults to 0.5.
                      valueColor: AlwaysStoppedAnimation(Colors
                          .pink), // Defaults to the current Theme's accentColor.
                      backgroundColor: Colors
                          .white, // Defaults to the current Theme's backgroundColor.
                      borderColor: Colors.red,
                      borderWidth: 2.0,
                      borderRadius: 20,
                      direction: Axis
                          .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                      center: Text(
                        snapshot.data.snapshot.value['Room Temperature']
                                      .toString()+"*C",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Text("Temperature",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(width: 20.0),
              Column(
                children: [
                  SizedBox(
                    width: 50.0,
                    height: 200.0,
                    child: LiquidLinearProgressIndicator(
                      value: 0.75, // Defaults to 0.5.
                      valueColor: AlwaysStoppedAnimation(Colors
                          .pink), // Defaults to the current Theme's accentColor.
                      backgroundColor: Colors
                          .white, // Defaults to the current Theme's backgroundColor.
                      borderColor: Colors.red,
                      borderWidth: 2.0,
                      borderRadius: 20,
                      direction: Axis
                          .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                      center: Text(
                        snapshot.data.snapshot.value['Voltage']
                                      .toString()+"V",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Text(
                    "Voltage",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(width: 30.0),
              Column(
                children: [
                  SizedBox(
                    width: 50.0,
                    height: 200.0,
                    child: LiquidLinearProgressIndicator(
                      value: 0.75, // Defaults to 0.5.
                      valueColor: AlwaysStoppedAnimation(Colors
                          .pink), // Defaults to the current Theme's accentColor.
                      backgroundColor: Colors
                          .white, // Defaults to the current Theme's backgroundColor.
                      borderColor: Colors.red,
                      borderWidth: 2.0,
                      borderRadius: 20,
                      direction: Axis
                          .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                      center: Text(
                        snapshot.data.snapshot.value['Current']
                                      .toString()+"A",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Text(
                    "Current",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          )
                    ]
                  )
                    ]);
                } else {
                  return new Container(
                    child: new Text("No Internet"),
                  );
                }
              }),
         
        ],
      ),
    );
  }
// ignore: missing_return
String read(){
  dbRef.once().then((DataSnapshot datasnapshot) {
   return datasnapshot.value['Fan'].toString();});
}
}
