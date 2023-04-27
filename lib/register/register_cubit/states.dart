import '../../Login/model/loginModel.dart';


abstract class RegisterStates {}

class registerInitialState extends RegisterStates{}

class registeronchangeState extends RegisterStates{}
class registershowpasswordState extends RegisterStates{}

class registerLoadingState extends RegisterStates{}

class registerSuccessState extends RegisterStates
{
final LoginModel loginModel ;
registerSuccessState({required this.loginModel});
}

class registerErrorState extends RegisterStates{
  final String error ;
  registerErrorState(this.error);

}

class ThemeState extends RegisterStates{}

//SQFLITE DataBASE

class createdatabaseState extends RegisterStates{}
class insertdatabaseState extends RegisterStates{}
class getdatabaseState extends RegisterStates{}