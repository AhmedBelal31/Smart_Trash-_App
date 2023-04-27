import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_trash/register/register_cubit/cubit.dart';
import 'package:smart_trash/register/register_cubit/states.dart';
import '../../component/component.dart';
import '../Login/cubit/cubit.dart';
import '../Login/cubit/states.dart';
import '../Login/login_screen.dart';
import '../constant/const.dart';
import '../home/home_layout.dart';
import '../network/remote/cache helper.dart';
import '../style/color.dart';
class registerScreen extends StatelessWidget {
  var usernameController =TextEditingController();
  var emailController =TextEditingController() ;
  var passwordController =TextEditingController();
  var phoneController =TextEditingController();
  var formKey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
  return BlocProvider(
    create: (context)=>Registercubit(),
    child: BlocConsumer<Registercubit ,RegisterStates>(
      listener: (context , state){
        if(state is registerSuccessState)
        {
          if(state.loginModel.status == true)
          {
            CacheHelper.saveData(key:'token', value: state.loginModel.data!.token).then((value) {
              token = state.loginModel.data!.token ;
              // print("This is Token ${state.loginModel.data!.token}");
              NavigateAndRep(context , home_layout());
              showToast(
                  text: "${state.loginModel.message}",
                  state: ToastStates.SUCCESS
              );
            });

          }
          else
          {
            showToast(
                text: "${state.loginModel.message}",
                state: ToastStates.ERROR
            );
          }

        }
      },
      builder: (context ,state)
    {
      var cubobj =Registercubit.get(context);
      return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(onPressed: ()
                  {
                    Navigator.pop(context);
                  },
                      icon:Icon(Icons.arrow_back) , color: defaultColor,)
                ],
              )  ,
             Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Image(
                   height: 130,
                   image: AssetImage("assets/images/register2.png"),
                 ),
               ],
             ),

                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 20 ,
                    bottom: 10 ,
                    end: 20
                  ),
                  child: Center(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("REGISTER" ,style:TextStyle(
                              fontSize: 30
                          )
                          ),
                          SizedBox(height: 5,) ,
                          defaultForm(
                            controller: usernameController,
                            type: TextInputType.name,
                            prefixIcon: Icons.person ,
                            text: "User Name" ,
                            onchange: ( value)
                            {
                            },
                            onsubmit: (value){},
                            Validator: (value)
                            {

                              if(value.isEmpty)
                              {
                                return "User Name Must Not Be Empty"  ;
                              }
                              else
                              {
                                return null ;
                              }

                            },
                          ),
                          SizedBox(height: 10,),
                          defaultForm(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            prefixIcon: Icons.email ,
                            text: "Email-Address" ,
                            onchange: ( value)
                            {
                            },
                            onsubmit: (value){},
                            Validator: (value)
                            {

                              if(value.isEmpty)
                              {
                                return "Email-Address Must Not Be Empty"  ;
                              }

                              else
                              {
                                return null ;
                              }

                            },
                          ),
                          SizedBox(height: 10,),
                          defaultForm(
                              isSecure: cubobj.isPassword,
                              controller: passwordController,
                              type: TextInputType.visiblePassword,
                              prefixIcon: Icons.lock ,
                              suffixIcon:cubobj.Suffix,
                              text: "Password" ,

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
                              } ,
                              onTap: ()
                              {

                                cubobj.registershowpassword();

                              }
                          ),
                          SizedBox(height: 10,),
                          defaultForm(
                            controller: phoneController,
                            type: TextInputType.phone,
                            prefixIcon: Icons.phone ,
                            text: "Phone" ,
                            onchange: ( value)
                            {
                            },
                            onsubmit: (value){},
                            Validator: (value)
                            {

                              if(value.isEmpty)
                              {
                                return "Phone Must Not Be Empty"  ;
                              }
                              // else if (value.length)
                              // {
                              //   return "Too short for a phone number!";
                              // }
                              else
                              {
                                return null ;
                              }

                            },
                          ),


                          SizedBox(height: 10,),
                          defaultbutton(
                            onpress: ()
                            {
                              if(formKey.currentState!.validate())
                              {
                                cubobj.userRegister(
                                    name: usernameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    phone: phoneController.text
                                );
                                // NavigateTo(context,loginScreen());

                              }
                            },
                            text: "REGISTER" ,
                          ) ,


                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
    ),
  );
  }
}
