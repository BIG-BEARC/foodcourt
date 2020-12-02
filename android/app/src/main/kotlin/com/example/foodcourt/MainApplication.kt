package com.example.foodcourt

import com.umeng.commonsdk.UMConfigure
import io.flutter.app.FlutterApplication
import com.umeng.analytics.MobclickAgent

class MainApplication : FlutterApplication() {

    override fun onCreate() {
        super.onCreate()
        //设置LOG开关，默认为false
        UMConfigure.setLogEnabled(true);
        //App Key会在新建应用成功时产生，App Channel自己命名
        UMConfigure.preInit(this, "5fc5fde8094d637f3130995a", "Umeng")
        UMConfigure.init(this, "5fc5fde8094d637f3130995a", "Umeng", UMConfigure.DEVICE_TYPE_PHONE, null)

        MobclickAgent.setCatchUncaughtExceptions(true);
        android.util.Log.i("UMLog", "UMConfigure.init@MainApplication")
    }
}