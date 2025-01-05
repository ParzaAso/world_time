import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Athens', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'locationI': instance.location,
      'flagI': instance.flag,
      'timeI': instance.time,
      'isDayTime': instance.isDayTime
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
        backgroundColor: Colors.blueAccent,
        body: Center(
          child: SpinKitFadingCube(
            color: Colors.white,
            size: 50.0,
          ),
        ));
  }
}
