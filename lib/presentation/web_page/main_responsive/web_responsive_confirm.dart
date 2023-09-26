
import 'package:deeplink_cookbook/core/api/inquiry_request.dart';
import 'package:deeplink_cookbook/core/models/models.dart';
import 'package:deeplink_cookbook/presentation/web_page/response_web/res_web_confirm.dart';
import 'package:deeplink_cookbook/presentation/web_page/web_confrim.dart';
import 'package:flutter/material.dart';

class WebResponsive extends StatelessWidget {

  Future<NewModelTest> inquiryAsyn(){
     return InquiryRequest.requestInquiry();
  }
  String myAccount="";
  WebResponsive({super.key});
  WebResponsive.sendData({required this.myAccount,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: inquiryAsyn(),
        builder: (context, snapshot) {
        if (snapshot.hasData) {
          return LayoutBuilder(
            builder: (context, constraints) {
            if (constraints.maxWidth > 840) {
              return WebConfirm(
                newModelTest: snapshot.data!,
                myAccount: myAccount,
              );
            } else {
              return ResWebConfirm(newModelTest: snapshot.data!,myAccount: myAccount);
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
