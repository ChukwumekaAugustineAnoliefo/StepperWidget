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
        scaffoldBackgroundColor: const Color(0xFF16171D),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          // or from RGB

          primary: const Color(0xFF16171D),
          secondary: const Color(0xFF16171D),
        ),
      ),
      home: Home(),
    );
  }
}
