import 'package:flutter/material.dart';
import 'package:world_clock/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London');
    await instance.getTime();

    if(!mounted) return;
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location' :instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDaytime' : instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff000000),
      body: Center(
      child: SpinKitFadingCircle(
        color: Color.fromARGB(255, 20, 100, 190),
        size: 100.0,
      ),
      ),
    );
  }
}