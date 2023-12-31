import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testapp/CustomWidget/app_text.dart';



class BaseAppScaffold extends StatelessWidget {
  final Widget child;
  final bool isIcon;
  const BaseAppScaffold({Key? key, required this.child, this.isIcon=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var th = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shadowColor: Colors.grey.withOpacity(0.5),
        elevation: 0,
        title: Container(

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.menu,size: 18,),
                  SizedBox(width: 4,),
                  AppText("MENU",style: th.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,fontSize: 15
                  ),),
                ],
              ), 
              SvgPicture.asset('assets/AppBar/logo.svg',height: 35,width: 40,),
              isIcon?Container(
                child: Row(
                  children: [
                    AppText("Go to the test",style: th.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,fontSize: 15
                    ),),
                    SizedBox(width: 8,),
                    Icon(CupertinoIcons.arrow_right,size: 18,),
                  ],
                ),
              ):SizedBox.shrink(),

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
