package com.example.foodcourt

import android.os.Bundle
import com.umeng.analytics.MobclickAgent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine( flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }


   override protected fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        com.example.umeng_sdk.UmengSdkPlugin.setContext(this)
        android.util.Log.i("UMLog", "onCreate@MainActivity")
    }


    override protected fun onPause() {
        super.onPause()
        MobclickAgent.onPause(this)

        android.util.Log.i("UMLog", "onPause@MainActivity")
    }


    override protected fun onResume() {
        super.onResume()
        MobclickAgent.onResume(this)
        android.util.Log.i("UMLog", "onResume@MainActivity")
    }
}