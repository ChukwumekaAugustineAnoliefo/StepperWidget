import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeStatefulWNameState();
}

class _HomeStatefulWNameState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //  title: const Text('Stepper'),
        actions: <Widget>[
          Stepper(
            type: StepperType.horizontal,
            steps: getSteps(),
          )
        ],
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          title: Text('Account'),
          content: Container(),
        ),
        Step(
          title: Text('Account'),
          content: Container(),
        ),
        Step(
          title: Text('Account'),
          content: Container(),
        ),
      ];
}
