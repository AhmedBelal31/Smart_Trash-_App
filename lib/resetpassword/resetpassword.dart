// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:smart_trash/component/component.dart';
// import 'package:smart_trash/resetpassword/otp/otpscreen.dart';
// import 'package:smart_trash/style/color.dart';
// import '../authCubit/phone_auth_Cubit.dart';
// import '../authCubit/phone_auth_States.dart';
//
// class resetpassword extends StatelessWidget {
//  resetpassword({Key? key}) : super(key: key);
//
//  var phoneController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     var formKey = GlobalKey<FormState>();
//
//   Future<void> _register(BuildContext context) async {
//     if (!formKey.currentState!.validate()) {
//       Navigator.pop(context);
//       return;
//     } else {
//       Navigator.pop(context);
//       formKey.currentState!.save();
//       BlocProvider.of<PhoneAuthCubit>(context).submitPhoneNumber(phoneController.text);
//       // NavigateTo(context,otpscreen(phoneNumber: phoneController.text));
//     }
//   }
//
//
//     return BlocProvider(
//       create: (context)=>PhoneAuthCubit(),
//       child: BlocConsumer<PhoneAuthCubit ,PhoneAuthState>(
//         listenWhen: (previous ,current)
//         {
//           return previous !=current ;
//         },
//         listener: (context,state){
//           if (state is Loading) {
//             showProgressIndicator(context);
//           }
//
//           if (state is PhoneNumberSubmited) {
//             Navigator.pop(context);
//             NavigateTo(context,otpscreen(phoneNumber: phoneController.text));
//             print("heeeeeeeeey");
//           }
//
//           if (state is ErrorOccurred) {
//             Navigator.pop(context);
//             String errorMsg = (state).errorMsg;
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text(errorMsg),
//                 backgroundColor: Colors.black,
//                 duration: Duration(seconds: 3),
//               ),
//             );
//           }
//         },
//         builder: (context , state){
//           var cubobj =PhoneAuthCubit.get(context);
//           return SafeArea(
//             child: Scaffold(
//               appBar: AppBar(),
//               body: Center(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Image(image: AssetImage('assets/images/forget.png') ,
//                         height: 230,
//                       ),
//                       SizedBox(height:15 ,),
//                       Text("What Is Your Phone Number ?",
//                         style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.w700 ,fontFamily:''),),
//                       SizedBox(height:10 ,),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 25),
//                         child: Text("Please Enter Your Phone Number To Reset Your Password .",
//                           style:TextStyle(fontSize: 16,fontFamily:'font3' , color: Colors.grey[800]
//                           ),),
//                       ),
//                       SizedBox(height: 15,) ,
//                       Form(
//                         key: formKey,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 20),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 flex:1 ,
//                                 child: Container(
//                                   height: 55,
//                                   decoration: BoxDecoration(
//                                       border: Border.all(color: Colors.grey),
//                                       borderRadius: BorderRadius.circular(7)
//                                   ),
//                                   child: Align(
//                                     alignment: Alignment.center,
//                                     child: Text(generateCountryFlag()+" "+"+20" ,
//                                       style: TextStyle(
//                                           fontSize: 18 ,
//                                           letterSpacing: 2.0
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ) ,
//                               SizedBox(width: 10,),
//                               Expanded(
//                                 flex: 3,
//                                 child: Container(
//                                   padding: EdgeInsetsDirectional.only(start: 10),
//                                    // height: 70,
//                                   // decoration: BoxDecoration(
//                                   //   border: Border.all(color: defaultColor) ,
//                                   //   borderRadius: BorderRadius.circular(6.0),
//                                   //
//                                   // ),
//                                   child: TextFormField(
//                                     controller:phoneController ,
//                                     keyboardType: TextInputType.phone,
//                                     cursorColor: defaultColor,
//                                     validator: (value){
//                                       if(value!.isEmpty)
//                                       {
//                                         return "Please Enter Your Phone Number! " ;
//                                       }
//                                       else if (value.length<11)
//                                       {
//                                         return "Too short for a phone number! " ;
//                                       }
//                                       else if (value.length>11)
//                                       {
//                                         return "Too Long for a phone number! " ;
//                                       }
//                                       else
//                                       {
//                                         return null ;
//                                       }
//                                     },
//                                     onSaved: (value) {
//                                       phoneController.text= value!; },
//
//                                     style: TextStyle(
//                                       letterSpacing: 2.0 ,
//                                       fontSize: 20 ,
//                                     ),
//                                     decoration:InputDecoration(
//
//                                       border: OutlineInputBorder(
//
//                                         borderRadius: BorderRadius.circular(14)
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ) ,
//                       SizedBox(height: 25,) ,
//                       resetTextButton(
//                           onpress:(){
//                             showProgressIndicator(context);
//                             // cubobj.submitPhoneNumber(phoneController.text);
//                             _register(context);
//                           } ,
//                           text: "Next"
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//             ),
//
//           );
//         },
//       ),
//     );
//   }
//
//
//
//
// }
// String generateCountryFlag() {
//   String countryCode = 'eg';
//
//   String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
//           (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
//
//   return flag;
// }
//
//
//
//




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_trash/component/component.dart';
import 'package:smart_trash/resetpassword/otp/otpscreen.dart';
import 'package:smart_trash/style/color.dart';
import '../authCubit/phone_auth_Cubit.dart';
import '../authCubit/phone_auth_States.dart';
import '../constant/const.dart';

