import 'package:flutter/material.dart'; 
import 'package:url_launcher/url_launcher.dart';
import 'Contact.dart';
import 'Profile.dart';
import 'Service.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    theme: ThemeData.dark(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyhomePageState createState() => MyhomePageState();
}

class MyhomePageState extends State<MyApp> {
  int currentIndex = 1;
  // ignore: missing_return
  Widget getCurrentFragment() {
    switch (currentIndex) {
      case 1:
        return Profile();
      case 2:
        return Service();
      case 3:
        return Contact();

        break;
    }
  }

  setCurrentIndex(int index) {
    // ignore: missing_return
    setState(() {
      currentIndex = index;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(top: 40.0, left: 20.0),
              color: Colors.blue,
              height: 250.0,
              width: double.infinity,
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.account_circle,
                      size: 100.0,
                      color: Colors.white70,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text("JAYA PRASAD",
                        style:
                            TextStyle(color: Colors.white70, fontSize: 20.0)),
                    Text("email:justice_Of_peace@yahoo.com",
                        style: TextStyle(color: Colors.white30, fontSize: 10.0))
                  ])),
          ListTile(
            selected: currentIndex == 1 ? true : false,
            onTap: () {
              setCurrentIndex(1);
            },
            leading: Icon(Icons.account_circle),
            title: new Text("Appliances Control"),
          ),
          ListTile(
            selected: currentIndex == 2 ? true : false,
            onTap: () {
              setCurrentIndex(2);
            },
            leading: Icon(Icons.security),
            title: new Text("Appliances Status"),
          ),
          ListTile(
            selected: currentIndex == 3 ? true : false,
            onTap: () {
              setCurrentIndex(3);
            },
            leading: Icon(Icons.dashboard),
            title: new Text("DashBoard"),
          ),
          ListTile(
            
            onTap: () {
              _makingPhoneCall();
            },
            leading: Icon(Icons.phone),
            title: new Text("Contact"),
          )
        ],
      )),
      appBar: AppBar(
        title: Row(
          children: [
            Text("Flutter app"),
            SizedBox(
              width: 130,
            ),
            Image.asset("assets/JP_officiallogo.png",
                width: 50,
                height: 50,
                alignment: Alignment.bottomRight,
                fit: BoxFit.fill),
          ],
        ),
      ),
      body: getCurrentFragment(),
    );
  }

  _makingPhoneCall() async {
    const url = 'tel:+919080059962';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
