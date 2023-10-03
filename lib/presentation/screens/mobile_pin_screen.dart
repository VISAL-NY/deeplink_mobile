

import 'package:deeplink_cookbook/core/models/inquiry_response_model.dart';
import 'package:deeplink_cookbook/presentation/screens/mobile_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:vibration/vibration.dart';
import '../../core/models/models.dart';

class MobilePinScreen extends StatefulWidget {
  late String myAccount;
  late String identityCode;
  //late InquiryV4ResponseModel inquiryV5ResponseModel;
  late InquiryV5ResponseModel inquiryV5ResponseModel;
  MobilePinScreen({super.key});

  MobilePinScreen.sendData(
      {required this.myAccount,
      required this.inquiryV5ResponseModel,
      required this.identityCode,
      super.key});
  @override
  State<MobilePinScreen> createState() => _MobilePinScreenState();
}

class _MobilePinScreenState extends State<MobilePinScreen> {
  // Future<ConfirmV2ResponseModel> confirmV2Asyn() {
  //   final now = DateTime.now();
  //   String guid = now.microsecondsSinceEpoch.toString();
  //   return SubmitPayment.submitV2Payment(ConfirmV2RequestModel(
  //       billCode: "",
  //       customerCode: "",
  //       billAmount:
  //           widget.inquiryV5ResponseModel.data!.transaction!.originalAmount,
  //       totalAmount: widget.inquiryV5ResponseModel.data!.transaction!.totalAmount,
  //       currency: widget.inquiryV5ResponseModel.data!.transaction!.currency,
  //       paymentToken:
  //           widget.inquiryV5ResponseModel.data!.transaction!.paymentToken,
  //       paymentBy: widget.myAccount,
  //       paymentAccount: widget.myAccount,
  //       paymentType: "Online",
  //       refNo: guid,
  //       note: "payment from deeplink",
  //       paymentAccountName: widget.myAccount,
  //       paymentAccountPhoneNumber: widget.myAccount,
  //       paymentFee:
  //           widget.inquiryV5ResponseModel.data!.transaction!.convenienceFeeAmount,
  //       paymentChannel:
  //           widget.inquiryV5ResponseModel.data!.transaction!.feeChannel,
  //       paymentFeeChargeBy: ""));
  // }


