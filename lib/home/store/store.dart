import 'package:flutter/material.dart';

import '../../style/color.dart';

class rewardscreen extends StatelessWidget {
  // const store({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: defaultColor),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(top:80.0),
        child: Text("Reward Screen" ,style:TextStyle(fontSize: 40)),
      ),
    );
  }
}
