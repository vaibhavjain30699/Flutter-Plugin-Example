import 'dart:async';

import 'package:flutter/services.dart';

class Deviceinfo {
  static const MethodChannel _channel = const MethodChannel('deviceinfo');

  static Future<String> get DeviceName async {
    final String name = await _channel.invokeMethod('getDeviceName');
    return name;
  }

  static Future<int> get BatteryLevel async {
    final int battery = await _channel.invokeMethod('getBatteryLevel');
    return battery;
  }
}
