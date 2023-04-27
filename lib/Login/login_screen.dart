import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_trash/home/home_layout.dart';
import 'package:smart_trash/network/remote/cache%20helper.dart';
import 'package:smart_trash/register/registerScreen.dart';
import '../component/component.dart';
import '../constant/const.dart';
import '../resetpassword/resetpassword.dart';
import '../style/color.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class loginScreen extends StatelessWidget {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel.status == true) {
              CacheHelper.saveData(
                      key: 'token', value: state.loginModel.data!.token)
                  .then((value) {
                token = state.loginModel.data!.token;
                // print("This is Token ${state.loginModel.data!.token}");
                NavigateAndRep(context, home_layout());
                showToast(
                    text: "${state.loginModel.message}",
                    state: ToastStates.SUCCESS);
              });
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
              child: Column(
                children: [
                  Image(
                    height: 180,
                    image: AssetImage("assets/images/login1.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("LOGIN",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 15,
                            ),
                            defaultForm(
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              prefixIcon: Icons.email,
                              text: "Email-Address",
                              onchange: (value) {},
                              onsubmit: (value) {},
                              Validator: (value) {
                                if (value.isEmpty) {
                                  return "Email-Address Must Not Be Empty";
                                }
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            defaultForm(
                              isSecure: cubobj.isPassword,
                              controller: passwordController,
                              type: TextInputType.visiblePassword,
                              prefixIcon: Icons.lock,
                              suffixIcon: cubobj.Suffix,
                              text: "Password",
                              onchange: (value) {},
                              onsubmit: (value) {
                                {
                                  if (formKey.currentState!.validate()) {
                                    cubobj.userLogin(
                                        email: emailController.text,
                                        password: passwordController.text);
                                  }
                                }
                              },
                              Validator: (value) {
                                if (value.isEmpty) {
                                  return "Email-Address Must Not Be Empty";
                                } else {
                                  return null;
                                }
                              },
                              onTap: () {
                                cubobj.showpassword();
                              },
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(top: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  defaultTextButton(
                                      onpress: () {
                                        NavigateTo(context, resetpassword());
                                      },
                                      text: "Forgot Password?"),
                                ],
                              ),
                            ),
                            defaultbutton(
                              onpress: () {
                                if (formKey.currentState!.validate()) {
                                  cubobj.userLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              text: "Login",
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Don't Have An Account ?"),
                                defaultTextButton(
                                    onpress: () {
                                      NavigateTo(context, registerScreen());
                                    },
                                    text: "REGISTER "),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
