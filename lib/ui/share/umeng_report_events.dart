import 'package:flutter/cupertino.dart';
import 'package:umeng_sdk/umeng_sdk.dart';

///统计上报事件
class UmengReportEvents {
  static void Login({Map<String, dynamic> properties}) {
    UmengSdk.onEvent('Login', properties);
  }
  static void LoginOut({Map<String, dynamic> properties}) {
    UmengSdk.onEvent('LoginOut', properties);
  }

  static void onProfileSignIn({@required String pageName}){
    UmengSdk.onProfileSignIn(pageName);
  }
  static void onProfileSignOff(){
    UmengSdk.onProfileSignOff();
  }
  static void onPageStart({@required String pageName}){
    UmengSdk.onPageStart(pageName);
  }
  static void onPageEnd({@required String pageName}){
    UmengSdk.onPageEnd(pageName);
  }
}
