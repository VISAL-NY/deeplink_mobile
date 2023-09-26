import 'package:deeplink_cookbook/core/api/submit_payment.dart';
import 'package:deeplink_cookbook/core/helper/convert_format.dart';
import 'package:deeplink_cookbook/core/models/confirm_response_model.dart';
import 'package:deeplink_cookbook/core/models/models.dart';
import 'package:deeplink_cookbook/presentation/web_page/main_responsive/web_responsive_not_suceess.dart';
import 'package:deeplink_cookbook/presentation/web_page/main_responsive/web_responsive_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResWebConfirmWithOPT extends StatefulWidget {
  NewModelTest newModelTest;
  String myAccount;
  ResWebConfirmWithOPT({required this.newModelTest,required this.myAccount, super.key});

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

   _showErrorConfirmDialog(ConfirmResponseModel responseModel) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              GestureDetector(
                  onTap: () =>
                      Navigator.popUntil(context, (route) => route.isFirst),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(color: CONST.backColor),
                    child: Text(
                      "Close",
                      style: TextStyle(color: CONST.white),
                    ),
                  ))
            ],
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: CONST.backColor),
                    child: Text(
                      responseModel.code,
                      style: TextStyle(color: CONST.white, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const SelectableText(("Message : ")),
                            SelectableText(
                              responseModel.message,
                              maxLines: 1,
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const SelectableText(("Message_Kh : ")),
                            SelectableText(
                              responseModel.messageKh!,
                              maxLines: 1,
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const SelectableText(("Receipt : ")),
                            SelectableText(
                              responseModel.data.receiptCode,
                              maxLines: 1,
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const SelectableText(("Paid Date  : ")),
                            SelectableText(
                              ConvertFormat.convertDateTimeToString(
                                  responseModel.data.paidDate),
                              maxLines: 1,
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const SelectableText(("Ref No : ")),
                            SelectableText(
                              responseModel.data.refNo,
                              maxLines: 1,
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const SelectableText(("Total Amount : ")),
                            SelectableText(
                              "${ConvertFormat.convertCurrency(responseModel.data.totalAmount, responseModel.data.currency)} ${responseModel.data.currency}",
                              maxLines: 1,
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
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
                          widget.newModelTest.data.supplier.name,
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
                                      widget.newModelTest.data.balances[0]
                                          .billAmount,
                                      widget.newModelTest.data.balances[0]
                                          .currency),
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: CONST.fontColor,
                                      fontWeight: FontWeight.bold),
                                  children: [
                                TextSpan(
                                    text: widget
                                        .newModelTest.data.balances[0].currency,
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
                                  "${ConvertFormat.convertCurrency(widget.newModelTest.data.balances[0].billAmount, widget.newModelTest.data.balances[0].currency)} ${widget.newModelTest.data.balances[0].currency}",
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
                                  "Convinience fee",
                                  style: TextStyle(color: CONST.white),
                                ),
                                Text(
                                  "${ConvertFormat.convertCurrency(widget.newModelTest.data.balances[0].feeAmount, widget.newModelTest.data.balances[0].currency)} ${widget.newModelTest.data.balances[0].currency}",
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
                                  "${ConvertFormat.convertCurrency(widget.newModelTest.data.balances[0].totalAmount, widget.newModelTest.data.balances[0].currency)} ${widget.newModelTest.data.balances[0].currency}",
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
                              
                              var confirmResponseModel = await SubmitPayment.submitPayment();
                                if (confirmResponseModel.code != "SUCCESS") {
                                   await Navigator.pushReplacement(
                                      (context),
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              WebResponsiveNotSuccess.sendData(
                                                confirmResponseModel:
                                                    confirmResponseModel,
                                                newModelTest:
                                                    widget.newModelTest,
                                                    myAccount: widget.myAccount,
                                              )));
                                } else {
                                  await Navigator.pushReplacement(
                                      (context),
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              WebResponsiveSuccess.sendData(
                                                confirmResponseModel:
                                                    confirmResponseModel,
                                                newModelTest:
                                                    widget.newModelTest,
                                                    myAccount: widget.myAccount,
                                              )));
                                }
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
