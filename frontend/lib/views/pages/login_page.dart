import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get_it/get_it.dart';

import '../../view_models/login_viewmodel.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginViewModel _loginViewModel = GetIt.instance<LoginViewModel>(); // Get an instance of LoginViewModel using GetIt

  //the functions of the FlutterLogin widget
  Future<String?> _signupUser(SignupData data) async {
    //creates new user
    return await _loginViewModel.validateEmail(data);
  }

  Future<String?> _loginUser(LoginData data) async {
    //existing user
    return await _loginViewModel.loginUser(data);
  }

  Future<String?> _recoverPassword(String name) async {
    //new password (needs to confirm recovery)
    return await _loginViewModel.recoverPassword(name);
  }

  Future<String?>? _confirmRecover(String code, LoginData data) async {
    //if recovery code is correct then allow change of password else error
    if (code == _loginViewModel.recoveryCode) {
      return await _loginViewModel.changeUserPassword(data);
    }
    return "Given verification code is incorrect";
  }

  Future<String?>? _confirmSignUp(String code, LoginData data) async {
    //if verification code is correct then allow new user sign up else error
    if (code == _loginViewModel.verificationCode) {
      return await _loginViewModel.signUpUser(data);
    }
    return "Given verification code is incorrect";
  }

  Future<String?>? _resendCode(SignupData data) async {
    return await _loginViewModel.validateEmail(data);
  }

  @override
  Widget build(BuildContext context) {
    // Check if the user is already logged in then navigate to homepage
    _loginViewModel.isLoggedIn.then((value) => {
      if (value) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const HomePage(),
        ))
      }
    });

    //returned obj
    return FlutterLogin(
      onRecoverPassword: _recoverPassword,
      onLogin: _loginUser,
      onSignup: _signupUser,
      onConfirmSignup: _confirmSignUp,
      onResendCode: _resendCode,
      onConfirmRecover: _confirmRecover,
      title: 'UScheduler',
      onSubmitAnimationCompleted: () {
        //navigates to homepage if login is successful
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
      },
    );
  }
}
