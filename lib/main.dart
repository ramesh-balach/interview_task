import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:interview_task/utils/responsive_helper.dart';
import 'package:interview_task/view/ui/home/home_view.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ResponsiveHelper.init(context);
    return ResponsiveWrapper(
      child: MaterialApp(
        useInheritedMediaQuery: true,
        builder: DevicePreview.appBuilder,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Poppins',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: HomeView(),
      ),
    );
  }
}
