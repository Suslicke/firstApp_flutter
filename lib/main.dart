import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Domain/Operation.dart';
import 'package:flutter_application_1/Domain/calculations.dart';
import 'package:flutter_application_1/Presentor/UI/Factory/controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Color.fromARGB(255, 171, 5, 5),
            secondary: Color.fromARGB(255, 176, 0, 0),
          ),
        ),
        home: MyHomePage(title: 'Calculate'),
      );
    } else if (Platform.isAndroid) {
      return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Color.fromARGB(255, 0, 0, 0),
            secondary: Color.fromARGB(255, 56, 56, 56),
          ),
        ),
        home: MyHomePage(title: 'Calculate'),
      );
    } else {
      return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Color.fromARGB(255, 225, 248, 20),
            secondary: Color.fromARGB(255, 135, 220, 9),
          ),
        ),
        home: MyHomePage(title: 'Calculate'),
      );
    }
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double? num1;
  double? num2;
  double? result;
  Operation? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Row(
                      children: [
                        Flexible(
                            child: TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: "First number",
                          ),
                          keyboardType: TextInputType.numberWithOptions(
                            signed: false,
                            decimal: true,
                          ),
                          onChanged: (value) {
                            num1 = double.tryParse(value);
                          },
                        )),
                        VerticalDivider(),
                        UIController.getFabric()!.getDDButton(
                            value: dropdownValue,
                            items: Calculations.getAllOperations()
                                .map(
                                  (value) => DropdownMenuItem(
                                    child: Text(value.shortName()),
                                    value: value,
                                  ),
                                )
                                .toList(),
                            callBack: (value) {
                              setState(() {
                                dropdownValue = value;
                              });
                            }),
                        VerticalDivider(),
                        Flexible(
                            child: TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: "Second number",
                          ),
                          keyboardType: TextInputType.numberWithOptions(
                            signed: false,
                            decimal: true,
                          ),
                          onChanged: (value) {
                            num2 = double.tryParse(value);
                          },
                        ))
                      ],
                    ),
                  ),
                  Text("Result: "),
                  Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Text(result != null ? result.toString() : "",
                          style: TextStyle(
                            fontSize: 35,
                          )))
                ],
              )),
              UIController.getFabric()!.getButton(
                title: "Get reuslt",
                callBack: () {
                  setState(() {
                    if (dropdownValue != null) {
                      result = dropdownValue!.operation(num1, num2);
                    }
                    // result = num1;
                  });
                },
              )
              // ElevatedButton(
              //   onPressed: () {
              //     setState(() {
              //       if (dropdownValue != null) {
              //         result = dropdownValue!.operation(num1, num2);
              //       }
              //       // result = num1;
              //     });
              //   },
              //   child: Text("Get result"),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
