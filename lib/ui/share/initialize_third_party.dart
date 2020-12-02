import 'package:flutter/services.dart';
import 'package:umeng_sdk/umeng_sdk.dart';


class InitThirdParty {
  static void init() {
    initUmengSdk();
  }

  static Future<String> initUmengSdk() async {

    await UmengSdk.initCommon('5fc5fde8094d637f3130995a', '', 'Umeng');
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await UmengSdk.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    //设置AUTO模式采集页面数据
    UmengSdk.setPageCollectionModeManual();
    return platformVersion;
  }


}
