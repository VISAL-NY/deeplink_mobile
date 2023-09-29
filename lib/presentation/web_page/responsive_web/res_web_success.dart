import 'dart:typed_data';
//import 'dart:html' as html;

import 'package:deeplink_cookbook/core/helper/convert_format.dart';
import 'package:deeplink_cookbook/core/models/confirm_response_model.dart';
import 'package:deeplink_cookbook/core/models/inquiry_response_model.dart';
import 'package:deeplink_cookbook/core/models/models.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

class ResWebSuccess extends StatelessWidget {

  ScreenshotController screenshotController=ScreenshotController();
  ConfirmV2ResponseModel confirmResponseModel;
  //InquiryV4ResponseModel inquiryV5ResponseModel;
  InquiryV5ResponseModel inquiryV5ResponseModel;
  String myAccount;

  ResWebSuccess({required this.confirmResponseModel,required this.inquiryV5ResponseModel,required this.myAccount,super.key});

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
                          inquiryV5ResponseModel.data.merchant.name,
                          style:const TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                    const SizedBox(height: 40,),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        RichText(
                            text: TextSpan(
                                text: '- ${ConvertFormat.convertCurrency(inquiryV5ResponseModel.data.transaction.totalAmount, inquiryV5ResponseModel.data.transaction.currency)}',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: CONST.fontColor,
                                    fontWeight: FontWeight.bold),
                                children: [
                              TextSpan(
                                  text: inquiryV5ResponseModel.data.transaction.currency,
                                  style: TextStyle(
                                      fontSize: 18, color: CONST.fontColor))
                            ]))
                      ],
                    ),
                    const SizedBox(height: 40,),
                    Container(
                        width: MediaQuery.sizeOf(context).width * 0.7,
                        decoration: BoxDecoration(
                            color: CONST.backColor,
                            borderRadius: BorderRadius.circular(5)),
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
                                  "${ConvertFormat.convertCurrency(inquiryV5ResponseModel.data.transaction.originalAmount, inquiryV5ResponseModel.data.transaction.currency)} ${inquiryV5ResponseModel.data.transaction.currency}",
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
                                   "${ConvertFormat.convertCurrency(inquiryV5ResponseModel.data.transaction.convenienceFeeAmount, inquiryV5ResponseModel.data.transaction.currency)} ${inquiryV5ResponseModel.data.transaction.currency}",
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
                                    "${ConvertFormat.convertCurrency(inquiryV5ResponseModel.data.transaction.totalAmount, inquiryV5ResponseModel.data.transaction.currency)} ${inquiryV5ResponseModel.data.transaction.currency}",
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
                        Image.asset(
                          "asset/check.png",
                          height: 80,
                          width: 80,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Success",
                          style: TextStyle(fontSize: 28, color: CONST.fontColor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Thank you for your payment",
                          style: TextStyle(color: CONST.fontColor),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          height: 20,
                          child: const Divider(),
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Transaction Date",
                                style: TextStyle(color: CONST.fontColor),
                              ),
                              Text(
                                ConvertFormat.convertDateTimeToString(confirmResponseModel.data.paidDate),
                                style: TextStyle(color: CONST.fontColor),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          height: 20,
                          child: const Divider(),
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Reference number",
                                style: TextStyle(color: CONST.fontColor),
                              ),
                              Text(
                                confirmResponseModel.data.refNo,
                                style: TextStyle(color: CONST.fontColor),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          height: 20,
                          child: const Divider(),
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "From account",
                                style: TextStyle(color: CONST.fontColor),
                              ),
                              Text(
                                myAccount,
                                style: TextStyle(color: CONST.fontColor),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          height: 20,
                          child: const Divider(),
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Original amount",
                                style: TextStyle(color: CONST.fontColor),
                              ),
                              Text(
                                   "${ConvertFormat.convertCurrency(confirmResponseModel.data.billAmount, confirmResponseModel.data.currency)} ${confirmResponseModel.data.currency}",
                                style: TextStyle(color: CONST.fontColor),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          height: 20,
                          child: const Divider(),
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Convenience fee",
                                style: TextStyle(color: CONST.fontColor),
                              ),
                              Text(
                                  "${ConvertFormat.convertCurrency(confirmResponseModel.data.feeAmount, confirmResponseModel.data.currency)} ${confirmResponseModel.data.currency}",
                                style: TextStyle(color: CONST.fontColor),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          height: 20,
                          child: const Divider(),
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Total amount",
                                style: TextStyle(color: CONST.fontColor),
                              ),
                              Text(
                                  "${ConvertFormat.convertCurrency(confirmResponseModel.data.totalAmount, confirmResponseModel.data.currency)} ${confirmResponseModel.data.currency}",
                                style: TextStyle(color: CONST.fontColor),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 7,
                          height: 20,
                          child: const Divider(),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      //    Row(
                      //     mainAxisSize: MainAxisSize.min,
                      //   children: [
                      //     IconButton(
                      //       onPressed: (){
                      //           screenshotController.captureFromWidget(
                      //             const ScreenShotWidget()
                      //           ).then((image){
                      //               saveBytesAsImageFile(image, 'image.png');
                      //           });
                      //       },
                      //      icon: Icon(Icons.file_download_outlined,color: CONST.backColor.withOpacity(0.8),)
                      //      ),
                      //     //  const SizedBox(width: 20,),
                      //     //  IconButton(
                      //     //   onPressed: (){
      
                      //     //   },
                      //     //  icon: Icon(Icons.share_outlined,color: CONST.backColor.withOpacity(0.8),)
                      //     //  ),
                      //   ],
                      // ),
                      const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.sizeOf(context).width * 0.7,
                            height: 50,
                            decoration: BoxDecoration(color: CONST.backColor),
                            child: Text(
                              "Done",
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
  void saveBytesAsImageFile(Uint8List image, String fileName) {
    // final blob = html.Blob([image]);
    // final url = html.Url.createObjectUrlFromBlob(blob);
    // html.AnchorElement(href: url)
    //   ..target = 'blob'
    //   ..download = fileName
    //   ..click();
    // html.Url.revokeObjectUrl(url);
  }
}
