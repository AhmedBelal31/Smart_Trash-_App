import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import '../style/color.dart';
import 'package:sqflite/sqflite.dart';
bool  isDark = false;
ThemeData lightTheme =ThemeData(
    textTheme: TextTheme(
       headline1:TextStyle(
          fontSize: 30 ,
          fontWeight: FontWeight.bold ,
          color: Colors.grey[700]
      ) ,
        button: TextStyle(
            fontSize: 20 ,
            fontWeight: FontWeight.bold ,
            color: Colors.grey[700]
        ),
        bodyText1: TextStyle(
            fontSize: 18 ,
            fontWeight: FontWeight.bold ,
            color: Colors.grey[700]
        ),
        bodyText2: TextStyle(
            fontSize: 16 ,
            fontWeight: FontWeight.bold ,
            color: Colors.grey[700]
        ),
    ),
    fontFamily:'Janna' ,
    primarySwatch: defaultColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: defaultColor
    ),
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: defaultColor),
        color: Colors.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark

        )
    )

) ;
ThemeData darkTheme =  ThemeData(
    fontFamily:'Janna' ,

    textTheme: TextTheme(
    headline1:TextStyle(
        fontSize: 30 ,
        fontWeight: FontWeight.bold ,
        color: Colors.white
    ) ,
    button: TextStyle(
            fontSize: 22 ,
            fontWeight: FontWeight.bold ,
            color: Colors.white
        ),
    bodyText1: TextStyle(
    fontSize: 18 ,
    fontWeight: FontWeight.bold ,
    color: Colors.white
    ),
    bodyText2: TextStyle(
    fontSize: 16 ,
    fontWeight: FontWeight.bold ,
    color: Colors.white
    ),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: defaultColor
    ),
    primarySwatch: defaultColor,
    primaryColor: defaultColor,
    appBarTheme: AppBarTheme(
     iconTheme: IconThemeData(color: defaultColor),
    backgroundColor: HexColor('333739' ) ,
    titleTextStyle: TextStyle(color: Colors.white),
    elevation: 0 ,
    systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: HexColor('333739' ) ,
    statusBarIconBrightness: Brightness.light
    )
    ),
    scaffoldBackgroundColor:HexColor('333739' ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HexColor('333739' ) ,
    unselectedItemColor: Colors.grey ,
    selectedItemColor: defaultColor
    ) ,
//colorScheme: ColorScheme.dark()


);

//handle Api

String? token ;


Database? database ;
// const mapScreen = '/mapsscreen';
const googleAPIKey = 'AIzaSyCH5e2BlPUzN3aslm3m_mRd_x6dukokq1k';
const suggestionsBaseUrl =
    'https://maps.googleapis.com/maps/api/place/autocomplete/json';
const placeLocationBaseUrl =
    'https://maps.googleapis.com/maps/api/place/details/json';
const directionsBaseUrl =
    'https://maps.googleapis.com/maps/api/directions/json';



