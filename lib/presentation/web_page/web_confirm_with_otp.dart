import 'package:deeplink_cookbook/core/helper/convert_format.dart';
import 'package:deeplink_cookbook/core/models/inquiry_response_model.dart';
import 'package:deeplink_cookbook/core/models/models.dart';
import 'package:deeplink_cookbook/presentation/web_page/main_responsive/web_main_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class WebConfrimWithOTP extends StatefulWidget {
  //InquiryV4ResponseModel inquiryV5ResponseModel;
  InquiryV5ResponseModel inquiryV5ResponseModel;
  String myAccount;
  String identityCode;
  WebConfrimWithOTP(
      {required this.inquiryV5ResponseModel,
      required this.myAccount,
      required this.identityCode,
      super.key});

  @override
  State<WebConfrimWithOTP> createState() => _WebConfrimWithOTPState();
}

class _WebConfrimWithOTPState extends State<WebConfrimWithOTP> {
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

  _buildLeftSideWidget(BuildContext context) {
    return Column(
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
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Amount to pay ",
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
                        widget
                            .inquiryV5ResponseModel.data!.transaction!.currency),
                    style: TextStyle(
                        fontSize: 30,
                        color: CONST.fontColor,
                        fontWeight: FontWeight.bold),
                    children: [
                  TextSpan(
                      text:
                          ' ${widget.inquiryV5ResponseModel.data!.transaction!.currency}',
                      style: TextStyle(fontSize: 18, color: CONST.fontColor))
                ]))
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
            width: MediaQuery.sizeOf(context).width * 0.3,
            decoration: BoxDecoration(
                color: CONST.backColor, borderRadius: BorderRadius.circular(5)),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                      style: TextStyle(
                        color: CONST.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${ConvertFormat.convertCurrency(widget.inquiryV5ResponseModel.data!.transaction!.totalAmount, widget.inquiryV5ResponseModel.data!.transaction!.currency)} ${widget.inquiryV5ResponseModel.data!.transaction!.currency}",
                      style: TextStyle(
                        color: CONST.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            )),
      ],
    );
  }

  _buildRightSideWidget(BuildContext context) {
    return Column(
      children: [
        const Text(
          "OTP Verification ",
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
            text: const TextSpan(text: "DON'T see OTP?", children: [
          TextSpan(
              text: '   Resend', style: TextStyle(color: Colors.blueAccent))
        ])),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: SizedBox(
                  width: 60,
                  height: 60,
                  child: TextFormField(
                    onChanged: (value) {
                      _secondFocusNode.requestFocus();
                    },
                    autofocus: true,
                    controller: _firstOTP,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(1)
                    ],
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: SizedBox(
                  width: 60,
                  height: 60,
                  child: TextFormField(
                    onChanged: (value) => _thirdFocusNode.requestFocus(),
                    controller: _secondOTP,
                    focusNode: _secondFocusNode,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(1)
                    ],
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: SizedBox(
                  width: 60,
                  height: 60,
                  child: TextFormField(
                    onChanged: (value) => _fourFocusNode.requestFocus(),
                    focusNode: _thirdFocusNode,
                    controller: _thirdOTP,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(1)
                    ],
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
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
                            borderRadius: BorderRadius.circular(5))),
                  )),
            ),
          ],
        ),
        _isCorrectOTP
            ? Container()
            : Container(
                padding: const EdgeInsets.only(bottom: 10, top: 10),
                child: const Text(
                  'Wrong OTP',
                  style: TextStyle(color: Colors.red),
                )),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () async {
            if (_firstOTP.text == '1' &&
                _secondOTP.text == '2' &&
                _thirdOTP.text == '3' &&
                _fourOTP.text == '4') {
              setState(() {
                _isCorrectOTP = true;
                //context.goNamed('success');
              });


              Navigator.pushReplacement((context),MaterialPageRoute(builder: (context)=>
               WebMainSuccess.sendData(
                identityCode: widget.identityCode,
                 inquiryV5ResponseModel: widget.inquiryV5ResponseModel, 
                 myAccount: widget.myAccount)
              ));

              // final now = DateTime.now();
              // String guid=now.microsecondsSinceEpoch.toString();

              // var confirmResponseModel = await SubmitPayment.submitPayment(
              //     ConfirmRequestModel(
              //         billCode: widget.identityCode,
              //         customerCode: widget.identityCode,
              //         billAmount: widget.inquiryV5ResponseModel.data!.transaction!
              //             .originalAmount,
              //         totalAmount: widget
              //             .inquiryV5ResponseModel.data!.transaction!.totalAmount,
              //         currency: widget
              //             .inquiryV5ResponseModel.data!.transaction!.currency,
              //         paymentToken: widget
              //             .inquiryV5ResponseModel.data!.transaction!.paymentToken,
              //         paymentBy: widget.myAccount,
              //         paymentAccount: widget.myAccount,
              //         paymentType: "Online",
              //         refNo: guid,
              //         note: "payment from deeplink",
              //         paymentAccountName: widget.myAccount,
              //         paymentAccountPhoneNumber: widget.myAccount,
              //         paymentFee: widget.inquiryV5ResponseModel.data!.transaction!
              //             .convenienceFeeAmount,
              //         paymentChannel: widget
              //             .inquiryV5ResponseModel.data!.transaction!.feeChannel,
              //         paymentFeeChargeBy: ""));

              // FutureBuilder(
              //   future: confirmAsync(),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       if (snapshot.data!.code != "SUCCESS") {
              //         Navigator.pushReplacement(
              //             (context),
              //             MaterialPageRoute(
              //                 builder: (context) => WebMainNotSuccess.sendData(
              //                       confirmResponseModel: snapshot.data!,
              //                       inquiryV5ResponseModel:
              //                           widget.inquiryV5ResponseModel,
              //                       myAccount: widget.myAccount,
              //                     )));
              //       } else {
              //         Navigator.pushReplacement(
              //             (context),
              //             MaterialPageRoute(
              //                 builder: (context) => WebMainSuccess.sendData(
              //                       confirmResponseModel: snapshot.data!,
              //                       inquiryV5ResponseModel:
              //                           widget.inquiryV5ResponseModel,
              //                       myAccount: widget.myAccount,
              //                     )));
              //       }
              //     } else if (snapshot.hasError) {
              //       return const Center(
              //         child: Text("ERROR SUBMIT PAYMENT"),
              //       );
              //     }
              //     return const Center(
              //       child: CircularProgressIndicator(),
              //     );
              //   },
              // );

              // if (confirmResponseModel.code != "SUCCESS") {
              //   await Navigator.pushReplacement(
              //       (context),
              //       MaterialPageRoute(
              //           builder: (context) => WebMainNotSuccess.sendData(
              //                 confirmResponseModel: confirmResponseModel,
              //                 inquiryV5ResponseModel:
              //                     widget.inquiryV5ResponseModel,
              //                 myAccount: widget.myAccount,
              //               )));
              // } else {
              //   await Navigator.pushReplacement(
              //       (context),
              //       MaterialPageRoute(
              //           builder: (context) => WebMainSuccess.sendData(
              //                 confirmResponseModel: confirmResponseModel,
              //                 inquiryV5ResponseModel:
              //                     widget.inquiryV5ResponseModel,
              //                 myAccount: widget.myAccount,
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
            width: MediaQuery.sizeOf(context).width * 0.3,
            height: 50,
            decoration: BoxDecoration(color: CONST.backColor),
            child: Text(
              "Continue",
              style: TextStyle(color: CONST.white),
            ),
          ),
        )
      ],
    );
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
      body: Stack(
        children: [
          Container(
            color: CONST.backColor,
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 10,
                bottom: 40,
                left: MediaQuery.of(context).size.height * 0.15,
                right: MediaQuery.of(context).size.height * 0.15),
            child: Container(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              decoration: BoxDecoration(
                  color: CONST.white, borderRadius: BorderRadius.circular(5)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //LeftSide Widget
                  _buildLeftSideWidget(context),

                  const VerticalDivider(
                    thickness: 1,
                  ),

                  //RightSide Widget
                  _buildRightSideWidget(context)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
