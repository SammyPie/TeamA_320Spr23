import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_application_1/server.dart';

const users = {
  'ksubbaswamy@umass.edu': '12345',
  'epickard@umass.edu': 'umass',
  'dummy@umass.edu': 'dummy',
};

//the endpoint for user-authentication would be here
const url = "";

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) async {
    final loginInfo = {'username': data.name, 'password' : data.password};
    final check = await authenticate(loginInfo);
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      /*
      The code below checks the response from the GET request assuming the 
      following JSON format: {'user': boolean, 'password' : boolean}, where 
      the boolean values indicate a match for either the username or password
      */
      if(!check['user']){
        return 'User does not exist';
      } else if(!check['password']){
        return 'Password does not match';
      }
      /*
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      */
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'UScheduler',
      //logo: const AssetImage('assets/images/ecorp-lightblue.png'),
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}