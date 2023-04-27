import 'package:flutter/material.dart';
import 'package:smart_trash/component/component.dart';
import 'package:smart_trash/home/settingsscreen/settingscreen.dart';
import 'package:smart_trash/style/color.dart';

class terms extends StatelessWidget {
  const terms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image(
                      height: 200,
                      image: AssetImage("assets/images/terms.png"),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Terms Of Services ",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: defaultColor),
                        ),
                        Text(
                          "Updated 3/3/2023 ",
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                "Terms Of Services ",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: defaultColor),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "By using this App, you agree to be bound by, "
                    "and to comply with, these Terms and Conditions. "
                    "If you do not agree to these Terms and Conditions, "
                    "please do not use this App. ",
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText2,
              ),
              SizedBox(
                height: 30,
              ),
              MyDivider(),
              SizedBox(
                height: 10,
              ),
              Text(
                "Terms And Conditions ",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: defaultColor),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Don't misuse our Service . You may use our Service only as permitted by law"
                    "including applicable export and re-export control laws and regulations. we may suspend or stop providing our Services to you if you do not comply with our terms or policies or if we are investigating suspected misconduct.  ",
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText2,
              ),
              SizedBox(
                height: 30,
              ),
              MyDivider(),
              SizedBox(
                height: 10,
              ),
              Text(
                "Privacy Policy ",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: defaultColor),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "By using this App, you agree to be bound by, "
                    "and to comply with, these Terms and Conditions. "
                    "If you do not agree to these Terms and Conditions, "
                    "please do not use this App. ",
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText2,
              ),
              SizedBox(
                height: 30,
              ),
              MyDivider(),
              SizedBox(
                height: 10,
              ),
              Text(
                "Privacy Policy ",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: defaultColor),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Don't misuse our Service . You may use our Service only as permitted by law"
                    "including applicable export and re-export control laws and regulations. we may suspend or stop providing our Services to you if you do not comply with our terms or policies or if we are investigating suspected misconduct.  ",
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText2,
              ),
              // SizedBox(height: 20,),
              // defaultbutton(text: "Accept", onpress: (){
              //   NavigateTo(context, settingscreen());
              // })
            ],
          ),
        ),
      ),
    );
  }
}
