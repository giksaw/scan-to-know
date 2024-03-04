import 'package:flutter/material.dart';
//import 'package:food_app/page1.dart';
import 'package:food_app/test.dart';
//import 'package:food_app/salman%20page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scan To Know',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(0, 224, 255, 1),),
        useMaterial3: true,
      ),
      home:  SearchPage1()
    );
    
  }
}


// class SharedVariableDemo extends StatefulWidget {
//   @override
//   _SharedVariableDemoState createState() => _SharedVariableDemoState();
// }

// class _SharedVariableDemoState extends State<SharedVariableDemo> {
//   // Define the shared variable
//   int lang = 0;
//   String name = 'name';

//   @override
//   Widget build(BuildContext context) {
//     return lang == 0 ? SearchPage1(lang: lang, commonString: commonString) : SearchPage2(lang: lang, commonString: commonString);
//  }

//   // Function to change the shared variable
//   void changeVariable(int newValue) {
//     setState(() {
//       lang = newValue;
//     });
//   }
// }