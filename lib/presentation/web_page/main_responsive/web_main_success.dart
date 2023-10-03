import 'package:deeplink_cookbook/core/api/submit_payment.dart';
import 'package:deeplink_cookbook/core/models/confirm_request_model.dart';
import 'package:deeplink_cookbook/core/models/confirm_response_model.dart';
import 'package:deeplink_cookbook/core/models/inquiry_response_model.dart';
import 'package:deeplink_cookbook/core/models/models.dart';
import 'package:deeplink_cookbook/presentation/web_page/responsive_web/res_web_success.dart';
import 'package:deeplink_cookbook/presentation/web_page/web_success.dart';
import 'package:flutter/material.dart';

class WebMainSuccess extends StatelessWidget {
  WebMainSuccess({super.key});
  late String identityCode;
  //late InquiryV4ResponseModel inquiryV5ResponseModel;
  late InquiryV5ResponseModel inquiryV5ResponseModel;
  late String myAccount;

  WebMainSuccess.sendData(
      {required this.identityCode,
      required this.inquiryV5ResponseModel,
      required this.myAccount,
      super.key});
  Future<ConfirmV3ResponseModel> submitV3PaymentAsyc() {
    var now = DateTime.now();
    String guid = now.microsecondsSinceEpoch.toString();
    return SubmitPayment.submitV3Payment(ConfirmV3RequestModel(
        identityCode: identityCode,
        feeChannel: "MERCHANT",
        bankRef: guid,
        bankDate: DateTime.now().toString(),
        originalAmount:
            inquiryV5ResponseModel.data!.transaction!.originalAmount,
        convenienceFeeAmount:
            inquiryV5ResponseModel.data!.transaction!.convenienceFeeAmount,
        sponsorFeeAmount:
            inquiryV5ResponseModel.data!.transaction!.sponsorFeeAmount,
        totalAmount: inquiryV5ResponseModel.data!.transaction!.totalAmount,
        currency: inquiryV5ResponseModel.data!.transaction!.currency,
        description: "Payment Online",
        paymentToken: inquiryV5ResponseModel.data!.transaction!.paymentToken,
        payerAccountNo: myAccount,
        payerAccountName: myAccount,
        payerPhone: myAccount));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: submitV3PaymentAsyc(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if(snapshot.data!.code!=CONST.success){
                return Container(
                  color: CONST.backColor,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: Image.asset("asset/cancel.png")),
                      const SizedBox(height: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SelectableText("CODE : ",style: TextStyle(color: CONST.white),),
                              SelectableText(snapshot.data!.code,style: TextStyle(color: CONST.white))
                            ],
                          ),
                         const SizedBox(height: 10,),
                           Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SelectableText("MESSAGE : ",style: TextStyle(color: CONST.white),),
                              SelectableText(snapshot.data!.message,style: TextStyle(color: CONST.white))
                            ],
                          ),
                          const SizedBox(height: 10,),
                           Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SelectableText("MESSAGE_KH : ",style: TextStyle(color: CONST.white),),
                              SelectableText(snapshot.data!.messageKh!,style: TextStyle(color: CONST.white))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                );
              }
              return LayoutBuilder(builder: ((context, constraints) {
                if (constraints.maxWidth > 840) {
                  return WebSuccess(
                    confirmResponseModel: snapshot.data!,
                    inquiryV5ResponseModel: inquiryV5ResponseModel,
                    myAccount: myAccount,
                  );
                } else {
                  return ResWebSuccess(
                    confirmResponseModel: snapshot.data!,
                    inquiryV5ResponseModel: inquiryV5ResponseModel,
                    myAccount: myAccount,
                  );
                }
              }));
            } else if (snapshot.hasError) {
              return Container(
                alignment: Alignment.center,
                child: const Text("Can not submit payment"),
              );
            } else {
              return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              );
            }
          }),
      // body: LayoutBuilder(
      //   builder: (context,constraints){
      //     if(constraints.maxWidth > 840){
      //       return  WebSuccess(confirmResponseModel: confirmResponseModel,inquiryV5ResponseModel: inquiryV5ResponseModel,myAccount: myAccount,);
      //     }
      //     else{
      //       return  ResWebSuccess(confirmResponseModel: confirmResponseModel,inquiryV5ResponseModel: inquiryV5ResponseModel,myAccount: myAccount,);
      //     }
      //   }
      //   ),
    );
  }
}
