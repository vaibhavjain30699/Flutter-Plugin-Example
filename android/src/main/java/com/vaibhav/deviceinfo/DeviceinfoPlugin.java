package com.vaibhav.deviceinfo;

import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;

import androidx.annotation.NonNull;

import java.util.ArrayList;
import java.util.List;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** DeviceinfoPlugin */
public class DeviceinfoPlugin implements FlutterPlugin, MethodCallHandler {

  private static Context context;

  // As we know that one of the methods from onAttachedToEngine or registerWith is called
  // so in both the methods, we have initialized the context.
  // Otherwise, it may result into a null value.

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    final MethodChannel channel = new MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "deviceinfo");
    context = flutterPluginBinding.getApplicationContext();
    channel.setMethodCallHandler(new DeviceinfoPlugin());
  }

  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "deviceinfo");
    context = registrar.context();
    channel.setMethodCallHandler(new DeviceinfoPlugin());
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getDeviceName")) {
      String _name = getDeviceName();
      result.success(_name);
    }
    else if(call.method.equals("getBatteryLevel")) {
      int _level = getBatteryLevel();
      result.success(_level);
    }
    else{
      result.notImplemented();
    }
  }

  // Method to get the Device name using the Build Class.
  private String getDeviceName(){
    String name;
    name = (Build.DEVICE);
    return name;
  }

  // Method to get the Battery Level Percentage using the BatteryManager Class.
  private int getBatteryLevel(){
    int level = -1;
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
      BatteryManager batteryManager = (BatteryManager) context.getSystemService(Context.BATTERY_SERVICE);
      level  = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
    }
    else{
      //BatteryManager class works on Android Lollipop and above
      //So, for devices below Lollipop, we need the below code to be excecuted.
      IntentFilter iFilter = new IntentFilter(Intent.ACTION_BATTERY_CHANGED);
      Intent batteryStatus = context.registerReceiver(null, iFilter);
      level = batteryStatus != null ? batteryStatus.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) : -1;
      int scale = batteryStatus != null ? batteryStatus.getIntExtra(BatteryManager.EXTRA_SCALE, -1) : -1;

      double batteryPct = level / (double) scale;

      //As the value of batterPct is between 0 and 1, we need to mulltiply the results with 100 ans cast the result to int
      level = (int) (batteryPct * 100);
    }

    return level;
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
  }
}
