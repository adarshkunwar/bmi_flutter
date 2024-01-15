import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  int resultNumber = 0;

  int calculate(
      {required double height,
      required double weight,
      required int resultNumber}) {
    double result = weight / (height * height);
    resultNumber = result.round();
    return result.round();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[500],
        appBar: AppBar(
          title: const Text('BMI'),
          backgroundColor: Colors.grey[400],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('BMI',
                      style: TextStyle(
                          fontSize: 60,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 10))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: TextFormField(
                        controller: heightController,
                        keyboardType: TextInputType.phone,
                        decoration:
                            const InputDecoration(labelText: 'Height(m)'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: TextFormField(
                        controller: weightController,
                        keyboardType: TextInputType.phone,
                        decoration:
                            const InputDecoration(labelText: 'Weight(kg)'),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => setState(() {
                      resultNumber = calculate(
                          height: double.parse(heightController.text),
                          weight: double.parse(weightController.text),
                          resultNumber: resultNumber);
                    }),
                    // calculate();
                    child: const Text('Calculate'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      heightController.clear();
                      weightController.clear();
                    },
                    child: const Text('Reset'),
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text('Your BMI is: $resultNumber kg/m2',
                      style: const TextStyle(fontSize: 20))),
            ],
          ),
        ));
  }
}
