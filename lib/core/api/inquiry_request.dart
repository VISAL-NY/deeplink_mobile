import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';
class InquiryRequest{
 static Future<NewModelTest> requestInquiry() async{
      final url= Uri.parse("http://dc.oone.bz:40010/payment/v4/inquiry");
      const authToken="eyJhbGciOiJSUzI1NiIsImtpZCI6IjZCOUY3RDZBMjA2MTQxQzkzQ0I2NEVFNjRGOTBBNUQwQTQzOTZDODBSUzI1NiIsInR5cCI6ImF0K2p3dCIsIng1dCI6ImE1OTlhaUJoUWNrOHRrN21UNUNsMEtRNWJJQSJ9.eyJuYmYiOjE2OTU3MDI1MjksImV4cCI6MTY5NTcyNDEyOSwiaXNzIjoiaHR0cDovL2RjLm9vbmUuYno6NDAwMTEiLCJhdWQiOlsiYmFua19hcGkiLCJodHRwOi8vZGMub29uZS5iejo0MDAxMS9yZXNvdXJjZXMiXSwiY2xpZW50X2lkIjoiYmFua19jbGllbnQiLCJzdWIiOiJkZTljMmRjZS1kOTZkLTQ2NjAtYWZkYS03Y2VmZDUwODAxOTYiLCJhdXRoX3RpbWUiOjE2OTU3MDI1MjksImlkcCI6ImxvY2FsIiwiZW1haWwiOiJiYW5rNkBnbWFpbC5jb20iLCJ1c2VybmFtZSI6IkJhbms2IiwiaWF0IjoxNjk1NzAyNTI5LCJzY29wZSI6WyJiYW5rX2FwaSIsIm9mZmxpbmVfYWNjZXNzIl0sImFtciI6WyJwYXNzd29yZCJdfQ.RAAF4NYEuc6G5O8JJad8FcF0Ol8ynRPjAQc8kQno7WmcG7QasKbqqJE33a9UOJpCxnfE2tGsoxD8IIE8L3jHRNKldjexMVmBDeS1mkIaTJqCkri4So1_FDcyfviVzizNgfhsUbpPGBZX9DMVz68rZm0Tufm1Wrhyhr3oJ9ZTSZaXzfV9sgIAeuVQYdu0OfA4srk1KWIH0NVh2kWtLpOcJCcvJGJS_iJqeqvLOKVSg2Hp7V7Kvw3rYEZXwc3LcATzT11w1kN8XGJyRzlwzKeQ6OeGfGLXMS3ZHD5LpeYWdzB1fs6r6f0pG8pxw0q3PQXIeMshwxTfZDcvBXY6ckx2Zg";
      final header=<String,String>{
        'Content-Type':'application/json',
        'Authorization':'Bearer $authToken'
        
      };
      final body=<String,dynamic>{
        "currency": "KHR",
        "customer_code": "397700001035",
        "bill_code": "397700001035"
      };

      //  final body=<String,dynamic>{
      //   "currency": model.currency,
      //   "customer_code": model.customerCode,
      //   "bill_code": model.billCode
      // };

      try{
        var response=await http.post(url,headers: header,body:jsonEncode(body));

        if(response.statusCode == 200){
          //var mybody=response.body;
          return NewModelTest.fromJson(jsonDecode(response.body));
        }
        else{
          throw Exception();
        }

      }catch(ex)
      {
        debugPrint("------------------->$ex");
        throw Exception();
      }
  }
}