import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../Login/cubit/cubit.dart';
import '../../../Login/cubit/states.dart';
import '../../../Login/login_screen.dart';
import '../../../component/component.dart';
import '../../../constant/const.dart';
import '../../../style/color.dart';

class profile extends StatelessWidget {
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        //   if (state is LoginSuccessState )
        //     {
        //       usernameController.text = state.loginModel.data!.name! ;
        //       emailController.text = state.loginModel.data!.email! ;
        //       phoneController.text = state.loginModel.data!.phone! ;
        //     }
      },
      builder: (context, state) {
        var cubobj = LoginCubit
            .get(context)
            .UserModel;

        usernameController.text = cubobj!.data!.name!;
        emailController.text = cubobj!.data!.email!;
        phoneController.text = cubobj!.data!.phone!;
        return Scaffold(

          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(onPressed: () {
                        Navigator.pop(context);
                      },
                        icon: Icon(Icons.arrow_back), color: defaultColor,)
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        height: 160,
                        image: AssetImage("assets/images/profile2.png"),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 20,
                        bottom: 10,
                        end: 20
                    ),
                    child: Center(
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Profile", style: TextStyle(
                                fontSize: 25
                            )
                            ),
                            SizedBox(height: 25,),
                            defaultForm(
                              controller: usernameController,
                              type: TextInputType.name,
                              prefixIcon: Icons.person,
                              text: "User Name",
                              onchange: (value) {},
                              onsubmit: (value) {},
                            ),
                            SizedBox(height: 15,),
                            // defaultForm(
                            //     isSecure: cubobj.isPassword,
                            //     controller: passwordController,
                            //     type: TextInputType.visiblePassword,
                            //     prefixIcon: Icons.lock ,
                            //     suffixIcon:cubobj.Suffix,
                            //     text: "Password" ,
                            //
                            //     onchange: (value)
                            //     {
                            //     },
                            //     onsubmit: (value){},
                            //     onTap: ()
                            //     {
                            //
                            //       cubobj.showpassword();
                            //
                            //     }
                            // ),
                            defaultForm(
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              prefixIcon: Icons.email,
                              text: "Email Address",
                              onchange: (value) {},
                              onsubmit: (value) {},
                            ),
                            SizedBox(height: 15,),
                            defaultForm(
                              controller: phoneController,
                              type: TextInputType.phone,
                              prefixIcon: Icons.phone,
                              text: "Phone",
                              onchange: (value) {},
                              onsubmit: (value) {},
                              Validator: (value) {
                                if (value.isEmpty) {
                                  return "Phone Must Not Be Empty";
                                }
                              },
                            ),


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
    );
  }
}
