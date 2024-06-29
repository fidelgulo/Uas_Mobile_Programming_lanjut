import 'package:calculator/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String screenText = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Theme.of(context).primaryColor,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(screenText,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: Colors.white)),
              ),
            ),
          ),
          GridView.count(
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            crossAxisCount: 4,
            children: [
              CalculatorButton(
                backgroundColor: const Color(0xFFdbdfe6),
                foregroundColor: const Color.fromRGBO(0, 0, 0, 1),
                text: 'C',
                onTap: () {
                  setState(() {
                    screenText = '0';
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: const Color(0xFFdbdfe6),
                foregroundColor: Colors.black,
                text: '+/-',
                onTap: () {
                  setState(() {
                    if (screenText.startsWith('-')) {
                      screenText = screenText
                          .substring(1); // Remove minus sign if already exists
                    } else {
                      screenText =
                          '-$screenText'; // Add minus sign if not exists
                    }
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: const Color(0xFFdbdfe6),
                foregroundColor: Colors.black,
                text: '%',
                onTap: () {
                  setState(() {
                    if (!screenText.contains('%')) {
                      screenText += '%';
                    }
                  });
                },
              ),
              CalculatorButton.icon(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: 'Backspace',
                icon: Icons.backspace,
                onTap: () {
                  setState(() {
                    if (screenText == '0' ||
                        screenText == '' ||
                        screenText.length == 1) {
                      screenText = '0';
                    } else {
                      screenText =
                          screenText.substring(0, screenText.length - 1);
                    }
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Color.fromRGBO(0, 0, 0, 1),
                text: '7',
                onTap: () {
                  pressNumber(7);
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                text: '8',
                onTap: () {
                  pressNumber(8);
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                text: '9',
                onTap: () {
                  pressNumber(9);
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: '/',
                onTap: () {
                  setState(() {
                    if (screenText.endsWith('+') ||
                        screenText.endsWith('-') ||
                        screenText.endsWith('x') ||
                        screenText.endsWith('/')) {
                      screenText =
                          '${screenText.substring(0, screenText.length - 1)}/';
                    } else {
                      screenText += '/';
                    }
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                text: '4',
                onTap: () {
                  pressNumber(4);
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                text: '5',
                onTap: () {
                  pressNumber(5);
                },
              ),
              CalculatorButton(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  text: '6',
                  onTap: () {
                    pressNumber(6);
                  }),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: 'x',
                onTap: () {
                  setState(() {
                    if (screenText.endsWith('+') ||
                        screenText.endsWith('-') ||
                        screenText.endsWith('x') ||
                        screenText.endsWith('/')) {
                      screenText =
                          '${screenText.substring(0, screenText.length - 1)}*';
                    } else {
                      screenText += '*';
                    }
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                text: '1',
                onTap: () {
                  pressNumber(1);
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                text: '2',
                onTap: () {
                  pressNumber(2);
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                text: '3',
                onTap: () {
                  pressNumber(3);
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: '-',
                onTap: () {
                  setState(() {
                    if (screenText.endsWith('+') ||
                        screenText.endsWith('-') ||
                        screenText.endsWith('x') ||
                        screenText.endsWith('/')) {
                      screenText =
                          '${screenText.substring(0, screenText.length - 1)}-';
                    } else {
                      screenText += '-';
                    }
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                text: '0',
                onTap: () {
                  pressNumber(0);
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                text: '.',
                onTap: () {
                  setState(() {
                    if (screenText.endsWith('.')) {
                      screenText;
                    } else {
                      screenText += '.';
                    }
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: const Color(0xFFdbdfe6),
                foregroundColor: Colors.black,
                text: '=',
                onTap: () {
                  setState(() {
                    Parser p = Parser();
                    Expression exp = p.parse(screenText);
                    ContextModel cm = ContextModel();
                    double eval = exp.evaluate(EvaluationType.REAL, cm);
                    screenText = eval.toString();
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: '+',
                onTap: () {
                  setState(() {
                    if (screenText.endsWith('+') ||
                        screenText.endsWith('-') ||
                        screenText.endsWith('X') ||
                        screenText.endsWith('/')) {
                      screenText =
                          '${screenText.substring(0, screenText.length - 1)}+';
                    } else {
                      screenText += '+';
                    }
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  void pressNumber(int number) {
    setState(() {
      if (screenText == '0') {
        screenText = '$number';
      } else {
        screenText = '$screenText$number';
      }
    });
  }
}
