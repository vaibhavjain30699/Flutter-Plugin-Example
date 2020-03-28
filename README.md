# deviceinfo

A Flutter plugin for iOS and Android that shows the device name and battery level percentage. <br>

## Usage

Import `package:deviceinfo/deviceinfo.dart` and then use the methods directly.

Example:
```dart
import 'package:deviceinfo/deviceinfo.dart'

String name = await Deviceinfo.DeviceName;
print('Device Name : ${name}'); // e.g. "Oneplus 7T"

int battery = await Deviceinfo.BatteryLevel;
print('Battery Level : ${battery}'); // e.g. "78"
```

<p align="center">
<img src="https://github.com/vaibhavjain30699/Flutter-Plugin-Example/blob/master/screenshots/Screenshot_20200328-215302.jpg" width="200" />
 </p>

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
