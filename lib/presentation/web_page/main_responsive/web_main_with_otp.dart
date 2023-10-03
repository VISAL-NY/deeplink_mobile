import 'package:deeplink_cookbook/core/api/submit_payment.dart';
import 'package:deeplink_cookbook/core/models/confirm_request_model.dart';
import 'package:deeplink_cookbook/core/models/confirm_response_model.dart';
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

  Future<ConfirmV3ResponseModel> submitV3PaymentAsyc(){
    var now =DateTime.now();
    String guid=now.microsecondsSinceEpoch.toString();
    return SubmitPayment.submitV3Payment(ConfirmV3RequestModel(
      identityCode: identityCode, 
      feeChannel: "MERCHANT", 
      bankRef: guid, 
      bankDate: DateTime.now().toString(), 
      originalAmount: inquiryV5ResponseModel.data!.transaction!.originalAmount, 
      convenienceFeeAmount: inquiryV5ResponseModel.data!.transaction!.convenienceFeeAmount, 
      sponsorFeeAmount: inquiryV5ResponseModel.data!.transaction!.sponsorFeeAmount, 
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
