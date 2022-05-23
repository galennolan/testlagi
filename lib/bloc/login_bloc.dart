import 'dart:convert';

import 'package:testlagi/helpers/api.dart';
import 'package:testlagi/helpers/api_url.dart';
import 'package:testlagi/model/login.dart';

class LoginBloc {
  static Future<Login> login({String? email, String? password}) async {
    String apiUrl = ApiUrl.login;
    var body = {"email": email, "password": password};
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    print(jsonObj);
    return Login.fromJson(jsonObj);
  }
}
