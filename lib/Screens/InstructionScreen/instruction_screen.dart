import 'package:flutter/material.dart';
import 'package:testapp/CustomWidget/app_text.dart';
import 'package:testapp/Screens/CommonScreens/app_bact_scalfold.dart';

class InstructionScreen extends StatelessWidget {
  const InstructionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var th = Theme.of(context).textTheme;

    return AppBackScalfold(
        isIcon: true,
        child: Container(
         child: AppText("Read the instruction carefully",style: th.titleMedium?.copyWith(
           fontSize: 28,fontWeight: FontWeight.w500
         ),),
    ));
  }
}
