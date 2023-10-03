import 'dart:convert';
import 'package:deeplink_cookbook/core/models/inquiry_response_model.dart';
import 'package:deeplink_cookbook/core/models/inquriy_request_model.dart';
import 'package:deeplink_cookbook/core/models/models.dart';
import 'package:http/http.dart' as http;

class InquiryRequest{

 static Future<InquiryV4ResponseModel> requestInquiryV4() async{
      final url= Uri.parse("http://dc.oone.bz:40010/payment/v4/inquiry");
      const authToken="eyJhbGciOiJSUzI1NiIsImtpZCI6IjZCOUY3RDZBMjA2MTQxQzkzQ0I2NEVFNjRGOTBBNUQwQTQzOTZDODBSUzI1NiIsInR5cCI6ImF0K2p3dCIsIng1dCI6ImE1OTlhaUJoUWNrOHRrN21UNUNsMEtRNWJJQSJ9.eyJuYmYiOjE2OTU4MDM0NDEsImV4cCI6MTY5NTgyNTA0MSwiaXNzIjoiaHR0cDovL2RjLm9vbmUuYno6NDAwMTEiLCJhdWQiOlsiYmFua19hcGkiLCJodHRwOi8vZGMub29uZS5iejo0MDAxMS9yZXNvdXJjZXMiXSwiY2xpZW50X2lkIjoiYmFua19jbGllbnQiLCJzdWIiOiJkZTljMmRjZS1kOTZkLTQ2NjAtYWZkYS03Y2VmZDUwODAxOTYiLCJhdXRoX3RpbWUiOjE2OTU4MDM0NDEsImlkcCI6ImxvY2FsIiwiZW1haWwiOiJiYW5rNkBnbWFpbC5jb20iLCJ1c2VybmFtZSI6IkJhbms2IiwiaWF0IjoxNjk1ODAzNDQxLCJzY29wZSI6WyJiYW5rX2FwaSIsIm9mZmxpbmVfYWNjZXNzIl0sImFtciI6WyJwYXNzd29yZCJdfQ.NtGn9KOLBDxikziVg3mvXDND48ZJOhIl1Sd7ripSkW5EEuuadLzMRo2c1ZOJ7nMhYxXtbfgT-qJC6HGmaRylgsrupSjvjxhzOOIrKGNkllKIfa6RW1VG0MyqZTOxwaiXAwET7lM6wjBptec4KLDRKE6kIZGPC9bD6UUhNVa4uRPfxBNV8WKPQ2r0Of-2XNzMG1g6lKQdKBeUgQ-w3sscVZ0QBTPe6hkKLSgi2PDT8nvDFVWhvQJRDNNqm5YRVEfIftTZjU4WO3qkTd3q7E1wWbAzcEUjhJdE1wsjBS1Kk4Gvhw0ZTJjAdSL6ipkDVLoFqB799LOD03xtsReFKVYN1Q";
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
          return InquiryV4ResponseModel.fromJson(jsonDecode(response.body));
        }
        else{
          throw Exception();
        }

      }catch(ex)
      {
        throw Exception();
      }
  }

static Future<InquiryV5ResponseModel> requestInquiryV5(InquiryV5RequestModel model) async{
      final url= Uri.parse(URLBankAPI.baseUrl+URLBankAPI.inquiryV5Url);
      
      final header=<String,String>{
        'Content-Type':'application/json'
      };
      final body=<String,dynamic>{
        "identity_code": model.identityCode,
        "fee_channel": model.feeChannel
      };

      try{
        var response=await http.post(url,headers: header,body:jsonEncode(body));
        if(response.statusCode == 200 || response.statusCode==201){
          var result = InquiryV5ResponseModel.fromJson(jsonDecode(response.body));
          return result;
        }
        else{
          throw Exception();
        }
      }catch(ex)
      {
        throw Exception();
      }
  }
}