  // _showErrorConfirmDialog(ConfirmV3ResponseModel responseModel) {
  //   return showDialog(
  //       barrierDismissible: false,
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           actions: [
  //             GestureDetector(
  //                 onTap: () =>
  //                     Navigator.popUntil(context, (route) => route.isFirst),
  //                 child: Container(
  //                   padding: const EdgeInsets.all(5),
  //                   decoration: BoxDecoration(color: CONST.backColor),
  //                   child: Text(
  //                     "Close",
  //                     style: TextStyle(color: CONST.white),
  //                   ),
  //                 ))
  //           ],
  //           content: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Align(
  //                 alignment: Alignment.center,
  //                 child: Container(
  //                   padding: const EdgeInsets.all(10),
  //                   decoration: BoxDecoration(color: CONST.backColor),
  //                   child: Text(
  //                     responseModel.code,
  //                     style: TextStyle(color: CONST.white, fontSize: 16),
  //                   ),
  //                 ),
  //               ),
  //               const SizedBox(
  //                 height: 5,
  //               ),
  //               SingleChildScrollView(
  //                 scrollDirection: Axis.horizontal,
  //                 child: Container(
  //                   alignment: Alignment.centerLeft,
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Row(
  //                         children: [
  //                           const SelectableText(("Message : ")),
  //                           SelectableText(
  //                             responseModel.message,
  //                             maxLines: 1,
  //                             style: const TextStyle(
  //                                 overflow: TextOverflow.ellipsis),
  //                           )
  //                         ],
  //                       ),
  //                       Row(
  //                         children: [
  //                           const SelectableText(("Message_Kh : ")),
  //                           SelectableText(
  //                             responseModel.messageKh!,
  //                             maxLines: 1,
  //                             style: const TextStyle(
  //                                 overflow: TextOverflow.ellipsis),
  //                           )
  //                         ],
  //                       ),
  //                       const SizedBox(
  //                         height: 5,
  //                       ),
  //                       const Divider(
  //                         thickness: 1,
  //                       ),
  //                       const SizedBox(
  //                         height: 5,
  //                       ),
  //                       Row(
  //                         children: [
  //                           const SelectableText(("Receipt : ")),
  //                           SelectableText(
  //                             responseModel.data!.transaction!.bankRef,
  //                             maxLines: 1,
  //                             style: const TextStyle(
  //                                 overflow: TextOverflow.ellipsis),
  //                           )
  //                         ],
  //                       ),
  //                       Row(
  //                         children: [
  //                           const SelectableText(("Paid Date  : ")),
  //                           SelectableText(
  //                             ConvertFormat.convertDateTimeToString(
  //                                 responseModel.data!.transaction!.bankRef),
  //                             maxLines: 1,
  //                             style: const TextStyle(
  //                                 overflow: TextOverflow.ellipsis),
  //                           )
  //                         ],
  //                       ),
  //                       Row(
  //                         children: [
  //                           const SelectableText(("Ref No : ")),
  //                           SelectableText(
  //                             responseModel.data!.transaction!.bankRef,
  //                             maxLines: 1,
  //                             style: const TextStyle(
  //                                 overflow: TextOverflow.ellipsis),
  //                           )
  //                         ],
  //                       ),
  //                       Row(
  //                         children: [
  //                           const SelectableText(("Total Amount : ")),
  //                           SelectableText(
  //                             "${ConvertFormat.convertCurrency(responseModel.data!.transaction!.totalAmount, responseModel.data!.transaction!.currency)} ${responseModel.data!.transaction!.currency}",
  //                             maxLines: 1,
  //                             style: const TextStyle(
  //                                 overflow: TextOverflow.ellipsis),
  //                           )
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               )
  //             ],
  //           ),
  //         );
  //       });
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScreenLock(
          secretsConfig: const SecretsConfig(
              padding: EdgeInsets.only(top: 30, bottom: 50),
              secretConfig: SecretConfig(borderSize: 2, size: 25)),
          title: Text(
            "Please enter PIN code",
            style: TextStyle(fontSize: 20, color: CONST.white),
          ),
          onCancelled: () => Navigator.pop(context),
          cancelButton: Text(
            "Back",
            style: TextStyle(color: CONST.white),
          ),
          deleteButton: Icon(
            Icons.backspace_outlined,
            color: CONST.white,
            size: 32,
          ),
          correctString: '1234',
          onError: (value) {
            Vibration.vibrate(duration: 150);
          },
          onUnlocked: ()  {
            Navigator.pushReplacement(context, 
            MaterialPageRoute(builder: (context)=>
              MobileSuccessScreen.sendData(
                myAccount: widget.myAccount, 
                inquiryV5ResponseModel: widget.inquiryV5ResponseModel, 
                identityCode: widget.identityCode,)
            )
            );
            // FutureBuilder(
            //   future: confirmV3Asyn(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       if (snapshot.data!.code == "SUCCESS") {
            //         //NAVIGATOR TO SUCCESS SCREEN
            //         Navigator.pushReplacement(
            //             (context),
            //             MaterialPageRoute(
            //                 builder: (context) => MobileSuccessScreen.sendData(
            //                       myAccount: widget.myAccount,
            //                       inquiryV5ResponseModel:
            //                           widget.inquiryV5ResponseModel,
            //                       confirmResponseModel: snapshot.data!,
            //                     )));
            //         return const SizedBox();
                    
            //       } else {
            //          return _showErrorConfirmDialog(snapshot.data!);
                   
            //       }
            //     } else if (snapshot.hasError) {
            //       return const Center(
            //         child: Text("ERROR CONFIRM PAYMENT"),
            //       );
            //     } else {
            //       return const Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     }
            //   },
            // );

            // var confirmResponseModel = await confirmV2Asyn();
            // if (confirmResponseModel.code != "SUCCESS") {
            //   _showErrorConfirmDialog(confirmResponseModel);
            // } else {
            // Navigator.pushReplacement(
            //     (context),
            //     MaterialPageRoute(
            //         builder: (context) => MobileSuccessScreen.sendData(
            //               myAccount: widget.myAccount,
            //               inquiryV5ResponseModel: widget.inquiryV5ResponseModel,
            //               confirmResponseModel: confirmResponseModel,
            //             )));
            //}
          },
          keyPadConfig: KeyPadConfig(
              buttonConfig: KeyPadButtonConfig(
                  buttonStyle:
                      OutlinedButton.styleFrom(foregroundColor: CONST.white),
                  fontSize: 30,
                  backgroundColor: CONST.fontColor.withOpacity(0.2))),
        ),
        backgroundColor: CONST.backColor,
      ),
    );
  }
}
