import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_trash/home/home_layout_cubit/states.dart';
class HomeCubit extends Cubit <HomeStates>
{
  HomeCubit():super(HomeInitialState());
  static HomeCubit get(context)
  {
    return BlocProvider.of(context);
  }
  var currentIndex = 0 ;
  void BottomNav(int index) {
    currentIndex = index;
    emit(BottomNavState());
  }
}