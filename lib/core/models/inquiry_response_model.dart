import 'customer.dart';
import 'merchant.dart';
import 'transaction.dart';
import 'url.dart';

class InquiryResponseModel{
  String code;
  String message;
  String messageKh;
  Data data;

  InquiryResponseModel({required this.code,required this.message,required this.messageKh,required this.data});

  factory InquiryResponseModel.fromJson(Map<String,dynamic> json){
    return InquiryResponseModel(
      code: json['code'], 
      message: json['message'],
      messageKh: json['message_kh'], 
      data: Data.fromJson(json['data'] as Map<String,dynamic>));
  }
}

class Data{
  Merchant merchant;
  List<Customer> customer;
  Transaction transaction;
  URL url;

  Data({required this.merchant,required this.customer,required this.transaction,required this.url});

  factory Data.fromJson(Map<String,dynamic> json){
    return Data(
      merchant: Merchant.fromJson(json['merchant'] as Map<String,dynamic>), 
      customer: (json['customer'] as List).map((e) => Customer.fromJson(e as Map<String,dynamic>)).toList(), 
      transaction: Transaction.fromJson(json['transaction'] as Map<String,dynamic>), 
      url: URL.fromJson(json['urls'] as Map<String,dynamic> ) );
  }
}