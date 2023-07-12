import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_trash/Login/cubit/cubit.dart';
import 'package:smart_trash/Login/cubit/states.dart';
import 'package:smart_trash/Login/login_screen.dart';
import 'package:smart_trash/constant/const.dart';
import 'package:smart_trash/network/remote/LoginDioHelper.dart';
import 'package:smart_trash/network/remote/cache%20helper.dart';
import 'package:smart_trash/resetpassword/changepassword/changepassword.dart';
import 'package:smart_trash/home/home_layout.dart';
import 'package:smart_trash/home/homescreen/homescreen.dart';
import 'package:smart_trash/home/mapscreen/mapsscreen.dart';
import 'package:smart_trash/onboarding/onboardingScreen.dart';
import 'package:smart_trash/resetpassword/resetpassword.dart';
import 'package:smart_trash/sharedcubit/cubit/cubit.dart';
import 'package:smart_trash/style/color.dart';
import 'constant/const.dart';
import 'constant/const.dart';
import 'constant/const.dart';
import 'home/settingsscreen/settingscreen.dart';
import 'network/remote/Dio Helper.dart';
import 'network/remote/Dio_bins.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  LoginDioHelper.init();
  BinsDioHelper.init();
  await CacheHelper.init();
  // bool? isDark2= CacheHelper.getBoolean(key: 'isDark');

  Widget? widget ;

  bool? onboarding = CacheHelper.getData(key:'onboarding') ;

  token= CacheHelper.getData(key:'token');

  print(token);
  if(onboarding != null)
    {
      if(token !=null ) widget = home_layout() ;
      else widget = loginScreen();
    }
  else
    {
      widget = onboardingScreen();
    }



  await Firebase.initializeApp(
  );
  runApp(MyApp(
    // isDark1: isDark2! ,
    startwidget: widget!,
  ));
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  // final bool isDark1 ;
  final Widget startwidget ;
  MyApp({
    // required this.isDark1 ,
    required this.startwidget
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context)=>LoginCubit()..changeAppMode(
        // fromSharedPref: isDark1
      )..getData(),
      child: BlocConsumer<LoginCubit ,LoginStates>(
        listener: (context,state){},
        builder: (context , state){
          return MaterialApp(
            theme: lightTheme  ,
            darkTheme:darkTheme ,
            themeMode:isDark ?  ThemeMode.light :ThemeMode.dark,
            home: startwidget,
            debugShowCheckedModeBanner: false,

          );
        },
      ),
    );
  }
}



