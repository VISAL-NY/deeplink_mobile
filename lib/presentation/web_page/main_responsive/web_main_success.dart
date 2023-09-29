import 'package:deeplink_cookbook/core/models/confirm_response_model.dart';
import 'package:deeplink_cookbook/core/models/inquiry_response_model.dart';
import 'package:deeplink_cookbook/presentation/web_page/responsive_web/res_web_success.dart';
import 'package:deeplink_cookbook/presentation/web_page/web_success.dart';
import 'package:flutter/material.dart';

class WebMainSuccess extends StatelessWidget {

  WebMainSuccess({super.key});
  late ConfirmV2ResponseModel confirmResponseModel;
  //late InquiryV4ResponseModel inquiryV5ResponseModel;
  late InquiryV5ResponseModel inquiryV5ResponseModel;
  late String myAccount;

  WebMainSuccess.sendData({required this.confirmResponseModel,required this.inquiryV5ResponseModel,required this.myAccount,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context,constraints){
          if(constraints.maxWidth > 840){ 
            return  WebSuccess(confirmResponseModel: confirmResponseModel,inquiryV5ResponseModel: inquiryV5ResponseModel,myAccount: myAccount,);
          }
          else{
            return  ResWebSuccess(confirmResponseModel: confirmResponseModel,inquiryV5ResponseModel: inquiryV5ResponseModel,myAccount: myAccount,);
          }
        }
        ),
    );
  }
}