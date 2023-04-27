import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../sharedcubit/cubit/cubit.dart';
import '../sharedcubit/cubit/states.dart';

class home_layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getWasteData(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit cubitobj = NewsCubit.get(context);
          return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: cubitobj.currentIndex,
                onTap: (index) {
                  cubitobj.BottomNav(index);
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.location_on), label: 'Map'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.card_giftcard), label: 'Reward'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'Settings')
                ],
              ),
              body: cubitobj.Screens[cubitobj.currentIndex]);
        },
      ),
    );
  }
}
