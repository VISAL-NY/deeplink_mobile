import 'package:deeplink_cookbook/core/models/confirm_response_model.dart';
import 'package:deeplink_cookbook/core/models/inquiry_response_model.dart';
import 'package:deeplink_cookbook/presentation/web_page/responsive_web/res_web_not_success.dart';
import 'package:deeplink_cookbook/presentation/web_page/web_not_success.dart';
import 'package:flutter/material.dart';

class WebMainNotSuccess extends StatelessWidget {
   WebMainNotSuccess({super.key});
   late ConfirmV2ResponseModel confirmResponseModel;
  //late InquiryV4ResponseModel inquiryV4ResponseModel;
  late InquiryV5ResponseModel inquiryV5ResponseModel;
  late String myAccount;

   WebMainNotSuccess.sendData({required this.confirmResponseModel,required this.inquiryV5ResponseModel,required this.myAccount,super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context,constaint){
          if(constaint.maxWidth > 840){
            return WebNotSuccess(confirmResponseModel: confirmResponseModel,inquiryV5ResponseModel: inquiryV5ResponseModel,myAccount: myAccount,);
          }
          else{
            return ResWebNotSuccess(confirmResponseModel: confirmResponseModel, inquiryV5ResponseModel: inquiryV5ResponseModel, myAccount: myAccount);
          }
        }
        ),
    );
  }
}