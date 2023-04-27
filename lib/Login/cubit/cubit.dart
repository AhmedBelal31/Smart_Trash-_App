import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_trash/Login/cubit/states.dart';
import 'package:smart_trash/network/remote/LoginDioHelper.dart';
import 'package:smart_trash/network/remote/cache%20helper.dart';
import 'package:sqflite/sqflite.dart';
import '../../constant/const.dart';
import '../../network/End_Points.dart';
import '../model/loginModel.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  // bool  isDark = false;
  void changeAppMode({bool? fromSharedPref}) {
    if (fromSharedPref != null) {
      isDark = fromSharedPref;
      emit(ThemeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(ThemeState());
      }).catchError((err) {
        print(err.toString());
      });
    }
  }

  //App Theme
  // bool isDark= false;
  // void changeDarkMode({bool? fromShared})
  // {
  //   if(fromShared!=null){
  //
  //     isDark=fromShared;
  //
  //     emit(ThemeState());
  //   }
  //   else
  //   {
  //     isDark=!isDark;
  //     CashHelper.putBool(key: 'isDark', value: isDark).
  //     then((value) {
  //       emit(ThemeState());
  //     });}
  //
  // }

  bool isPassword = true;

  IconData Suffix = Icons.visibility;

  void showpassword() {
    isPassword = !isPassword;
    Suffix = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(LoginshowpasswordState());
  }

//Build LoginCubit

  LoginModel? UserModel;

  void userLogin({required String email, required String password}) {
    LoginDioHelper.postData(
        url: LOGIN, data: {'email': email, 'password': password}).then((value) {
      UserModel = LoginModel.fromJson(value.data);
      print(value.data);
      emit(LoginSuccessState(loginModel: UserModel!));
    }).catchError((error) {
      print("Dio Helper Error IS ${error.toString()} ");
    });
  }

//Get User Data

  void getData() {
    LoginDioHelper.getData(url: PROFILE, token: token).then((value) {
      UserModel = LoginModel.fromJson(value.data);
      // print("My Name Is ${UserModel!.data!.name}");
      // print("Your Token IS ${token}");
      emit(ProfileSuccessState(loginModel: UserModel!));
    });
  }

  void updateData(
      {required String name, required String email, required String phone}) {
    LoginDioHelper.putData(
        url: UPDATE,
        token: token,
        data: {'name': name, 'email': email, 'phone': phone}).then((value) {
      UserModel = LoginModel.fromJson(value.data);
      // print("My Name Is ${UserModel!.data!.name}");
      // print("Your Token IS ${token}");
      emit(UpdateSuccessState(loginModel: UserModel!));
    });
  }

  void changePassword({
    required String currentpassword,
    required String newpassword,
  }) {
    LoginDioHelper.postData(url: CHANGEPASSWORD, token: token, data: {
      'current_password': currentpassword,
      'new_password': newpassword,
    }).then((value) {
      UserModel = LoginModel.fromJson(value.data);
      // print("My Name Is ${UserModel!.data!.name}");
      print("Your Token IS ${token}");
      emit(ChangeSuccessState(loginModel: UserModel!));
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
