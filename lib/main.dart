import 'package:bitcoin_tickler_custom/Screen/slash_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // Used for Responsive Design
      designSize:  Size(360, 712),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, widget) {
        return MaterialApp(
          theme: ThemeData.dark().copyWith(
              primaryColor: Colors.lightBlue,
              scaffoldBackgroundColor: Colors.white),

          debugShowCheckedModeBanner: false,
          home: widget,

        );
      },
      child: slash_screen(),
    );


  }
}
