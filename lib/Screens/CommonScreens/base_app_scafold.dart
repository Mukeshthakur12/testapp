import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testapp/CustomWidget/app_text.dart';



class BaseAppScaffold extends StatelessWidget {
  final Widget child;
  const BaseAppScaffold({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var th = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shadowColor: Colors.grey.withOpacity(0.5),
        elevation: 1,
        title: Container(

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.menu),
                  SizedBox(width: 4,),
                  AppText("MENU"),
                ],
              ), 
              SvgPicture.asset('assets/AppBar/logo.svg'),
              AppText(" ")

            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: child,
          )
        ],
      ),
    );
  }
}
