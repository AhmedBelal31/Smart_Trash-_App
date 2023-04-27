import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_trash/Login/cubit/states.dart';
import 'package:smart_trash/Login/login_screen.dart';
import 'package:smart_trash/authCubit/phone_auth_Cubit.dart';
import 'package:smart_trash/authCubit/phone_auth_States.dart';
import 'package:smart_trash/component/component.dart';

import '../../Login/cubit/cubit.dart';
import '../../style/color.dart';

class changepassword extends StatelessWidget {
  // const changepassword({Key? key}) : super(key: key);
var passwordController =TextEditingController();
var confirmPasswordController =TextEditingController();
var formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context , state){},
        builder: (context,state){
          var cubobj = LoginCubit.get(context);
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Image(image: AssetImage('assets/images/lock1.png') ,
                          height: 200,

                        ),
                        SizedBox(height: 10,),
                        Text("Reset Password ",
                          style: TextStyle(
                              fontSize: 20 ,
                              fontWeight: FontWeight.w700 ,
                              fontFamily:''),),
                        SizedBox(height: 20,),
                        defaultForm(
                            isSecure: cubobj.isPassword,
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            prefixIcon: Icons.lock ,

                            text: "New Password" ,

                            onchange: (value)
                            {
                            },
                            onsubmit: (value){},
                            Validator: ( value)
                            {
                              if(value.isEmpty)
                              {
                                return "Password Must Not Be Empty" ;
                              }
                              else if(value.length <6)
                                {
                                  return "password must be at least 8 characters! ";
                                }
                              else
                              {
                                return null ;
                              }
                            } ,
                            onTap: ()
                            {

                              cubobj.showpassword();

                            }
                        ),
                        SizedBox(height:25,),
                        defaultForm(
                            isSecure: cubobj.isPassword,
                            controller: confirmPasswordController,
                            type: TextInputType.visiblePassword,
                            prefixIcon: Icons.lock ,
                            suffixIcon:cubobj.Suffix,
                            text: "Confirm Password" ,

                            onchange: (value)
                            {
                            },
                            onsubmit: (value){},
                            Validator: ( value)
                            {
                              if(value.isEmpty)
                              {
                                return "Password Must Not Be Empty" ;
                              }
                              else if(value.length <8)
                              {
                                return "password must be at least 8 characters! ";
                              }
                              else if (passwordController.text!= confirmPasswordController.text)
                                {
                                  return "Error! Confirm Password Not Match ";
                                }
                              else
                              {
                                return null ;
                              }
                            } ,
                            onTap: ()
                            {

                              cubobj.showpassword();

                            }
                        ),
                        SizedBox(height: 20,),

                        defaultbutton(
                            text: "Submit",
                            onpress: ()
                            {

                                if(formKey.currentState!.validate())
                                {
                                  NavigateAndRep(context, loginScreen());
                                  Fluttertoast.showToast(
                                      msg: "Password has been changed Successfully" ,
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: Duration.millisecondsPerSecond,
                                      backgroundColor:defaultColor,
                                      textColor: Colors.white,
                                      fontSize: 16.0
                                  );
                                }



                            }
                        )


                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
