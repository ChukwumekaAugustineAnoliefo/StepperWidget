import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeStatefulWNameState();
}

class _HomeStatefulWNameState extends State<Home> {
  int currentStep = 0;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final address = TextEditingController();
  final postcode = TextEditingController();
  bool isCompleted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(primary: Colors.red),
          //  scaffoldBackgroundColor: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Stack(
            children: [
              SizedBox(
                height: 30,
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
              Stepper(
                type: StepperType.horizontal,
                steps: getSteps(),
                currentStep: currentStep,
                onStepContinue: () {
                  setState(
                    () {
                      final isLastStep = currentStep == getSteps().length - 1;

                      if (isLastStep) {
                        setState(() {
                          isCompleted = true;
                        });
                        print('completed');
                      } else {
                        currentStep += 1;
                      }
                    },
                  );
                },
                onStepTapped: (step) => setState(() {
                  currentStep = step;
                }),
                onStepCancel: () {
                  setState(() {
                    if (currentStep > 0) {
                      currentStep -= 1;
                    } else {
                      currentStep = 0;
                    }
                  });
                },
                controlsBuilder: (context, ControlsDetails controlsDetails) {
                  final isLastStep = currentStep == getSteps().length - 1;
                  return Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            child: Text(isLastStep ? 'CONFIRM' : 'NEXT'),
                            onPressed: controlsDetails.onStepContinue,
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        if (currentStep != 0)
                          Expanded(
                            child: ElevatedButton(
                              child: Text('BACK'),
                              onPressed: controlsDetails.onStepCancel,
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIsCompleted(BuildContext context) {
    return Container();
  }

  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: Text(''),
          content: Column(
            children: [
              TextFormField(
                controller: firstName,
                decoration: InputDecoration(
                  labelText: ('First Name'),
                ),
              ),
              TextFormField(
                controller: lastName,
                decoration: InputDecoration(
                  labelText: ('Last Name'),
                ),
              )
            ],
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: Text(''),
          content: Column(
            children: [
              TextFormField(
                controller: address,
                decoration: InputDecoration(
                  labelText: ('Adress'),
                ),
              ),
              TextFormField(
                controller: postcode,
                decoration: InputDecoration(
                  labelText: ('Postal Code'),
                ),
              )
            ],
          ),
        ),
        Step(
          // state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: Text(''),
          content: Column(
            children: [
              Row(
                children: [
                  Text('First Name: '),
                  Text(firstName.text),
                ],
              ),
              Row(
                children: [
                  Text('Last Name: '),
                  Text(lastName.text),
                ],
              ),
              Row(
                children: [
                  Text('Address: '),
                  Text(address.text),
                ],
              ),
              Row(
                children: [
                  Text('Postal Code: '),
                  Text(postcode.text),
                ],
              ),
            ],
          ),
        ),
      ];
}
