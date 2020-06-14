import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:sample_app_fetching/src/app.dart' ;

import 'package:device_preview/device_preview.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.android;
  runApp(DevicePreview(builder : (context) => App(),));
}
