import 'package:flutter/material.dart';
import 'package:sugeng_avenue/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sugeng Avenue',
      theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
      ).copyWith(secondary: Colors.blue[800]),
      useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

