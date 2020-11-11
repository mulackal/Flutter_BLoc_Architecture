

import 'dart:io';

import 'package:device_info/device_info.dart';

class DeviceInfo {

  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  static Future<Map<String, String>> initPlatformState() async {

    Map<String, dynamic> deviceData;

    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      }
    } catch (_) {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }


    var device_id ="";
    var device_name = "";
    var platform = "";

    if (Platform.isAndroid) {
      device_id  = deviceData['androidId'];
      device_name =  deviceData['brand'];
      platform = "android";
    }else{
      device_id  = deviceData['model'];
      device_name =  deviceData['name'];
      platform = "ios";
    }

    final Map<String, String> mydataDevice = {
      "device_id": device_id,
      "device_name": device_name,
      "platform" : platform
    };

    return mydataDevice;
  }

  static Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.codename': build.version.codename,
      'board': build.board,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }

  static Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

}
