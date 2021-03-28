import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';


class Service extends StatefulWidget {
  @override
  ServiceState createState() => ServiceState();
}

class ServiceState extends State<Service> {
  final dbRef = FirebaseDatabase.instance.reference();

  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        title: Text('Appliances Status'),
        
      ),
      
      body: Row(
        
        
        children: <Widget>[
          
         
        SizedBox(
                      width: 80.0,
                    ),
          StreamBuilder(
              stream: dbRef.onValue,
              builder: (context, snapshot) {
                if (snapshot.hasData && !snapshot.hasError) {
                  return Column(
                    children: [
                       SizedBox(
                      height: 80.0,
                    ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Fan :" +
                                  snapshot.data.snapshot.value['Fan']
                                      .toString(), // dummy value
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Lamp :" +
                                  snapshot.data.snapshot.value['Lamp']
                                      .toString(), // dummy value
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "WaterPump :" +
                                  snapshot.data.snapshot.value['WaterPump']
                                      .toString(), // dummy value
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Room Temperature :" +
                                  snapshot
                                      .data.snapshot.value['Room Temperature']
                                      .toString()+"C", // dummy value
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Voltage :" +
                                  snapshot.data.snapshot.value['Voltage']
                                      .toString()+"V", // dummy value
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                           Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Current :" +
                                  snapshot.data.snapshot.value['Current']
                                      .toString()+"A", // dummy value
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Room Light :" +
                                  snapshot.data.snapshot.value['Room Light']
                                      .toString(), // dummy value
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Water Level :" +
                                  snapshot.data.snapshot.value['Water Level']
                                      .toString(), // dummy value
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          
                        ],
                      ),
                    ],
                  );
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
}
