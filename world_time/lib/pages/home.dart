import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  late String location;
  late String time;
  late String myimage;
  late Color bg;

  @override
  Widget build(BuildContext context) {
    try {
      data = data.isNotEmpty
          ? data
          : ModalRoute.of(context)!.settings.arguments as Map;
      location = data["location"];
      time = data["time"];
      print(data);
    } catch (e) {
      data = data;
      location = "no location";
      time = "no time";
    }
    try {
      myimage = data["day"] ? "bg/day1.jpg" : "bg/night2.jpg";
      bg = data["day"]
          ? Color.fromARGB(255, 110, 181, 238)
          : Color.fromARGB(255, 1, 41, 73);
    } catch (e) {
      myimage = "bg/day.jpg";
      bg = Colors.blue;
    }

    return Scaffold(
        backgroundColor: bg,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(myimage), fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 200.0, 0.0, 0.0),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton.icon(
                      onPressed: () async {
                        dynamic result =
                            await Navigator.pushNamed(context, "/location");
                        setState(() {
                          data = {
                            "location": result["location"],
                            "flag": result["flag"],
                            "time": result["time"],
                            "day": result["day"],
                          };
                        });
                      },
                      icon: Icon(Icons.edit_location),
                      label: Text(
                        "Edit Location",
                        style: TextStyle(
                            // fontSize: 20.0,
                            ),
                      )),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        location,
                        style: TextStyle(
                          fontSize: 25.0,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
