import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_app/bloc/timer_bloc.dart';
import 'package:timer_app/data/ticker.dart';
import 'package:timer_app/view/widgets/background.dart';
import 'package:timer_app/view/widgets/timer_text.dart';
import 'package:timer_app/view/widgets/actions.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerBloc(ticker: const Ticker()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 132, 191, 240),
          title: const Center(
            child: Text(
              "Timer App",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: const Stack(
          children: [
            BackGround(),
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100.0),
                child: Center(child: TimerText()),
              ),
              CustomActions(),
            ],
          ), 
          ],
        ),
      ),
    );
  }
}