class resetpassword extends StatelessWidget {
  resetpassword({Key? key}) : super(key: key);

  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    Future<void> _register(BuildContext context) async {
      if (!formKey.currentState!.validate()) {
        Navigator.pop(context);
        return;
      } else {
        Navigator.pop(context);
        formKey.currentState!.save();
        BlocProvider.of<PhoneAuthCubit>(context).submitPhoneNumber(phoneController.text);
        // NavigateTo(context,otpscreen(phoneNumber: phoneController.text));
      }
    }


    return BlocProvider(
      create: (context)=>PhoneAuthCubit(),
      child: BlocConsumer<PhoneAuthCubit ,PhoneAuthState>(
        listenWhen: (previous ,current)
        {
          return previous !=current ;
        },
        listener: (context,state){
          if (state is Loading) {
            showProgressIndicator(context);
          }

          if (state is PhoneNumberSubmited) {
            Navigator.pop(context);
            NavigateTo(context,otpscreen(phoneNumber: phoneController.text));
            print("heeeeeeeeey");
          }

          if (state is ErrorOccurred) {
            Navigator.pop(context);
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
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(),
              body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image(image: AssetImage('assets/images/forget.png') ,
                        height: 200,
                      ),
                      SizedBox(height:10 ,),
                      Text("What Is Your Phone Number ?",
                        style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.w700 ,fontFamily:'' ,color: !isDark ? Colors.white:Colors.black),),
                      SizedBox(height:5 ,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text("Please Enter Your Phone Number To Reset Your Password .",
                            style:TextStyle(color: !isDark ? Colors.white:Colors.grey[700] ,fontSize: 15)),
                      ),
                      Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [

                              // Expanded(
                              //   flex:1 ,
                              //   child: Padding(
                              //     padding: const EdgeInsetsDirectional.only(
                              //       top:40
                              //     ),
                              //     child: Text(generateCountryFlag()+" "+"+20" ,
                              //       style: TextStyle(
                              //           fontSize: 20 ,
                              //           letterSpacing: 2.0
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: TextFormField(
                                    controller:phoneController ,
                                    keyboardType: TextInputType.phone,
                                    cursorColor: defaultColor,
                                    validator: (value){
                                      if(value!.isEmpty)
                                      {
                                        return "Please Enter Your Phone Number! " ;
                                      }
                                      else if (value.length<11)
                                      {
                                        return "Too short for a phone number! " ;
                                      }
                                      else if (value.length>11)
                                      {
                                        return "Too Long for a phone number! " ;
                                      }
                                      else
                                      {
                                        return null ;
                                      }
                                    },
                                    onSaved: (value) {
                                      phoneController.text= value!; },

                                    style: TextStyle(
                                      color: isDark ? Colors.black : Colors.white ,
                                      letterSpacing: 1.4 ,
                                      fontSize: 20 ,
                                    ),
                                    decoration:InputDecoration(
                                      hintText: generateCountryFlag()+ " Phone Number !" ,
                                      hintStyle: TextStyle(color: isDark ? Colors.black : Colors.white)

                                      // border: OutlineInputBorder(
                                      //
                                      //     borderRadius: BorderRadius.circular(14)
                                      // ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ) ,
                      SizedBox(height: 15,) ,
                      resetTextButton(
                          onpress:(){
                            showProgressIndicator(context);
                            // cubobj.submitPhoneNumber(phoneController.text);
                            _register(context);
                          } ,
                          text: "Next"
                      ),
                    ],
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
String generateCountryFlag() {
  String countryCode = 'eg';

  String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
          (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

  return flag;
}




