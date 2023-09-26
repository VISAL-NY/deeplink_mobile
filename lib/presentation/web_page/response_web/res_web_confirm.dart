
import 'package:deeplink_cookbook/core/helper/convert_format.dart';
import 'package:deeplink_cookbook/core/models/models.dart';
import 'package:deeplink_cookbook/presentation/web_page/main_responsive/web_responsive_with_otp.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResWebConfirm extends StatefulWidget {
  late NewModelTest newModelTest;
  late String myAccount;
  ResWebConfirm({required this.newModelTest,required this.myAccount});

  @override
  State<ResWebConfirm> createState() => _ResWebConfirmState();
}

class _ResWebConfirmState extends State<ResWebConfirm> {
  final _controller = TextEditingController(text: BankAccountNumber.firstAccount);


  bool _isFirstBankAccountSelected = true;
  bool _isSecondBankAccountSelected = false;
  bool _isThirdBankAccountSelected = false;

  _showBankAccountDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: Container(
                decoration:
                    BoxDecoration(
                      color: CONST.white,
                      borderRadius: BorderRadius.circular(5)),
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
                          style:
                              TextStyle(color: CONST.fontColor, fontSize: 16),
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
                        });
                        Navigator.pop(context);
                      },
                    ),
                    GestureDetector(
                      child: ListTile(
                        leading: Text(
                          BankAccountNumber.secondAccount,
                          style:
                              TextStyle(color: CONST.fontColor, fontSize: 16),
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
                        });
                        Navigator.pop(context);
                      },
                    ),
                    GestureDetector(
                      child: ListTile(
                        leading: Text(
                          BankAccountNumber.thirdAccount,
                          style:
                              TextStyle(color: CONST.fontColor, fontSize: 16),
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
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ));
        });
  }

  @override
  void initState() {
    super.initState();
    widget.myAccount=_controller.text;
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
                                    text:
                                        '  ${widget.newModelTest.data.balances[0].currency}',
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
                          "Bank Account",
                          style: TextStyle(fontSize: 22),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          child: TextFormField(
                            readOnly: true,
                            controller: _controller,
                            decoration:  InputDecoration(
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                onPressed: (){
                                  _showBankAccountDialog();
                                }, 
                                icon: Icon(Icons.arrow_drop_down_circle,color: CONST.fontColor,))
                            ),
                            
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            // context.goNamed('confirm',);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        WebResponsiveWithOTP.sendData(
                                          newModelTest: widget.newModelTest,
                                          myAccount: widget.myAccount,
                                        )));
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
