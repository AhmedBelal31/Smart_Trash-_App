import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_trash/network/remote/LoginDioHelper.dart';
import 'package:smart_trash/network/remote/cache%20helper.dart';
import 'package:smart_trash/register/register_cubit/states.dart';
import '../../Login/model/loginModel.dart';
import '../../constant/const.dart';
import '../../network/End_Points.dart';
class Registercubit extends Cubit<RegisterStates>
{

  Registercubit() : super (registerInitialState()) ;

  static Registercubit get(context) => BlocProvider.of(context) ;

  bool isPassword =true ;
  IconData Suffix =Icons.visibility ;
  void registershowpassword ()
  {
    isPassword = !isPassword ;
    Suffix = isPassword ? Icons.visibility : Icons.visibility_off ;
    emit(registershowpasswordState ());
  }


//Build registercubit

LoginModel? UserModel ;
void userRegister(
  {
    required String name ,
    required String email ,
    required String password ,
    required String phone ,
}
    )
{
  LoginDioHelper.postData(url:REGISTER , data:{
    'name' : name ,
    'email' : email ,
    'password' : password ,
    'phone' : phone
  }
  ).then((value) {
    UserModel = LoginModel.fromJson(value.data);
    print(value.data);
    emit(registerSuccessState(loginModel:UserModel! ));
  }).catchError((error ){
    print("Dio Helper Error IS ${error.toString()} ");
  });
}

//Get User Data

void getData ()
{
LoginDioHelper.getData(url: PROFILE,token: token
).then((value) {
  UserModel = LoginModel.fromJson(value.data);
  print("My Name Is ${UserModel!.data!.name}");
  print("Your Token IS ${token}");
  emit(registerSuccessState(loginModel:UserModel! ));
});
}












  //Create Database
  // Database? database ;
  // void createDatabase() async
  // {
  //   database = await openDatabase(
  //       'database1 ' ,
  //       version:  1 ,
  //       onCreate:(database , version)
  //       {
  //         database.execute('CREATE TABLE shop (id INTEGER PRIMARY KEY , username TEXT , email TEXT ,password TEXT ,phone TEXT )').then(
  //                 (value) {
  //               print("DataBase CREATED");
  //             }).catchError((error){
  //           print("Error Occured! ${error}");
  //         });
  //       },
  //       onOpen: (database)
  //       {
  //
  //         getDatabase(database);
  //         print("Database Onpened");
  //       }
  //   )  ;
  //
  // }
  // insertIntoDataBase(
  //     {required String username,
  //       required String email,
  //       required String password,
  //       required String phone}) async
  // {
  //   return await database!.transaction((txn) async{
  //     await txn.rawInsert('INSERT INTO shop(username ,email ,password , phone ) Values("$username","$email","$password" , "$phone")').then((value){
  //       print("${value} Row Inserted Successfuly ");
  //       emit(insertdatabaseState());
  //       print(email);
  //     }).catchError((error){
  //       print("Error Happened ${error.toString()}");
  //     });
  //
  //   });
  // }
  //
  // List<dynamic> email =[];
  // List<dynamic> password =[];
  // getDatabase (database)
  // {
  //   emit(getdatabaseState());
  //   database!.rawQuery('SELECT * FROM shop ').then( (value)
  //   {
  //     value.forEach((element) {
  //
  //       email.add(element['email']);
  //       password.add(element['password']);
  //
  //     });
  //     print(email);
  //     print(password);
  //   }
  //
  //   );
  //
  //   emit(getdatabaseState());
  // }





}