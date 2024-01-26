import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medical_app/constants/ApiConst.dart';

class ApiClient {
  final httpClient = http.Client();

  Future<dynamic> callGetAPI(String endpoint) async {
    try {
      http.Response response = await http
          .post(Uri.parse("$baseURL+$validationEndpoint"), body: {
        "userName": "string",
        "password": "string"
      }); //using JWT token for WP authentication is not needed

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw jsonDecode(response.body);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> callPostAPI() async {
    try {} catch (e) {}
  }

  Future<dynamic> callDeleteAPI() async {
    try {} catch (e) {}
  }

  Future<dynamic> callPutAPI() async {
    try {} catch (e) {}
  }
}
