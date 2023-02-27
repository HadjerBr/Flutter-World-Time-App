import 'package:flutter/material.dart';
import "package:world_time/services/world_time.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Future<void> makeWorldTime() async {
    WorldTime instance = WorldTime(
        location: "Istanbul", flag: "Istanbul.png", url: "Europe/Istanbul");
    await instance.getTime();
    Navigator.pushReplacementNamed(context, "/", arguments: {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "day": instance.day,
    });
  }

  @override
  void initState() {
    super.initState();
    makeWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SpinKitFadingCircle(
        color: Colors.blue,
        size: 80.0,
      ),
    ));
  }
}
