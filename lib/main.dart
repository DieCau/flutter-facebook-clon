import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:facebook_clon/pages/facebook.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (_) => const MyApp(),
      enabled: !kReleaseMode,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
      debugShowCheckedModeBanner: false,
      home: const FacebookPage(),
      theme: ThemeData(fontFamily: 'Nunito',),
    );
  }
}
