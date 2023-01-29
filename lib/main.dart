import 'package:flutter/material.dart';
import 'package:huis_light/ui/add_device/add_device.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "PlusSans",
      ),
      home:  const AddDevicePage(),
    );
  }
}
