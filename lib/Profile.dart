import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Profile extends StatefulWidget {
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  final dbRef = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appliances Control'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 80.0,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 70.0,
              ),
              Text(
                'Lamp    ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              RaisedButton(
                color: Colors.blue,
                child: Text('ON'),
                onPressed: () {
                  lamp("ON");
                },
              ),
              RaisedButton(
                color: Colors.black,
                child: Text('OFF'),
                onPressed: () {
                  lamp("OFF");
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 70.0,
              ),
              Text(
                'Fan        ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              RaisedButton(
                color: Colors.blue,
                child: Text('ON'),
                onPressed: () {
                  fan("ON");
                },
              ),
              RaisedButton(
                color: Colors.black,
                child: Text('OFF'),
                onPressed: () {
                  fan("OFF");
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 30.0,
              ),
              Text(
                'Water Pump ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              RaisedButton(
                color: Colors.blue,
                child: Text('ON'),
                onPressed: () {
                  pump("ON");
                },
              ),
              RaisedButton(
                color: Colors.black,
                child: Text('OFF'),
                onPressed: () {
                  pump("OFF");
                },
              ),
            ],
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
                              "WaterPump :" +
                                  snapshot.data.snapshot.value['WaterPump']
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
                  return new Container(child: Text("No Internet"));
                }
              }),
        ],
      ),
    );
  }

  void lamp(state) {
    dbRef.update({'Lamp': state});
    

  }

  void fan(state) {
    dbRef.update({'Fan': state,});
  }
   

  void pump(state) {
    dbRef.update({'WaterPump': state});
  }
}
