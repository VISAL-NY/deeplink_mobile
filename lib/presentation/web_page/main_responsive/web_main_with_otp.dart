import 'package:deeplink_cookbook/core/models/inquiry_response_model.dart';
import 'package:deeplink_cookbook/presentation/web_page/responsive_web/res_web_confirm_with_otp.dart';
import 'package:deeplink_cookbook/presentation/web_page/web_confirm_with_otp.dart';
import 'package:flutter/material.dart';

class WebMainWithOTP extends StatelessWidget {
  WebMainWithOTP({super.key});
  //late InquiryV4ResponseModel inquiryV5ResponseModel;
  late InquiryV5ResponseModel inquiryV5ResponseModel;
  late String myAccount;
  late String identityCode;
  WebMainWithOTP.sendData(
      {required this.inquiryV5ResponseModel, required this.myAccount,required this.identityCode ,super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 840) {
          return WebConfrimWithOTP(
            inquiryV5ResponseModel: inquiryV5ResponseModel,
            myAccount: myAccount,
            identityCode: identityCode,
          );
        } else {
          return ResWebConfirmWithOPT(
            inquiryV5ResponseModel: inquiryV5ResponseModel,
            myAccount: myAccount,
            identityCode: identityCode,
          );
        }
      }),
    );
  }
}
