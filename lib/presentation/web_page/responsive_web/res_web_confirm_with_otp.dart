
import 'package:deeplink_cookbook/core/helper/convert_format.dart';

import 'package:deeplink_cookbook/core/models/inquiry_response_model.dart';
import 'package:deeplink_cookbook/core/models/models.dart';
import 'package:deeplink_cookbook/presentation/web_page/main_responsive/web_main_success.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ResWebConfirmWithOPT extends StatefulWidget {

  //InquiryV4ResponseModel inquiryV5ResponseModel;
  InquiryV5ResponseModel inquiryV5ResponseModel;
  String myAccount;
  String identityCode;
  ResWebConfirmWithOPT({
    required this.inquiryV5ResponseModel,
    required this.myAccount, 
    required this.identityCode,
    super.key});

  @override
  State<ResWebConfirmWithOPT> createState() => _ResWebConfirmWithOPTState();
}

class _ResWebConfirmWithOPTState extends State<ResWebConfirmWithOPT> {
  final _firstOTP = TextEditingController();
  final _secondOTP = TextEditingController();
  final _thirdOTP = TextEditingController();
  final _fourOTP = TextEditingController();

  late bool _isCorrectOTP;
  final _secondFocusNode = FocusNode();
  final _thirdFocusNode = FocusNode();
  final _fourFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _isCorrectOTP = true;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: CONST.backColor,
          centerTitle: false,
          title: Text(
            CONST.bankName,
            style: TextStyle(color: CONST.white),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            color: CONST.backColor,
            alignment: Alignment.center,
            padding: EdgeInsets.only(
                top: 20,
                bottom: 40,
                right: MediaQuery.sizeOf(context).width * 0.1,
                left: MediaQuery.sizeOf(context).width * 0.1),
            child: Container(
              decoration: BoxDecoration(
                  color: CONST.white, borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "asset/shop.png",
                          height: 40,
                          width: 40,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.inquiryV5ResponseModel.data!.merchant.name,
                          style: const TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Amount to pay",
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          RichText(
                              text: TextSpan(
                                  text: ConvertFormat.convertCurrency(
                                      widget.inquiryV5ResponseModel.data!.transaction!
                                          .originalAmount,
                                      widget.inquiryV5ResponseModel.data!.transaction!
                                          .currency),
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: CONST.fontColor,
                                      fontWeight: FontWeight.bold),
                                  children: [
                                TextSpan(
                                    text: widget
                                        .inquiryV5ResponseModel.data!.transaction!.currency,
                                    style: TextStyle(
                                        fontSize: 18, color: CONST.fontColor))
                              ]))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                        width: MediaQuery.sizeOf(context).width * 0.7,
                        decoration: BoxDecoration(
                            color: CONST.backColor,
                            borderRadius: BorderRadius.circular(5)),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Original amount",
                                  style: TextStyle(color: CONST.white),
                                ),
                                Text(
                                  "${ConvertFormat.convertCurrency(widget.inquiryV5ResponseModel.data!.transaction!.originalAmount, widget.inquiryV5ResponseModel.data!.transaction!.currency)} ${widget.inquiryV5ResponseModel.data!.transaction!.currency}",
                                  style: TextStyle(color: CONST.white),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Convenience fee",
                                  style: TextStyle(color: CONST.white),
                                ),
                                Text(
                                  "${ConvertFormat.convertCurrency(widget.inquiryV5ResponseModel.data!.transaction!.convenienceFeeAmount, widget.inquiryV5ResponseModel.data!.transaction!.currency)} ${widget.inquiryV5ResponseModel.data!.transaction!.currency}",
                                  style: TextStyle(color: CONST.white),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total amount",
                                  style: TextStyle(color: CONST.white),
                                ),
                                Text(
                                  "${ConvertFormat.convertCurrency(widget.inquiryV5ResponseModel.data!.transaction!.totalAmount, widget.inquiryV5ResponseModel.data!.transaction!.currency)} ${widget.inquiryV5ResponseModel.data!.transaction!.currency}",
                                  style: TextStyle(color: CONST.white),
                                )
                              ],
                            ),
                          ],
                        )),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.7,
                      height: 60,
                      child: const Divider(
                        thickness: 1,
                      ),
                    ),
                    Column(
                      children: [
                        const Text(
                          "OTP Verification",
                          style: TextStyle(fontSize: 22),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text("OTP was sent to 010****99"),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                            text: const TextSpan(
                                text: "DON'T see OTP?",
                                children: [
                              TextSpan(
                                  text: '   Resend',
                                  style: TextStyle(color: Colors.blueAccent))
                            ])),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 4, right: 4),
                              child: SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: TextFormField(
                                    controller: _firstOTP,
                                    autofocus: true,
                                    onChanged: (value) {
                                      _secondFocusNode.requestFocus();
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(1)
                                    ],
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5))),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4, right: 4),
                              child: SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: TextFormField(
                                    onChanged: (value) =>
                                        _thirdFocusNode.requestFocus(),
                                    controller: _secondOTP,
                                    focusNode: _secondFocusNode,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(1)
                                    ],
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4, right: 4),
                              child: SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: TextFormField(
                                    onChanged: (value) =>
                                        _fourFocusNode.requestFocus(),
                                    focusNode: _thirdFocusNode,
                                    controller: _thirdOTP,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(1)
                                    ],
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5))),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4, right: 4),
                              child: SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: TextFormField(
                                    focusNode: _fourFocusNode,
                                    controller: _fourOTP,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(1)
                                    ],
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5))),
                                  )),
                            ),
                          ],
                        ),
                        _isCorrectOTP
                            ? Container()
                            : Container(
                                padding:
                                    const EdgeInsets.only(bottom: 10, top: 10),
                                child: const Text(
                                  'Incorrect OTP',
                                  style: TextStyle(color: Colors.red),
                                )),
                        GestureDetector(
                          onTap: () async {
                            //context.goNamed('success');
                            if (_firstOTP.text == '1' &&
                                _secondOTP.text == '2' &&
                                _thirdOTP.text == '3' &&
                                _fourOTP.text == '4') {
                              setState(() {
                                _isCorrectOTP = true;
                                //context.goNamed('success');
                              });
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                                  WebMainSuccess.sendData(
                                    inquiryV5ResponseModel:widget.inquiryV5ResponseModel, 
                                    myAccount:widget.myAccount, 
                                    identityCode:widget.identityCode)
                                ));

                              // final now=DateTime.now();
                              // String guid=now.microsecondsSinceEpoch.toString();
                              // var confirmResponseModel = await SubmitPayment.submitV2Payment(
                              //   ConfirmV2RequestModel(
                              //     billCode: widget.identityCode, 
                              //     customerCode: widget.identityCode, 
                              //     billAmount: widget.inquiryV5ResponseModel.data!.transaction!.originalAmount, 
                              //     totalAmount: widget.inquiryV5ResponseModel.data!.transaction!.totalAmount, 
                              //     currency: widget.inquiryV5ResponseModel.data!.transaction!.currency, 
                              //     paymentToken: widget.inquiryV5ResponseModel.data!.transaction!.paymentToken, 
                              //     paymentBy: widget.myAccount, 
                              //     paymentAccount: widget.myAccount, 
                              //     paymentType: "Online", 
                              //     refNo: guid, 
                              //     note: "payment from deeplink", 
                              //     paymentAccountName: widget.myAccount, 
                              //     paymentAccountPhoneNumber: widget.myAccount, 
                              //     paymentFee: widget.inquiryV5ResponseModel.data!.transaction!.convenienceFeeAmount, 
                              //     paymentChannel: widget.inquiryV5ResponseModel.data!.transaction!.feeChannel, 
                              //     paymentFeeChargeBy: "")
                              // );
                                // if (confirmResponseModel.code != "SUCCESS") {
                                //    await Navigator.pushReplacement(
                                //       (context),
                                //       MaterialPageRoute(
                                //           builder: (context) =>
                                //               WebMainNotSuccess.sendData(
                                //                 confirmResponseModel:
                                //                     confirmResponseModel,
                                //                 inquiryV5ResponseModel:
                                //                     widget.inquiryV5ResponseModel,
                                //                     myAccount: widget.myAccount,
                                //               )));
                                // } else {
                                //   await Navigator.pushReplacement(
                                //       (context),
                                //       MaterialPageRoute(
                                //           builder: (context) =>
                                //               WebMainSuccess.sendData(
                                //                 confirmResponseModel:
                                //                     confirmResponseModel,
                                //                 inquiryV5ResponseModel:
                                //                     widget.inquiryV5ResponseModel,
                                //                     myAccount: widget.myAccount,
                                //               )));
                                // }
                            } else {
                              setState(() {
                                _isCorrectOTP = false;
                                _firstOTP.text = '';
                                _secondOTP.text = '';
                                _thirdOTP.text = '';
                                _fourOTP.text = '';
                              });
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.sizeOf(context).width * 0.7,
                            height: 50,
                            decoration: BoxDecoration(color: CONST.backColor),
                            child: Text(
                              "Continue",
                              style: TextStyle(color: CONST.white),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
