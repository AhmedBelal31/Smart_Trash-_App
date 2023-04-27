import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_trash/home/homescreen/homescreen.dart';
import 'package:smart_trash/home/mapscreen/mapsscreen.dart';
import 'package:smart_trash/home/settingsscreen/screens/editprofile.dart';
import 'package:smart_trash/sharedcubit/cubit/states.dart';
import 'package:smart_trash/home/store/store.dart';
import '../../home/settingsscreen/settingscreen.dart';
import '../../network/remote/Dio Helper.dart';
class NewsCubit extends Cubit <NewsState>
{
  NewsCubit():super(NewsInitialState());
  static NewsCubit get(context)
  {
    return BlocProvider.of(context);
  }
  var currentIndex = 0 ;
  List<Widget> Screens =[
  homescreen(),
  mapsscreen(),
  rewardscreen(),
  settingscreen()

  ];
bool isLight =true ;
 ChangeThemeIcon()
 {
   isLight = !isLight ;
    emit(AppThemeState());
 }
 void BottomNav(int index)
  {
    currentIndex = index ;
    emit(BottomNavState());

  }
  List<dynamic> Waste= [];
  List<dynamic> Search = [];

 // void getWasteData()
 //  {
 //
 //    DioHelper.getData(
 //      url: 'v2/everything',
 //      query: {
 //        'q':'apple' ,
 //        'from':'2023-02-15' ,
 //        'to':'2023-02-15' ,
 //        'sortBy':'popularity'  ,
 //        'apiKey':'82873894d030419591eed3e05ea31541'
 //      },
 //    ).then((value) {
 //     Waste=value.data["articles"] ;
 //      emit(wasteState());
 //    }).catchError((error){
 //      print("Erorr Occured ! ${error.toString()}");
 //    });
 //  }



  void getWasteData()
  {

    DioHelper.getData(
      url: 'v2/everything',
      query: {
         'q':'Garbage recycling',
        // 'from':'2023-02-06' ,
        'sortBy':'publishedAt' ,
        'apiKey':'82873894d030419591eed3e05ea31541'
      },
    ).then((value) {
      Waste=value.data["articles"] ;
      emit( wasteState());
    }).catchError((error){
      print("Erorr Occured ! ${error.toString()}");
    });
  }

  TextEditingController searchController =TextEditingController() ;
  void getSearch (String value)
  {
  DioHelper.getData(
        url: 'v2/everything',
        query: {
        'q':'${value}' ,
        'apiKey':'d8cb99432a6c4b9a84ce0916d8e1dc1a'
        }
    ).then((value) {
      Search = value.data["articles"] ;
      emit(SearchState());
      //
    }).catchError((error)
    {
      print("Error Occured ${error.toString()}");
    });


  }

void TFFChange(value)
  {
    // searchController = value;
    emit(SearchState());
  }





}