import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:sample_app_fetching/src/app.dart' ;

import 'package:background_fetch/background_fetch.dart';
import 'package:device_preview/device_preview.dart';
import 'package:shared_preferences/shared_preferences.dart';

const EVENTS_KEY = "fetch_events";


void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.android;
  runApp(DevicePreview(builder : (context) => App(),));
}