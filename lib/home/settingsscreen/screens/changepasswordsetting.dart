import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_trash/Login/cubit/states.dart';
import 'package:smart_trash/Login/login_screen.dart';
import 'package:smart_trash/authCubit/phone_auth_Cubit.dart';
import 'package:smart_trash/authCubit/phone_auth_States.dart';
import 'package:smart_trash/component/component.dart';
import '../../../Login/cubit/cubit.dart';
import '../../../constant/const.dart';
import '../../../network/remote/cache helper.dart';
import '../../../style/color.dart';
import '../../home_layout.dart';

class changepasswordsetting extends StatelessWidget {
  // const changepassword({Key? key}) : super(key: key);
  var currentpasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is ChangeSuccessState) {
            if (state.loginModel.status == true) {
              // CacheHelper.saveData(key:'token', value: state.loginModel.data!.token).then((value) {
              //   token = state.loginModel.data!.token ;
              //   print("This is Token ${state.loginModel.data!.token}");
              //   NavigateAndRep(context , home_layout());
              //   showToast(
              //       text: "${state.loginModel.message}",
              //       state: ToastStates.SUCCESS
              //   );
              // });

              NavigateAndRep(context, home_layout());
              showToast(
                  text: "${state.loginModel.message}",
                  state: ToastStates.SUCCESS);
            } else {
              showToast(
                  text: "${state.loginModel.message}",
                  state: ToastStates.ERROR);
            }
          }
        },
        builder: (context, state) {
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back),
                              color: defaultColor,
                            )
                          ],
                        ),
                        Image(
                          image: AssetImage('assets/images/lock1.png'),
                          height: 200,
                        ),
                        // SizedBox(height: 10,),
                        // Text("Change Password ",
                        //   style: TextStyle(
                        //       fontSize: 20 ,
                        //       fontWeight: FontWeight.w700 ,
                        //       fontFamily:''),),
                        SizedBox(
                          height: 20,
                        ),
                        defaultForm(
                            isSecure: cubobj.isPassword,
                            controller: currentpasswordController,
                            type: TextInputType.visiblePassword,
                            prefixIcon: Icons.lock,
                            text: "Current Password",
                            onchange: (value) {},
                            onsubmit: (value) {},
                            Validator: (value) {
                              if (value.isEmpty) {
                                return "Password Must Not Be Empty";
                              }
                            },
                            onTap: () {
                              cubobj.showpassword();
                            }),
                        SizedBox(
                          height: 25,
                        ),
                        defaultForm(
                            isSecure: cubobj.isPassword,
                            controller: newPasswordController,
                            type: TextInputType.visiblePassword,
                            prefixIcon: Icons.lock,
                            suffixIcon: cubobj.Suffix,
                            text: "Confirm Password",
                            onchange: (value) {},
                            onsubmit: (value) {},
                            Validator: (value) {
                              if (value.isEmpty) {
                                return "Password Must Not Be Empty";
                              } else {
                                return null;
                              }
                            },
                            onTap: () {
                              cubobj.showpassword();
                            }),
                        SizedBox(
                          height: 20,
                        ),

                        defaultbutton(
                            text: "Submit",
                            onpress: () {
                              if (formKey.currentState!.validate()) {
                                cubobj.changePassword(
                                    currentpassword:
                                        currentpasswordController.text,
                                    newpassword: newPasswordController.text);
                              }
                            })
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
