import 'dart:convert';
import 'package:deeplink_cookbook/core/models/confirm_request_model.dart';
import 'package:deeplink_cookbook/core/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/confirm_response_model.dart';

class SubmitPayment {
  static Future<ConfirmV2ResponseModel> submitV2Payment(
      ConfirmV2RequestModel model) async {
    final url = Uri.parse(URLBankAPI.baseUrl + URLBankAPI.submitV2Url);

    final header = <String, String>{
      'Content-Type': 'application/json',
    };

    final body = <String, dynamic>{
      "bill_code": model.billCode,
      "customer_code": model.customerCode,
      "bill_amount": model.billAmount,
      "total_amount": model.totalAmount,
      "currency": model.currency,
      "payment_token": model.paymentToken,
      "payment_by": model.paymentBy,
      "payment_account": model.paymentAccount,
      "payment_type": model.paymentType,
      "ref_no": model.refNo,
      "note": model.note,
      "payment_account_name": model.paymentAccountName,
      "payment_account_phone_number": model.paymentAccountPhoneNumber,
      "payment_fee": model.paymentFee,
      "payment_channel": model.paymentChannel,
      "payment_fee_charge_by": model.paymentFeeChargeBy
    };

    try {
      var response =
          await http.post(url, headers: header, body: jsonEncode(body));

      if (response.statusCode == 200) {
        return ConfirmV2ResponseModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception();
      }
    } catch (ex) {
      throw Exception();
    }
  }

  static Future<ConfirmV3ResponseModel> submitV3Payment(
      ConfirmV3RequestModel model) async {
    final url = Uri.parse(URLBankAPI.baseUrl + URLBankAPI.submitV3Url);

    final header = <String, String>{
      'Content-Type': 'application/json',
    };

    final body = <String, dynamic>{
      "identity_code": model.identityCode,
      "fee_channel": model.feeChannel,
      "bank_ref": model.bankRef,
      "bank_date": model.bankDate,
      "original_amount": model.originalAmount,
      "convenience_fee_amount": model.convenienceFeeAmount,
      "sponsor_fee_amount": model.sponsorFeeAmount,
      "total_amount": model.totalAmount,
      "currency": model.currency,
      "description": model.description,
      "payment_token": model.paymentToken,
      "payer_account_no": model.payerAccountNo,
      "payer_account_name": model.payerAccountName,
      "payer_phone": model.payerPhone
    };

    try {
      var response =
          await http.post(url, headers: header, body: jsonEncode(body));
      if (response.statusCode == 200 || response.statusCode==201) {
        var result=ConfirmV3ResponseModel.fromJson(jsonDecode(response.body));
        return result;
      } else {
        throw Exception();
      }
    } catch (ex) {
      debugPrint("------------->${ex.toString()}");
      throw Exception();
    }
  }
}
