import 'package:deeplink_cookbook/core/models/models.dart';
import 'package:deeplink_cookbook/presentation/web_page/response_web/res_web_confirm_with_otp.dart';
import 'package:deeplink_cookbook/presentation/web_page/web_confirm_with_otp.dart';
import 'package:flutter/material.dart';

class WebResponsiveWithOTP extends StatelessWidget {
  
  WebResponsiveWithOTP({super.key});
  late NewModelTest newModelTest;
  late String myAccount;
  WebResponsiveWithOTP.sendData({required this.newModelTest,required this.myAccount,super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context,constraints){
          if(constraints.maxWidth > 840){ 
            return  WebConfrimWithOTP(newtestModel: newModelTest,myAccount: myAccount,);
          }
          else{
            return  ResWebConfirmWithOPT(newModelTest: newModelTest,myAccount: myAccount,);
          }
        }
        ),
    );
  }
}