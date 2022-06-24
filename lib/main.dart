import 'package:flutter/material.dart';
import 'package:stepper_widget/home.dart';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stepper Widget',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          // or from RGB

          primary: Color.fromARGB(255, 255, 255, 255),
          secondary: Color.fromARGB(255, 243, 245, 255),
        ),
      ),
      home: Home(),
    );
  }
}
