
import 'package:deeplink_cookbook/presentation/screens/mobile_pin_screen.dart';
import 'package:flutter/material.dart';

import '../../core/api/inquiry_request.dart';
import '../../core/helper/convert_format.dart';
import '../../core/models/models.dart';

class MobileConfirmScreen extends StatefulWidget {
  

  const MobileConfirmScreen({super.key});

  @override
  State<MobileConfirmScreen> createState() => _MobileConfirmScreenState();
}

class _MobileConfirmScreenState extends State<MobileConfirmScreen> {
   String myAccount = "";
  final _controller =
      TextEditingController(text: BankAccountNumber.firstAccount);

  bool _isFirstBankAccountSelected = true;
  bool _isSecondBankAccountSelected = false;
  bool _isThirdBankAccountSelected = false;

  _showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.center,
                  color: CONST.backColor,
                  height: 40,
                  child: Text(
                    "Please Select account",
                    style: TextStyle(color: CONST.white, fontSize: 18),
                  ),
                ),
                GestureDetector(
                  child: ListTile(
                    leading: Text(
                      BankAccountNumber.firstAccount,
                      style: TextStyle(color: CONST.fontColor, fontSize: 16),
                    ),
                    trailing: Icon(
                      Icons.radio_button_checked,
                      color: _isFirstBankAccountSelected
                          ? CONST.backColor
                          : Colors.grey,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      //////////////////////////////
                      _controller.text = BankAccountNumber.firstAccount;
                      _isFirstBankAccountSelected = true;
                      _isSecondBankAccountSelected = false;
                      _isThirdBankAccountSelected = false;
                      myAccount = _controller.text;
                    });
                    Navigator.pop(context);
                  },
                ),
                GestureDetector(
                  child: ListTile(
                    leading: Text(
                      BankAccountNumber.secondAccount,
                      style: TextStyle(color: CONST.fontColor, fontSize: 16),
                    ),
                    trailing: Icon(
                      Icons.radio_button_checked,
                      color: _isSecondBankAccountSelected
                          ? CONST.backColor
                          : Colors.grey,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      //////////////////////
                      _controller.text = BankAccountNumber.secondAccount;
                      _isSecondBankAccountSelected = true;
                      _isFirstBankAccountSelected = false;
                      _isThirdBankAccountSelected = false;
                      myAccount = _controller.text;
                    });
                    Navigator.pop(context);
                  },
                ),
                GestureDetector(
                  child: ListTile(
                    leading: Text(
                      BankAccountNumber.thirdAccount,
                      style: TextStyle(color: CONST.fontColor, fontSize: 16),
                    ),
                    trailing: Icon(
                      Icons.radio_button_checked,
                      color: _isThirdBankAccountSelected
                          ? CONST.backColor
                          : Colors.grey,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      //////////////////////////
                      _controller.text = BankAccountNumber.thirdAccount;
                      _isThirdBankAccountSelected = true;
                      _isFirstBankAccountSelected = false;
                      _isThirdBankAccountSelected = false;
                      myAccount = _controller.text;
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }

  Future<NewModelTest> inquiryModel()  {
    return  InquiryRequest.requestInquiry();
  }

  @override
  void initState() {
    super.initState();
    myAccount = _controller.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: CONST.backColor,
          elevation: 0,
          title:  Text(
            CONST.bankName,
            style:const TextStyle(fontSize: 18),
          )),
      body: FutureBuilder(
        future: InquiryRequest.requestInquiry(),
        builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(top: 10, bottom: 50),
                        decoration: BoxDecoration(
                          color: CONST.backColor,
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Image(
                                height: 60,
                                width: 60,
                                image: AssetImage("asset/shop.png")),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              snapshot.data!.data.supplier.name,
                              style:
                                  TextStyle(fontSize: 16, color: CONST.white),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Select account",
                              style: TextStyle(
                                  color: CONST.fontColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 50,
                            child: TextFormField(
                              readOnly: true,
                              textAlign: TextAlign.end,
                              controller: _controller,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: CONST.backColor)),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        _showBottomSheet(context);
                                      },
                                      icon: const Icon(Icons.arrow_drop_down_circle))),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Original Amount ",
                                style: TextStyle(
                                    color: CONST.fontColor,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                  "${ConvertFormat.convertCurrency(snapshot.data!.data.balances[0].billAmount, snapshot.data!.data.balances[0].currency)}  ${snapshot.data!.data.balances[0].currency}",
                                  style: TextStyle(color: CONST.fontColor))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Convinien Fee",
                                  style: TextStyle(
                                      color: CONST.fontColor,
                                      fontWeight: FontWeight.w500)),
                              Text(
                                  "${ConvertFormat.convertCurrency(snapshot.data!.data.balances[0].feeAmount, snapshot.data!.data.balances[0].currency)}  ${snapshot.data!.data.balances[0].currency}",
                                  style: TextStyle(color: CONST.fontColor))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total Amount",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: CONST.fontColor,
                                      fontWeight: FontWeight.w500)),
                              Text(
                                  "${ConvertFormat.convertCurrency(snapshot.data!.data.balances[0].totalAmount, snapshot.data!.data.balances[0].currency)}  ${snapshot.data!.data.balances[0].currency}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: CONST.fontColor,
                                      fontWeight: FontWeight.bold))
                            ],
                          )
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: SafeArea(
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MobilePinScreen.sendData(
                                        myAccount: myAccount,
                                        newModelTest: snapshot.data!,
                                      )));
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
                            "CONFIRM",
                            style: TextStyle(color: CONST.white, fontSize: 16),
                          ),
                        ))),
              )
            ],
          );
        }
        else {
          return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
