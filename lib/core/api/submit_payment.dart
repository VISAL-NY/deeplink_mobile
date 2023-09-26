import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

import '../models/confirm_response_model.dart';

class SubmitPayment{

  static Future<ConfirmResponseModel> submitPayment() async{
      final url=Uri.parse("http://dc.oone.bz:40010/payment/v2/confirm");
      const authToken="eyJhbGciOiJSUzI1NiIsImtpZCI6IjZCOUY3RDZBMjA2MTQxQzkzQ0I2NEVFNjRGOTBBNUQwQTQzOTZDODBSUzI1NiIsInR5cCI6ImF0K2p3dCIsIng1dCI6ImE1OTlhaUJoUWNrOHRrN21UNUNsMEtRNWJJQSJ9.eyJuYmYiOjE2OTU3MDI1MjksImV4cCI6MTY5NTcyNDEyOSwiaXNzIjoiaHR0cDovL2RjLm9vbmUuYno6NDAwMTEiLCJhdWQiOlsiYmFua19hcGkiLCJodHRwOi8vZGMub29uZS5iejo0MDAxMS9yZXNvdXJjZXMiXSwiY2xpZW50X2lkIjoiYmFua19jbGllbnQiLCJzdWIiOiJkZTljMmRjZS1kOTZkLTQ2NjAtYWZkYS03Y2VmZDUwODAxOTYiLCJhdXRoX3RpbWUiOjE2OTU3MDI1MjksImlkcCI6ImxvY2FsIiwiZW1haWwiOiJiYW5rNkBnbWFpbC5jb20iLCJ1c2VybmFtZSI6IkJhbms2IiwiaWF0IjoxNjk1NzAyNTI5LCJzY29wZSI6WyJiYW5rX2FwaSIsIm9mZmxpbmVfYWNjZXNzIl0sImFtciI6WyJwYXNzd29yZCJdfQ.RAAF4NYEuc6G5O8JJad8FcF0Ol8ynRPjAQc8kQno7WmcG7QasKbqqJE33a9UOJpCxnfE2tGsoxD8IIE8L3jHRNKldjexMVmBDeS1mkIaTJqCkri4So1_FDcyfviVzizNgfhsUbpPGBZX9DMVz68rZm0Tufm1Wrhyhr3oJ9ZTSZaXzfV9sgIAeuVQYdu0OfA4srk1KWIH0NVh2kWtLpOcJCcvJGJS_iJqeqvLOKVSg2Hp7V7Kvw3rYEZXwc3LcATzT11w1kN8XGJyRzlwzKeQ6OeGfGLXMS3ZHD5LpeYWdzB1fs6r6f0pG8pxw0q3PQXIeMshwxTfZDcvBXY6ckx2Zg";
      final header=<String,String>{
        'Content-Type':'application/json',
        'Authorization':'Bearer $authToken'
      };
      final guid=const Uuid().v1();

      final body=<String,dynamic>{    
        "bill_code": "397700001027",
        "customer_code": "397700001027",
        "bill_amount": 40000,
        "total_amount": 40800,
        "currency": "KHR",
        "payment_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiODM1ZGQ3YTktYzY4NS00Y2FmLWFiNTktM2Y2YjUzYmIwMWE5IiwiY3N4IjoiS0hSIiwiaWRzIjoiTjUxY3lvUDkiLCJhbXQiOiI0MDAwMC4wMCIsImRtdCI6IjQwODAwLjAwIiwiZmVlIjoiODAwLjAwIiwibWluIjoiLTEiLCJtYXgiOiItMSIsInNpZCI6ImM4WDJ6T1JvIiwiYmNvIjoiIiwiY2lkIjoiTmdTZ3VFMkMiLCJjY28iOiIzOTc3MDAwMDA0IiwidHlwIjoicGF5X2JpbGwiLCJwY24iOiJDaGFuIFBpc2V5IiwicGNjIjoiMzk3NzAwMDAwNCIsInBjcCI6IjA5NiA3ODkgODQwIiwiZGVzIjoiIiwiZXhwIjoxNjk0NTk4MDI3fQ.p3awzE9gtCYfABoEgKB0htu-boSnnkqBD2tkqdyDaNY",
        "payment_by": "",
        "payment_account": "",
        "payment_type": "",
        "ref_no": guid,
        "note": "",
        "payment_account_name": "",
        "payment_account_phone_number": "",
        "payment_fee": 0,
        "payment_channel": "",
        "payment_fee_charge_by": ""
      };

      // final body=<String,dynamic>{    
      //   "bill_code": model.billCode,
      //   "customer_code": model.customerCode,
      //   "bill_amount": model.billAmount,
      //   "total_amount": model.totalAmount,
      //   "currency": model.currency,
      //   "payment_token": model.paymentToken,
      //   "payment_by": model.paymentBy,
      //   "payment_account": model.paymentAccount,
      //   "payment_type": model.paymentType,
      //   "ref_no": guid,
      //   "note": model.note,
      //   "payment_account_name": model.paymentAccountName,
      //   "payment_account_phone_number": model.paymentAccountPhoneNumber,
      //   "payment_fee": model.paymentFee,
      //   "payment_channel": model.paymentChannel,
      //   "payment_fee_charge_by": model.paymentFeeChargeBy
      // };

      try{

        var response=await http.post(url,headers: header,body: jsonEncode(body));

        if(response.statusCode==200){
          //var restul=response.body;
          return ConfirmResponseModel.fromJson(jsonDecode(response.body));
        }
        else{
          throw Exception();
        }

        // var confirmResponseModel=ConfirmResponseModel.fromJson(jsonDecode(result));

        // debugPrint("====================>$confirmResponseModel");

        // return confirmResponseModel;
        
      }catch(ex){
        debugPrint("------------->${ex.toString()}");
        throw Exception();
      }
  }
}