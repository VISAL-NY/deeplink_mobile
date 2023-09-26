
import 'package:deeplink_cookbook/core/models/models.dart';
import 'package:flutter/material.dart';

class ScreenShotWidget extends StatelessWidget {
  const ScreenShotWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          color: CONST.backColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            Column(
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
                        "Shop Name",
                        style: TextStyle(color: CONST.fontColor),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RichText(
                          text: TextSpan(
                              text: '20,800',
                              style: TextStyle(
                                  color: CONST.fontColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              children: [
                            TextSpan(
                                text: '  KHR',
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
                          Text("Sep,23,2023 12:00 PM",
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
                          Text("9038938739",
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
                          Text("0394 898 993",
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
                          Text("20000 KHR",
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
                          Text("800 KHR",
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
                          Text("20800 KHR",
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
              ],
            ),
          ]),
        ),
      ]);
    
  }
}