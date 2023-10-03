import 'dart:io';
import 'package:deeplink_cookbook/core/api/submit_payment.dart';
import 'package:deeplink_cookbook/core/helper/convert_format.dart';
import 'package:deeplink_cookbook/core/models/confirm_request_model.dart';
import 'package:deeplink_cookbook/core/models/confirm_response_model.dart';
import 'package:deeplink_cookbook/core/models/inquiry_response_model.dart';
import 'package:deeplink_cookbook/core/models/models.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileSuccessScreen extends StatelessWidget {
  late String myAccount;
  late String identityCode;
  //late InquiryV4ResponseModel inquiryV5ResponseModel;
  late InquiryV5ResponseModel inquiryV5ResponseModel;
  // late ConfirmV3ResponseModel confirmResponseModel;
  MobileSuccessScreen({super.key});
  MobileSuccessScreen.sendData(
      {required this.myAccount,
      required this.inquiryV5ResponseModel,
      required this.identityCode,
      super.key});

  ScreenshotController screenshotController = ScreenshotController();

  Future<ConfirmV3ResponseModel> confirmV3Asyn() {
    final now = DateTime.now();
    String guid = now.microsecondsSinceEpoch.toString();
    return SubmitPayment.submitV3Payment(ConfirmV3RequestModel(
        identityCode: identityCode,
        feeChannel: inquiryV5ResponseModel.data!.transaction!.feeChannel,
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
    return SafeArea(
      child: Scaffold(
          body: FutureBuilder(
              future: confirmV3Asyn(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.code != "SUCCESS") {
                    return Container(
                      color: CONST.backColor,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset("asset/cancel.png",width: 40,height: 60,),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("CODE : ",style: TextStyle(color: CONST.white),),
                                    Text(snapshot.data!.code,style: TextStyle(color: CONST.white))
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                     Text("MESSAGE : ",style: TextStyle(color: CONST.white)),
                                    Text(snapshot.data!.message,style: TextStyle(color: CONST.white))
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("MESSAGE_KH : ",style: TextStyle(color: CONST.white)),
                                    Text(snapshot.data!.messageKh!,style: TextStyle(color: CONST.white))
                                  ],
                                )
                              ]),
                        ],
                      ),
                    );
                  }
                  return Stack(children: [
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.4,
                      color: CONST.backColor,
                    ),
                    Column(children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                          child: Column(
                        children: [
                          Image.asset(
                            "asset/check.png",
                            width: 60,
                            height: 60,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Success",
                            style: TextStyle(color: CONST.white, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Thank you for your payment",
                            style: TextStyle(color: CONST.white, fontSize: 16),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Card(
                              elevation: 1,
                              shadowColor: CONST.fontColor,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "asset/shop.png",
                                      width: 60,
                                      height: 60,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      inquiryV5ResponseModel
                                          .data!.merchant.name,
                                      style: TextStyle(color: CONST.fontColor),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    RichText(
                                        text: TextSpan(
                                            text:
                                                '- ${ConvertFormat.convertCurrency(inquiryV5ResponseModel.data!.transaction!.totalAmount, inquiryV5ResponseModel.data!.transaction!.currency)}',
                                            style: TextStyle(
                                                color: CONST.fontColor,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                            children: [
                                          TextSpan(
                                              text: inquiryV5ResponseModel
                                                  .data!.transaction!.currency,
                                              style: TextStyle(
                                                  color: CONST.fontColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600))
                                        ])),
                                    // const SizedBox(
                                    //   height: 20,
                                    // ),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     Text("Transaction Date",
                                    //         style: TextStyle(
                                    //             color: CONST.fontColor)),
                                    //     Text(
                                    //         ConvertFormat
                                    //             .convertDateTimeToString(""),
                                    //         style: TextStyle(
                                    //             color: CONST.fontColor))
                                    //   ],
                                    // ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Refference number",
                                            style: TextStyle(
                                                color: CONST.fontColor)),
                                        Text(
                                            snapshot.data!.data!.transaction!
                                                .bankRef,
                                            style: TextStyle(
                                                color: CONST.fontColor))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("From account",
                                            style: TextStyle(
                                                color: CONST.fontColor)),
                                        Text(myAccount,
                                            style: TextStyle(
                                                color: CONST.fontColor))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Original amount",
                                            style: TextStyle(
                                                color: CONST.fontColor)),
                                        Text(
                                            "${ConvertFormat.convertCurrency(snapshot.data!.data!.transaction!.originalAmount, snapshot.data!.data!.transaction!.currency)} ${snapshot.data!.data!.transaction!.currency}",
                                            style: TextStyle(
                                                color: CONST.fontColor))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Convineince fee",
                                            style: TextStyle(
                                                color: CONST.fontColor)),
                                        Text(
                                            "${ConvertFormat.convertCurrency(snapshot.data!.data!.transaction!.convenienceFeeAmount, snapshot.data!.data!.transaction!.currency)} ${snapshot.data!.data!.transaction!.currency}",
                                            style: TextStyle(
                                                color: CONST.fontColor))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Divider(),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Total amount",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: CONST.fontColor)),
                                        Text(
                                            "${ConvertFormat.convertCurrency(snapshot.data!.data!.transaction!.totalAmount, snapshot.data!.data!.transaction!.currency)} ${snapshot.data!.data!.transaction!.currency}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: CONST.fontColor))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Row(
                          //   mainAxisSize: MainAxisSize.min,
                          //   children: [
                          //     IconButton(
                          //       onPressed: () {
                          //         screenshotController
                          //             .captureFromWidget(
                          //                 //Screenshot widget
                          //                 const ScreenShotWidget())
                          //             .then((image) async {
                          //           //save image to gallery
                          //           final file = await _getDirectory();
                          //           await file.writeAsBytes(image);

                          //           //save image to gallery
                          //           final result =
                          //               await ImageGallerySaver.saveFile(
                          //                   file.path);
                          //           if (result['isSuccess']) {
                          //             _flutterToastMessage(
                          //                 (context), 'Image Saved');
                          //           } else {
                          //             _flutterToastMessage(
                          //                 (context), 'Image Unsaved');
                          //           }
                          //         });
                          //       },
                          //       icon: Icon(
                          //         Icons.file_download_outlined,
                          //         color: CONST.backColor.withOpacity(0.8),
                          //       ),
                          //     ),
                          //     IconButton(
                          //       onPressed: () {
                          //         screenshotController
                          //             .captureFromWidget(
                          //                 const ScreenShotWidget())
                          //             .then((image) async {
                          //           final file = await _getDirectory();
                          //           await Share.shareFiles([file.path]);
                          //         });
                          //       },
                          //       icon: Icon(
                          //         Icons.share_outlined,
                          //         color: CONST.backColor.withOpacity(0.8),
                          //       ),
                          //     ),
                          //   ],
                          // )
                        
                        
                        ],
                      )),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10),
                        child: SafeArea(
                            child: GestureDetector(
                                onTap: () {
                                  exit(0);
                                },
                                child: Container(
                                  height: 50,
                                  alignment: Alignment.center,
                                  width: MediaQuery.sizeOf(context).width,
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: CONST.backColor,
                                  ),
                                  child: Text(
                                    "DONE",
                                    style: TextStyle(
                                        color: CONST.white, fontSize: 16),
                                  ),
                                ))),
                      )
                    ]),
                  ]);
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
              }))),
    );
  }

  Future<dynamic> _getDirectory() async {
    final directory = await getTemporaryDirectory();
    String fileName = DateTime.now().microsecondsSinceEpoch.toString();
    final file = File('${directory.path}/$fileName.png');
    return file;
  }

  dynamic _flutterToastMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            message,
            style: TextStyle(color: CONST.fontColor, fontSize: 16),
          )),
      backgroundColor: CONST.white,
      action: SnackBarAction(
          label: 'Open',
          onPressed: () {
            //Open app gallery
            openGallery();
          }),
    ));
  }

  void openGallery() async {
    const galleryUrl = 'content://media/internal/images/media';
    if (await canLaunchUrl(Uri.parse(galleryUrl))) {
      await launchUrl(Uri.parse(galleryUrl));
    } else {
      // Handle the case where the gallery app cannot be opened.
      debugPrint('Unable to open the gallery app.');
    }
  }
}
