
import 'package:flutter/material.dart';


import 'homepage.dart';

void main(List<String> args) {
  return runApp(HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,home: SetupProfilePost(),);
  }
}