import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../WebView/webviewscreen.dart';
import '../constant/const.dart';
import '../style/color.dart';

void NavigateAndRep(context ,widget)=> Navigator.pushReplacement(
  context,
  MaterialPageRoute(
      builder: (context)=>widget) ,
);


void NavigateTo(context ,widget)=> Navigator.push(
  context,
  MaterialPageRoute(
      builder: (context)=>widget) ,
);


Widget defaultForm (
    {
required TextEditingController controller ,
required TextInputType type  ,
Function? onsubmit ,
Function? onchange ,
Function? onTap ,
dynamic Validator ,
required String text ,
required IconData prefixIcon ,
IconData? suffixIcon ,
bool isSecure = false ,


    }
    )=>TextFormField(

keyboardType: type,
controller:controller ,
onFieldSubmitted: ( value){
  onsubmit!(value);
  },

  validator: Validator ,
  onChanged: (Value){
  onchange!(Value);
  } ,
  obscureText: isSecure,
  style: TextStyle(color: isDark ? Colors.black : Colors.white),
  decoration: InputDecoration(
    labelText: text ,
    // labelStyle: TextStyle(color: defaultColor),
    labelStyle:TextStyle(color: isDark ? Colors.grey[800]: Colors.white),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15)
    ),
    prefixIcon: Icon(prefixIcon, color:defaultColor,),
    suffixIcon: IconButton(
        onPressed:(){
          onTap!();
        },
        icon: Icon(suffixIcon)),


  ),

);


Widget defaultbutton(
    {
      required String text ,
      required Function onpress ,
    }
    )=> Container(
  width: double.infinity,
  height: 43,
  decoration:BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
    color: defaultColor,
  ),
  child: MaterialButton(
    onPressed:()
    {
      onpress() ;
    } ,
    child: Text(text ,
      style: TextStyle(fontSize: 20 , color: Colors.white ,),
    ),


  ),
);

Widget defaultTextButton (
    {
      required Function onpress ,
      required String text ,
    }
    )=>   TextButton(
    onPressed: ()
    {
      onpress();
    },
    child: Text(text ,style: TextStyle(fontSize: 16),)
);


//Api




Widget BuildApiItem(business ,context) =>InkWell(
  onTap: ()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewScreen(url: business['url'])));
  },
  child:   Padding(
    padding: const EdgeInsets.all(20),
    child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image:NetworkImage('${business["urlToImage"]}',),
                fit: BoxFit.cover
            ) ,
          ),
        ),
        SizedBox(width: 20,) ,
        Expanded(
          child: Container(
            height: 120 ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("'${business["title"]}'" , style:Theme.of(context).textTheme.bodyText2 ,maxLines: 2,overflow: TextOverflow.ellipsis) ,
                SizedBox(height: 10,) ,
                Text("'${business["publishedAt"]}'" , style: TextStyle(fontSize: 12),maxLines: 1,overflow: TextOverflow.ellipsis )
              ],
            ),
          ),
        )
      ],
    ),
  ),
);

Widget MyDivider() => Padding(
  padding: const EdgeInsets.all(4),
  child:   Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey[300],
  ),
);


Widget resetTextButton({required Function onpress,required String text})
{
  return   Container(
    height: 45,
    padding: EdgeInsetsDirectional.only(
        start: 15 ,
        end: 25
    ),
    child: defaultbutton(
      text: text ,
      onpress:()
      {
        onpress!();
      } ,
    ),
  );
}


Widget? showProgressIndicator(BuildContext context) {

  AlertDialog alertDialog = AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(defaultColor),
      ),
    ),
  );
  showDialog(
    barrierColor: Colors.white.withOpacity(0),
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return alertDialog;
    },
  );
}
void showToast(
{
  required String text  ,
  required ToastStates state
}
    )=>   Fluttertoast.showToast(
    msg: text ,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);

enum ToastStates {SUCCESS , ERROR , WARNING}

Color chooseToastColor(ToastStates state)
{
  Color color ;
  switch(state)
      {
    case ToastStates.SUCCESS:
      color =  Colors.green ;
      break ;
    case ToastStates.ERROR:
      color =  Colors.red ;
      break ;
    case ToastStates.WARNING:
      color =  Colors.amber ;
      break ;
      }
      return color ;

}