import 'package:shared_preferences/shared_preferences.dart';

class LocalUser {
  var id;
  var email;
  var name;

  LocalUser();

  getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    id = pref.get("id");
    email = pref.get("email");
    name = pref.get("name");
    print("id : ${pref.get("id")}");
    print("email : ${pref.get("email")}");
    if (id == null) {
      return false;
    } else {
      return true;
    }
  }

  int getId() {
    if (id == null || id == Null) {
      return -1;
    }
    return id;
  }

  String getName() {
    if (name == Null) {
      return "";
    }
    return name;
  }
}