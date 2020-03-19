//import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:deviceinfo/deviceinfo.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _deviceName = "UNKNOWN";
  int _batteryLevel = 0;

  @override
  void initState() {
    super.initState();
    initBatteryLevel();  //function to get the battery level percentage
    initDeviceName();    //function to get the device name
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initDeviceName() async{
    String name;
    //Platform messages may fail, so we use a PlatformException try/catch
    try{
      name = await Deviceinfo.DeviceName;
    }on PlatformException{
      name = "Failed to get Device Name";
    }

    // If the widget was not removed from the tree while the asynchronous platform
    // message was in flight, we want to call the setState
    // to update our existent appearance.
    if(mounted){
      setState(() {
        _deviceName = name;
      });
    }
  }

  Future<void> initBatteryLevel() async{
    int battery;
    try{
      battery = await Deviceinfo.BatteryLevel;
    }on PlatformException{
      battery = -1;
    }

    if(mounted){
      setState(() {
        _batteryLevel = battery;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Device Info'),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text ("$_deviceName",
              style: TextStyle(
                fontSize: 35,
              ),),
              Text ("Batter Level : $_batteryLevel",
              style: TextStyle(
                fontSize: 20
              ),)
            ],
          )
        ),
      ),
    );
  }
}
