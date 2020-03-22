import 'dart:async';

import 'package:flutter/services.dart';

class Deviceinfo {
  static const MethodChannel _channel = const MethodChannel('deviceinfo');

  // for fetching the device name asynchronously
  static Future<String> get DeviceName async {
    final String name = await _channel.invokeMethod('getDeviceName');
    return name;
  }

  // for fetching the battery level asynchronously
  static Future<int> get BatteryLevel async {
    final int battery = await _channel.invokeMethod('getBatteryLevel');
    return battery;
  }
}
