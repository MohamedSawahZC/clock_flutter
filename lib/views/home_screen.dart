import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'clock.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE,d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) {
      offsetSign = '+';
    }
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: SafeArea(
        child: Row(
          children: [
            //TODO:Left side bar
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildMenuButton('Clock', 'assets/clock_icon.png'),
                buildMenuButton('Alarm', 'assets/alarm_icon.png'),
                buildMenuButton('Time', 'assets/timer_icon.png'),
                buildMenuButton('Stopwatch', 'assets/stopwatch_icon.png'),
              ],
            ),
            VerticalDivider(
              color: Colors.white54,
              width: 1,
            ),
            // TODO: Here is the body of screen
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(32),
                color: Color(0xFF2D2F41),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Text(
                        'Clock',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Column(
                        children: [
                          Text(
                            formattedTime,
                            style: TextStyle(color: Colors.white, fontSize: 64),
                          ),
                          Text(
                            formattedDate,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 4,
                      child: Clock(),
                    ),
                    Text(
                      'Timezone',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.language,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          'UTC' + offsetSign + timezoneString,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Padding buildMenuButton(String title, String image) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 16),
    child: MaterialButton(
      onPressed: () {},
      child: Column(
        children: [
          Image.asset(
            image,
            scale: 1.5,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            title ?? '',
            style: TextStyle(color: Colors.white, fontSize: 14),
          )
        ],
      ),
    ),
  );
}
