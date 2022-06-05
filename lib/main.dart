import 'package:covid19/Screen/botton_nav/bottom_nav.dart';
import 'package:covid19/Screen/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/allProvider.dart';

void main() {
  runApp(MultiProvider(
    providers: allProvider,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyNavigationBar(),
    );
  }
}
