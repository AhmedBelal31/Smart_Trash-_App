import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smart_trash/component/component.dart';
import 'package:smart_trash/style/color.dart';
import '../../authCubit/phone_auth_Cubit.dart';
import '../../authCubit/phone_auth_States.dart';
import '../../constant/const.dart';
import '../changepassword/changepassword.dart';
import '../../onboarding/onboardingScreen.dart';

class otpscreen extends StatelessWidget {
String phoneNumber ;
otpscreen(
    {
      required this.phoneNumber
  }
      );
late String otpCode ;
void _login(BuildContext context) {
  BlocProvider.of<PhoneAuthCubit>(context).submitOTP(otpCode);
}
  @override
Widget build(BuildContext context) {

    return BlocProvider(
      create: (context)=>PhoneAuthCubit(),
      child: BlocConsumer<PhoneAuthCubit ,PhoneAuthState>(
        listener: (context , state){
          if (state is Loading) {
            showProgressIndicator(context);
          }

          if (state is PhoneOTPVerified) {
            Navigator.pop(context);
            NavigateAndRep(context,changepassword());
          }

          if (state is ErrorOccurred) {
            //Navigator.pop(context);
            String errorMsg = (state).errorMsg;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMsg),
                backgroundColor: Colors.black,
                duration: Duration(seconds: 3),
              ),
            );
          }
        },
        builder: (context , state){
         var cubobj =PhoneAuthCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image(image: AssetImage('assets/images/otp1.png') ,
                      height: 150,
                    ),
                    SizedBox(height: 20,),

                    Text("Verify Your Phone Number ",
                      style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.w700 ,fontFamily:''),),
                    SizedBox(height:10 ,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child:RichText(
                        text: TextSpan(
                            text: "Enter your 6 digit code numbers sent to you at " ,
                            style:Theme.of(context).textTheme.bodyText2 ,
                            children: [
                              TextSpan(
                                  text: "+2$phoneNumber" ,
                                  style: TextStyle(color:defaultColor ,fontWeight: FontWeight.bold ,fontSize: 18)
                              )
                            ]
                        ),
                      ),
                    ),
                    SizedBox(height: 30,) ,
                    _buildpincodefields(context),
                    SizedBox(height:20,) ,
                    resetTextButton(onpress: ()
                    {
                      showProgressIndicator(context);
                      _login(context);

                    }
                        , text:"VERIFY") ,
                  ],

                ),
              ),
            ),

          );
        },
      ),
    );
  }

_buildpincodefields(context)
{
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25.0),
    child: Container(
      child: PinCodeTextField(
        appContext: context,
        autoFocus: false,
        cursorColor: defaultColor,
        keyboardType: TextInputType.number,
        length: 6,
        obscureText: false,
        animationType: AnimationType.scale,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          borderWidth: 1,
          activeFillColor: defaultColor,
          selectedFillColor: Colors.grey[100],
          inactiveColor: defaultColor,
          inactiveFillColor: Colors.white ,
          selectedColor: defaultColor,
          activeColor: Colors.white

        ),
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: !isDark ? HexColor('333739' ) :Colors.green.shade50,
        enableActiveFill: true,
        onCompleted: (code) {
          otpCode=code ;
          print("Completed");
        },
        onChanged: (value) {
          print(value);
        },

      ),
    ),
  );
}




}
