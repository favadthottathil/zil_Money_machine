import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  final String apiEndPoint = 'https://fakestoreapi.com/auth/login';

  Future<bool> loginUser(String email, String password) async {
    var uri = Uri.parse(apiEndPoint);

    final response = await http.post(uri, body: {
      'username': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> storeUserData(bool value) async {
    final sharedPref = await SharedPreferences.getInstance();

    await sharedPref.setBool('userLogged', value);
  }

  Future<void> storeUserName(String value) async {
    final sharedPref = await SharedPreferences.getInstance();

    await sharedPref.setString('userMail', value);
  }

    Future<void> storeUserp(String value) async {
    final sharedPref = await SharedPreferences.getInstance();

    await sharedPref.setString('userMail', value);
  }



  Future<bool?> getUserData() async {
    final sharedPref = await SharedPreferences.getInstance();

    return sharedPref.getBool('userLogged');
  }

  

  


}
