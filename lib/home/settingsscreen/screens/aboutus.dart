import 'package:flutter/material.dart';
import 'package:smart_trash/Login/login_screen.dart';
import 'package:smart_trash/home/settingsscreen/settingscreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../component/component.dart';
import '../../../style/color.dart';

class BoardingModel {
  final String image;

  final String Title;

  final String body;

  BoardingModel({required this.image, required this.Title, required this.body});
}

class aboutus extends StatefulWidget {
  @override
  State<aboutus> createState() => _aboutusState();
}

class _aboutusState extends State<aboutus> {
  // const onboardingScreen({Key? key}) : super(key: key);
  var pageController = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    List<BoardingModel> list = [
      BoardingModel(
          image: "assets/images/team.png",
          Title: "About Us ",
          body:
              "Lorem ipsum dolor sit amet. Non voluptates ullam qui dolorum unde ab consequatur numquam ut molestiae voluptas ."),
      BoardingModel(
          image: "assets/images/team3.png",
          Title: "Friendly Team ",
          body:
              "Lorem ipsum dolor sit amet. Non voluptates ullam qui dolorum unde ab consequatur numquam ut molestiae voluptas ."),
      BoardingModel(
          image: "assets/images/team2.png",
          Title: "Welcome To Join Us",
          body:
              "Lorem ipsum dolor sit amet. Non voluptates ullam qui dolorum unde ab consequatur numquam ut molestiae voluptas ."),
    ];

    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemBuilder: (context, index) =>
                      buildBoardingItem(list[index], context),
                  itemCount: list.length,
                  onPageChanged: (index) {
                    if (index == list.length - 1) {
                      setState(() {
                        isLast = true;
                        print("isLast");
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                    effect: JumpingDotEffect(
                      dotWidth: 10,
                      dotHeight: 10,
                      spacing: 5,
                      activeDotColor: defaultColor,
                    ),
                    controller: pageController,
                    onDotClicked: (index) {
                      print(index);
                    },
                    count: list.length,
                  ),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if (isLast == true) {
                        NavigateAndRep(context, settingscreen());
                        // NavigateTo(context, loginScreen());
                      } else {
                        pageController.nextPage(
                            duration: Duration(microseconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }
                    },
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

Widget buildBoardingItem(BoardingModel obj, context) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage(
              "${obj.image}",
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "${obj.Title}",
          style: TextStyle(color: defaultColor, fontSize: 25),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "${obj.body}",
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
