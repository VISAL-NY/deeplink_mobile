

import 'dart:io';

import 'package:deeplink_cookbook/core/helper/convert_format.dart';
import 'package:deeplink_cookbook/core/models/confirm_response_model.dart';
import 'package:deeplink_cookbook/core/models/models.dart';
import 'package:deeplink_cookbook/presentation/screenshot_widget/screenshot.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';



class MobileSuccessScreen extends StatelessWidget {

  late String myAccount;
  late NewModelTest newModelTest;
  late ConfirmResponseModel confirmResponseModel;
  MobileSuccessScreen({super.key});
  MobileSuccessScreen.sendData({required this.myAccount,required this.newModelTest,required this.confirmResponseModel,super.key});

  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(children: [
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
                          newModelTest.data.supplier.name,
                          style: TextStyle(color: CONST.fontColor),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        RichText(
                            text: TextSpan(
                                text: '- ${ConvertFormat.convertCurrency(newModelTest.data.balances[0].totalAmount, newModelTest.data.balances[0].currency)}',
                                style: TextStyle(
                                    color: CONST.fontColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                children: [
                              TextSpan(
                                  text: newModelTest.data.balances[0].currency,
                                  style: TextStyle(
                                      color: CONST.fontColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600))
                            ])),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Transaction Date",
                                style: TextStyle(color: CONST.fontColor)),
                            Text(
                              ConvertFormat.convertDateTimeToString(confirmResponseModel.data.paidDate),
                                style: TextStyle(color: CONST.fontColor))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Refference number",
                                style: TextStyle(color: CONST.fontColor)),
                            Text(
                             confirmResponseModel.data.refNo,
                                style: TextStyle(color: CONST.fontColor))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("From account",
                                style: TextStyle(color: CONST.fontColor)),
                            Text(myAccount,
                                style: TextStyle(color: CONST.fontColor))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Original amount",
                                style: TextStyle(color: CONST.fontColor)),
                            Text(
                              "${ConvertFormat.convertCurrency(confirmResponseModel.data.billAmount, confirmResponseModel.data.currency)} ${confirmResponseModel.data.currency}",
                                style: TextStyle(color: CONST.fontColor))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Convineince fee",
                                style: TextStyle(color: CONST.fontColor)),
                            Text(
                                "${ConvertFormat.convertCurrency(confirmResponseModel.data.feeAmount, confirmResponseModel.data.currency)} ${confirmResponseModel.data.currency}",
                                style: TextStyle(color: CONST.fontColor))
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total amount",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: CONST.fontColor)),
                            Text(
                                "${ConvertFormat.convertCurrency(confirmResponseModel.data.totalAmount, confirmResponseModel.data.currency)} ${confirmResponseModel.data.currency}",
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
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      screenshotController
                          .captureFromWidget(
                            //Screenshot widget
                            const ScreenShotWidget()
        
                          ).then((image) async{
                        //save image to gallery
                       final file=await _getDirectory();
                        await file.writeAsBytes(image);

                        //save image to gallery
                      final result=await ImageGallerySaver.saveFile(file.path);
                       if(result['isSuccess']){
                        _flutterToastMessage((context), 'Image Saved');
                       }
                       else{
                        _flutterToastMessage((context), 'Image Unsaved');
                       }

                      });
                    },
                    icon:  Icon(Icons.file_download_outlined,color:CONST.backColor.withOpacity(0.8),),
                  ),
                  IconButton(
                    onPressed: () {
                        screenshotController.captureFromWidget(
                          const ScreenShotWidget()
                        ).then((image) async{
                         final file=await _getDirectory(); 
                         await Share.shareFiles([file.path]);
                        }); 
                       
                        
                    },
                    icon:  Icon(Icons.share_outlined,color: CONST.backColor.withOpacity(0.8),),
                  ),
                ],
              )
            ],
          )),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: SafeArea(
                child: GestureDetector(
                    onTap: () {
                      exit(0);
                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      width: MediaQuery.sizeOf(context).width,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: CONST.backColor,
                      ),
                      child: Text(
                        "DONE",
                        style: TextStyle(color: CONST.white, fontSize: 16),
                      ),
                    ))),
          )
        ]),
      ])),
    );
  }

 Future<dynamic> _getDirectory() async {
    final directory = await getTemporaryDirectory();
    String fileName=DateTime.now().microsecondsSinceEpoch.toString();
    final file = File('${directory.path}/$fileName.png');
    return file;   

}

 dynamic _flutterToastMessage(BuildContext context,String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Align(
          alignment: Alignment.centerLeft,
          child: Text(message,style: TextStyle(color: CONST.fontColor,fontSize: 16),)),
        backgroundColor: CONST.white,
        action: SnackBarAction(
          label: 'Open', 
          onPressed: (){
            //Open app gallery
            openGallery();
          }),
        
        )
    );
  }

  void openGallery() async{
    const  galleryUrl = 'content://media/internal/images/media';
    if (await canLaunchUrl(Uri.parse(galleryUrl))) {
    await launchUrl(Uri.parse(galleryUrl));
  } else {
    // Handle the case where the gallery app cannot be opened.
    debugPrint('Unable to open the gallery app.');
  }
  }
}
