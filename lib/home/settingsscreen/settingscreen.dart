import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:smart_trash/component/component.dart';
import 'package:smart_trash/home/settingsscreen/screens/aboutus.dart';
import 'package:smart_trash/home/settingsscreen/screens/changepasswordsetting.dart';
import 'package:smart_trash/home/settingsscreen/screens/editprofile.dart';
import 'package:smart_trash/home/settingsscreen/screens/profile.dart';
import 'package:smart_trash/home/settingsscreen/screens/termsandconditions.dart';
import 'package:smart_trash/network/remote/cache%20helper.dart';
import 'package:smart_trash/resetpassword/changepassword/changepassword.dart';
import 'package:smart_trash/style/color.dart';

import '../../Login/cubit/cubit.dart';
import '../../Login/cubit/states.dart';
import '../../Login/login_screen.dart';
import '../../constant/const.dart';

class settingscreen extends StatelessWidget {
  // const settingscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit ,LoginStates>(
      listener: (Context , state){},
      builder: (context,state){
        var cubobj = LoginCubit.get(context);
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Settings" , style: TextStyle(fontSize: 30,color: isDark ? Colors.black : Colors.white), ),
                    SizedBox(height: 20,),
                    //Account
                    Row(
                      children: [
                        Icon(Icons.person,color: defaultColor,) ,
                        SizedBox(width: 15,),
                        Text("Account",style: TextStyle(fontSize: 20),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    MyDivider(),
                    SizedBox(height: 15,),
                    InkWell(
                      onTap: (){
                        NavigateTo(context, profile());
                      },
                      child: Row(
                        children: [
                          Text("Profile " ,  style:Theme.of(context).textTheme.bodyText2,),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios,color: defaultColor,)

                        ],
                      ),
                    ),
                    SizedBox(height:12,),
                    InkWell(
                      onTap: (){
                        NavigateTo(context, editprofile());
                      },
                      child: Row(
                        children: [
                          Text("Edit Profile " ,  style:Theme.of(context).textTheme.bodyText2,),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios,color: defaultColor,)

                        ],
                      ),
                    ),
                    SizedBox(height: 12,),
                    InkWell(
                      onTap: (){
                        NavigateTo(context, changepasswordsetting());
                      },
                      child: Row(
                        children: [
                          Text("Change Password " ,  style:Theme.of(context).textTheme.bodyText2,),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios , color: defaultColor,)
                        ],
                      ),
                    ),

                    SizedBox(height: 20,),
                    MyDivider(),
                    SizedBox(height: 20,),

                    //Dark Theme
                    Row(
                      children: [
                        Icon(Icons.brightness_4,color: defaultColor,) ,
                        SizedBox(width: 15,),
                        Text("Appearance",style: TextStyle(fontSize: 20),),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Text("Light Theme " , style:Theme.of(context).textTheme.bodyText2,),
                        Spacer(),
                        Expanded(
                          flex: 1,
                          child: IconButton(onPressed: (){},
                              icon: LiteRollingSwitch(
                                width: 85,
                                value: true,
                                textOn: 'On',
                                textOff: 'Off',
                                colorOn: defaultColor,
                                colorOff: Colors.red,
                                iconOn: Icons.done,
                                iconOff: Icons.remove_circle_outline,
                                textSize: 16.0,
                                onTap:(){
                                   cubobj.changeAppMode();

                                },
                                onDoubleTap: (){},
                                onSwipe: (){},
                                onChanged: (state){},

                              )
                          ),
                        )

                      ],
                    ),

                    SizedBox(height: 10,),
                    MyDivider(),
                    SizedBox(height: 15,),
                    //More
                    Row(
                      children: [
                        Icon(Icons.edit_calendar_sharp,color: defaultColor,) ,
                        SizedBox(width: 15,),
                        Text("More",style: TextStyle(fontSize: 20),),
                      ],
                    ),
                    SizedBox(height: 25,),
                    InkWell(
                      onTap: (){
                        NavigateTo(context, aboutus());
                      },
                      child: Row(
                        children: [
                          Text("About Us " , style:Theme.of(context).textTheme.bodyText2,),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios,color: defaultColor,)

                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    InkWell(
                      onTap: (){
                        NavigateTo(context, terms());
                      },
                      child: Row(
                        children: [
                          Text("Terms And Conditions " , style:Theme.of(context).textTheme.bodyText2,),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios,color: defaultColor,)

                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                    defaultbutton(
                      onpress: ()
                      {
                        CacheHelper.removeData(key:'token').then((value) {
                          if(value == true)
                            {
                              NavigateAndRep(context,loginScreen());
                              Fluttertoast.showToast(
                                  msg: "LOGOUT SUCCESSFULLY" ,
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor:defaultColor,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            }

                        });


                      },
                      text: "LOGOUT" ,
                    ) ,
                  ],
                ),
              ),
            ),
          ),
        );
      },

    );
  }
}
