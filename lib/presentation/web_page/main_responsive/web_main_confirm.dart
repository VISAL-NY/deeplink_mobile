
import 'package:deeplink_cookbook/core/api/inquiry_request.dart';
import 'package:deeplink_cookbook/core/helper/decode_base64.dart';
import 'package:deeplink_cookbook/core/models/inquiry_response_model.dart';
import 'package:deeplink_cookbook/core/models/inquriy_request_model.dart';
import 'package:deeplink_cookbook/presentation/web_page/responsive_web/res_web_confirm.dart';
import 'package:deeplink_cookbook/presentation/web_page/web_confrim.dart';
import 'package:flutter/material.dart';

class WebMainConfirm extends StatelessWidget {


  String myAccount="";
  late String suburl;
  String identityCode="";

  WebMainConfirm({required this.suburl,super.key});
  WebMainConfirm.sendData({required this.myAccount,super.key});

  //   Future<InquiryV4ResponseModel> inquiryAsyn(){
  //    return InquiryRequest.requestInquiryV4();
  // }

  //DECODE FROM base64
 

  Future<InquiryV5ResponseModel> inquiryV5Async(){
    identityCode=DecodeBase64.decodeBase64(suburl);
    return InquiryRequest.requestInquiryV5(InquiryV5RequestModel(identityCode: identityCode,feeChannel: "MERCHANT"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: inquiryV5Async(),
        builder: (context, snapshot) {
        if (snapshot.hasData) {
          return LayoutBuilder(
            builder: (context, constraints) {
            if (constraints.maxWidth > 840) {
              return WebConfirm(
                inquiryV5ResponseModel: snapshot.data!,
                myAccount: myAccount,
                identityCode: identityCode,
              );
            } else {
              return ResWebConfirm(
                inquiryV5ResponseModel: snapshot.data!,
                myAccount: myAccount,
                identityCode: identityCode,
                );
            }
          });
        } 
        else if(snapshot.hasError){
         debugPrint("It's Error");
         return Container(
          alignment: Alignment.center,
          child: const Text("Can not request data"),
         );
        }
        else {
          return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
