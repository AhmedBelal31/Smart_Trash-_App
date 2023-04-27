


import 'package:flutter/material.dart';
import 'package:smart_trash/Login/login_screen.dart';
import 'package:smart_trash/network/remote/cache%20helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


import '../../component/component.dart';
import '../../style/color.dart';


class BoardingModel
{
  final String image ;
  final String Title ;
  final String body ;
  BoardingModel(
      {
        required this.image ,
        required this.Title ,
        required this.body
      }
      );
}

class onboardingScreen extends StatefulWidget {
  @override
  State<onboardingScreen> createState() => _onboardingScreenState();
}

class _onboardingScreenState extends State<onboardingScreen> {
  // const onboardingScreen({Key? key}) : super(key: key);
  var pageController =PageController();
  bool isLast = false ;
  void submit()
  {

    CacheHelper.saveData(key: 'onboarding', value: true).then((value) {
      if(value)
        {
          NavigateAndRep(context,loginScreen());
        }
    }) ;
  }

  @override
  Widget build(BuildContext context) {
    List<BoardingModel> list =[
      BoardingModel(
          image: "assets/images/trash5.jpg",
          Title: "Save The Planet " ,
          body: "Lorem ipsum dolor sit amet. Non voluptates ullam qui dolorum unde ab consequatur numquam ut molestiae voluptas ."
      ) ,
      BoardingModel(
          image: "assets/images/trash4.jpg",
          Title: "Clean The World ",
          body: "Lorem ipsum dolor sit amet. Non voluptates ullam qui dolorum unde ab consequatur numquam ut molestiae voluptas ."
      ) ,
      BoardingModel(
          image: "assets/images/trash2.jpg",
          Title: "Recycling Bin",
          body: "Lorem ipsum dolor sit amet. Non voluptates ullam qui dolorum unde ab consequatur numquam ut molestiae voluptas ."
      ),

    ];

    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: submit,
                child: Text("Skip" , style: TextStyle(color: defaultColor , fontWeight: FontWeight.bold ),)
            )
          ],
        ),
        body:
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemBuilder:(context ,index)=>buildBoardingItem(list[index] ,context) ,
                  itemCount: list.length,
                  onPageChanged:(index)
                  {
                    if(index==list.length-1)
                    {
                      setState(() {
                        isLast=true ;
                        print("isLast");
                      });
                    }
                    else
                    {
                      setState(() {
                        isLast=false ;
                      });
                    }
                  },
                ),
              ) ,
              SizedBox(height:40,),
              Row(
                children: [
                  SmoothPageIndicator(
                    effect: ExpandingDotsEffect(
                      dotWidth: 10 ,
                      dotHeight: 10 ,
                      spacing: 5,
                      expansionFactor: 4,
                      activeDotColor: defaultColor ,
                    ),
                    controller: pageController,
                    onDotClicked: (index)
                    {
                      print(index);
                    } ,
                    count: list.length ,
                  ) ,
                  Spacer(),

                  FloatingActionButton(
                    onPressed: ()
                    {
                      if(isLast==true)
                      {
                        submit();
                        //NavigateAndRep(context, loginScreen() );
                        // NavigateTo(context, loginScreen());

                      }
                      else
                      {
                        pageController.nextPage(
                            duration:Duration(
                                microseconds: 1
                            ) ,
                            curve: Curves.fastLinearToSlowEaseIn
                        );
                      }
                    } ,
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              )
            ],
          ),
        )

    );
  }
}
Widget buildBoardingItem (BoardingModel obj ,context)=>Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      child: Image(
        image: AssetImage( "${obj.image}"  ,),
      ),
    ),
    SizedBox(height: 20,),
    Text("${obj.Title}" ,
        style:TextStyle(
            fontSize: 30 ,
            color: defaultColor,
            fontWeight: FontWeight.bold
        )
    ),
    SizedBox(height: 20,),
    Text("${obj.body}" ,
        style:Theme.of(context).textTheme.bodyText1,
    ),

  ],
);