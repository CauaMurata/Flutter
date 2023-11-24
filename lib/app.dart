import 'package:flutter/material.dart';
import 'view/list_car.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme:
              ColorScheme.fromSeed(seedColor: Colors.lightBlue.shade400)),
      home: ListCars(),
    );
  }
}
