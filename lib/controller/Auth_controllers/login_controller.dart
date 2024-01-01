import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_2/constans.dart';

class LoginController extends GetxController {
  BuildContext? con;
  bool obscureText = true;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email;
  String? phone;
  String? password;

  void showPassword() {
    if (obscureText == true) {
      obscureText = false;
    } else {
      obscureText = true;
    }
    update();
  }

  Future<void> login(String phone, String password) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$kBaseUrl/v1/login'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body:
            jsonEncode(<String, dynamic>{'phone': phone, 'password': password}),
      );
      Map<String, dynamic> data = jsonDecode(response.body);
      if (data['status'] == true) {
        Get.snackbar("LogIn Success", "You have been Loggedin Successfully");
        Get.offAllNamed('/MainPage');
      } else {
        if (data['errors'] == null) {
          Get.snackbar(
            "Error Happened",
            data['message'],
          );
        } else if (data['errors']['phone'] == null) {
          Get.snackbar("Error Happened", data['errors']['password']);
        } else if (data['errors']['password'] == null) {
          Get.snackbar("Error Happened", data['errors']['phone']);
        } else {
          Get.snackbar(
              "Error Happened",
              data['errors']['phone'][0] +
                  "\n" +
                  data['errors']['password'][0]);
        }
      }
    } catch (e) {
      Get.snackbar("Error Happened", e.toString());
    }
  }
}
