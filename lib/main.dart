import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final MaterialColor white = const MaterialColor(
    0xFFFF6D00,
    <int, Color>{
      50: Color(0xFFFF6D00),
      100: Color(0xFFFF6D00),
      200: Color(0xFFFF6D00), //30%
      300: Color(0xFFFF6D00), //40%
      400: Color(0xFFFF6D00), //50%
      500: Color(0xFFFF6D00), //60%
      600: Color(0xFFFF6D00), //70%
      700: Color(0xFFFF6D00), //80%
      800: Color(0xFFFF6D00), //90%
      900: Color(0xFFFF6D00), //100%
    },
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[50],
        primaryColor: Colors.deepOrangeAccent,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: white,
      ),
      home: const HomeScreen(),
    );
  }
}
