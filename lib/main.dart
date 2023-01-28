import 'package:flutter/material.dart';
import 'package:huis_light/ui/kitchen_page/kitchen_page.dart';


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
      home:  const KitchenPage(),
    );
  }
}
