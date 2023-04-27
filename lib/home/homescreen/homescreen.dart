import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:smart_trash/search/searchscreen.dart';
import 'package:smart_trash/style/color.dart';
import '../../component/component.dart';
import '../../sharedcubit/cubit/cubit.dart';
import '../../sharedcubit/cubit/states.dart';
import 'package:carousel_slider/carousel_slider.dart';

class homescreen extends StatelessWidget {
  buildNoInternetWidget()
  {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10,) ,
            Text("Can\'t Connect Check Internet " , style: TextStyle(
              fontSize: 22 ,
              color: Colors.grey
            ),
            ) ,
            Image.asset('assets/images/no_internet.png') ,

             
          ],
        ),

      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit ,NewsState>(
      listener:(context , state){} ,
      builder:(context , state){
        List list = NewsCubit.get(context).Waste ;
        return Scaffold(
          appBar:AppBar(
            title: Text("Wasty " ,style: TextStyle(color: defaultColor ,fontSize: 22 ,fontWeight: FontWeight.bold),),
            actions: [
              IconButton(
                  onPressed:(){
                    NavigateTo(context, searchscreen());
                  },
                  icon: Icon(Icons.search ,color: defaultColor,)
              ),
            ],
          ) ,
          body: OfflineBuilder(
          connectivityBuilder: (
          BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
        )
        {
          final bool connected = connectivity != ConnectivityResult.none;
          if(connected )
            {
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    CarouselSlider(
                        items: [
                          Image(image: AssetImage("assets/images/trash5.jpg" ),fit: BoxFit.cover,width: double.infinity) ,
                          Image(image: AssetImage("assets/images/trash2.jpg" ),fit: BoxFit.cover) ,
                          Image(image: AssetImage("assets/images/trash1.jpg" ),fit: BoxFit.cover,width: double.infinity) ,
                          // Image(image: AssetImage("assets/images/trash4.jpg" ),fit: BoxFit.cover,width: double.infinity) ,
                          // Image(image: AssetImage("assets/images/trash5.jpg" ),fit: BoxFit.cover ,width: double.infinity ) ,
                          // Image(image: AssetImage("assets/images/waste2.png" ),fit: BoxFit.cover,width: double.infinity ) ,
                          Image(image: AssetImage("assets/images/waste3.png" ,  ), fit: BoxFit.cover,width: double.infinity,) ,
                          // Image(image: AssetImage("lib/assets/images/sh4.jpg" )) ,
                        ],
                        options: CarouselOptions(
                            height: 180 ,
                            initialPage: 0 ,
                            enableInfiniteScroll: true ,
                            reverse: false ,
                            autoPlay: true ,
                            autoPlayInterval: Duration(seconds: 3) ,
                            viewportFraction: 1

                        )
                    )
                    ,
                    Column(
                      children: [
                        ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder:(context ,index )=>BuildApiItem(list[index] , context),
                            separatorBuilder: (context ,index)=>MyDivider(),
                            itemCount:list.length)
                      ],
                    ),
                  ],

                ),
              );

            }
          else
            {
              return buildNoInternetWidget();

            }

        },
            child: Center(child: CircularProgressIndicator(color: defaultColor,)),
          ),







        );


      },

    ) ;
  }
}
/*
    if(list.length==0)
        {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: CircularProgressIndicator()),
            ],
          ) ;
        }
        else {
          return ListView.separated(
              itemBuilder:(context ,index )=>BuildApiItem(list[index] , context),
              separatorBuilder: (context ,index)=>MyDivider(),
              itemCount:list.length);
        }
 */