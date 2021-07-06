package com.example.flutter_app_vscode

import io.flutter.embedding.android.FlutterActivity
// 按两下shift 打开搜索
class MainActivity: FlutterActivity() {
}
//import android.os.Bundle
////import io.flutter.app.FlutterActivity
//import io.flutter.embedding.android.FlutterActivity
//
//import io.flutter.plugin.common.MethodChannel
//import io.flutter.plugins.GeneratedPluginRegistrant
//import android.content.Context
//import android.content.ContextWrapper
//import android.content.Intent
//import android.content.IntentFilter
//import android.os.BatteryManager
//import android.os.Build.VERSION
//import android.os.Build.VERSION_CODES
//
//class MainActivity() : FlutterActivity() {
//    private val CHANNEL = "samples.flutter.io/battery"
//
//    override fun onCreate(savedInstanceState: Bundle?) {
//        super.onCreate(savedInstanceState)
//        GeneratedPluginRegistrant.registerWith(this)
//
//        MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->
//            // TODO
//            MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->
//                if (call.method == "getBatteryLevel") {
//                    val batteryLevel = getBatteryLevel()
//                    if (batteryLevel != -1) {
//                        result.success(batteryLevel)
//                    } else {
//                        result.error("UNAVAILABLE", "Battery level not available.", null)
//                    }
//                } else {
//                    result.notImplemented()
//                }
//            }
//
//        }
//        private fun getBatteryLevel(): Int {
//            val batteryLevel: Int
//            if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
//                val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
//                batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
//            } else {
//                val intent = ContextWrapper(applicationContext).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
//                batteryLevel = intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
//            }
//
//            return batteryLevel
//        }
//    }
//}