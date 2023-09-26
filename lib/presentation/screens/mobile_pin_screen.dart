import 'package:deeplink_cookbook/core/api/submit_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:vibration/vibration.dart';

import '../../core/helper/convert_format.dart';
import '../../core/models/confirm_response_model.dart';
import '../../core/models/models.dart';


class MobilePinScreen extends StatefulWidget {
  late String myAccount;
  late NewModelTest newModelTest;
  MobilePinScreen({super.key});
  MobilePinScreen.sendData(
      {required this.myAccount, required this.newModelTest, super.key});
  @override
  State<MobilePinScreen> createState() => _MobilePinScreenState();
}

class _MobilePinScreenState extends State<MobilePinScreen> {
  Future<ConfirmResponseModel> confirmAsyn() {
    return SubmitPayment.submitPayment();
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
          onUnlocked: () async {
            var confirmResponseModel = await confirmAsyn();
            if (confirmResponseModel.code != "SUCCESS") {
              _showErrorConfirmDialog(confirmResponseModel);
            } else {
              // Navigator.pushReplacement(
              //     (context),
              //     MaterialPageRoute(
              //         builder: (context) => MobileSuccessScreen.sendData(
              //               myAccount: widget.myAccount,
              //               newModelTest: widget.newModelTest,
              //               confirmResponseModel: confirmResponseModel,
              //             )));
            }
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
