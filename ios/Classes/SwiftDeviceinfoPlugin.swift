import Flutter
import UIKit

public class SwiftDeviceinfoPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "deviceinfo", binaryMessenger: registrar.messenger())
    let instance = SwiftDeviceinfoPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if(call.method == "getDeviceName")
    {
      let deviceName = UIDevice.current.name
      result(deviceName)
    }
    else if(call.method == "getBatteryLevel")
    {
      let batteryLevel = UIDevice.current.batteryLevel
      result(Int(batteryLevel*100))
    }
  }
}
