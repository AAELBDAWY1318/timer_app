import 'package:flutter/material.dart';
import 'package:timer_app/view/screens/timer_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const TimerPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color.fromRGBO(114, 241, 146, 1),
        ),
      ),
    );
  }
}