import "package:http/http.dart";
import "dart:convert";
import "package:intl/intl.dart";

class WorldTime {
  String location;
  late String time;
  String flag; // url to an image
  String url;
  late bool day;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);
      String dateTime = data["datetime"];
      String offset = data["utc_offset"];
      // print(dateTime);
      // print(offset);
      DateTime now = DateTime.parse(dateTime);

      now = now.add(Duration(hours: int.parse(offset.substring(1, 3))));
      // print(now);

      time = DateFormat.jm().format(now);
      day = now.hour > 6 && now.hour < 20 ? true : false;
    } catch (e) {
      print("Error $e");
      time = "Could not get time";
      day = true;
    }
  }
}
