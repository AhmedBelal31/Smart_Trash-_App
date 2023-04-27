import '../model/loginModel.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginonchangeState extends LoginStates {}

class LoginshowpasswordState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final LoginModel loginModel;

  LoginSuccessState({required this.loginModel});
}

class ProfileSuccessState extends LoginStates {
  final LoginModel loginModel;

  ProfileSuccessState({required this.loginModel});
}

class UpdateSuccessState extends LoginStates {
  final LoginModel loginModel;

  UpdateSuccessState({required this.loginModel});
}

class ChangeSuccessState extends LoginStates {
  final LoginModel loginModel;

  ChangeSuccessState({required this.loginModel});
}

class LoginErrorState extends LoginStates {
  final String error;

  LoginErrorState(this.error);
}

class ThemeState extends LoginStates {}

//SQFLITE DataBASE

class createdatabaseState extends LoginStates {}

class insertdatabaseState extends LoginStates {}

class getdatabaseState extends LoginStates {}
