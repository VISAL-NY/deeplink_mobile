import 'merchant.dart';
import 'transaction.dart';
import 'url.dart';

class InquiryV5ResponseModel{
  String code;
  String message;
  String? messageKh;
  DataV5 data;

  InquiryV5ResponseModel({required this.code,required this.message,required this.messageKh,required this.data});

  factory InquiryV5ResponseModel.fromJson(Map<String,dynamic> json){
    return InquiryV5ResponseModel(
      code: json['code'], 
      message: json['message'],
      messageKh: json['message_kh'], 
      data: DataV5.fromJson(json['data'] as Map<String,dynamic>));
  }
}

class DataV5{
  Merchant merchant;
  List<CustomerV5> customers;
  Transaction transaction;
  URL url;

  DataV5({required this.merchant,required this.customers,required this.transaction,required this.url});

  factory DataV5.fromJson(Map<String,dynamic> json){
    return DataV5(
      merchant: Merchant.fromJson(json['merchant'] as Map<String,dynamic>), 
      customers: (json['customers'] as List).map((e) => CustomerV5.fromJson(e as Map<String,dynamic>)).toList(), 
      transaction: Transaction.fromJson(json['transaction'] as Map<String,dynamic>), 
      url: URL.fromJson(json['url'] as Map<String,dynamic> ) );
  }
}

class InquiryV4ResponseModel{
  String code;
  String message;
  String? messageKh;
  DataV4 data;

  InquiryV4ResponseModel({required this.code,required this.message,required this.messageKh,required this.data});
  
  factory InquiryV4ResponseModel.fromJson(Map<String,dynamic> json){
    return InquiryV4ResponseModel(
      code: json['code']  ,
      message: json['message'], 
      messageKh: json['message_kh'],
      data: DataV4.fromJson(json['data'] as Map<String,dynamic>));
  }

}


class DataV4{
  Supplier supplier;
  Customer customer;
  List<Balance> balances;

  DataV4({required this.supplier,required this.customer,required this.balances});

  factory DataV4.fromJson(Map<String ,dynamic> json){
    return DataV4(
      supplier: Supplier.fromJson(json['supplier'] as Map<String,dynamic>) , 
      customer: Customer.fromJson(json['customer'] as Map<String,dynamic>),
      balances: (json['balances'] as List).map((e) => Balance.fromJson(e as Map<String, dynamic>)).toList());
  }
}


class Supplier{
  String code;
  String name;
  String shortName;
  bool allowExceedPayment;
  bool allowPartialPayment;
  Supplier({
    required this.code,
    required this.name,
    required this.shortName,
    required this.allowExceedPayment,
    required this.allowPartialPayment
  });

  factory Supplier.fromJson(Map<String,dynamic> json){
    return Supplier(
      code: json['code'],
      name: json['name'], 
      shortName: json['short_name'], 
      allowExceedPayment: json['allow_exceed_payment'], 
      allowPartialPayment: json['allow_partial_payment']);
  }
}

class CustomerV5 extends Customer{
  String branchCode;
  String branchName;
  String billNo;
  double amount;
  CustomerV5(String id,String code,String name,String nameEn,
  {required this.branchCode,required this.branchName,required this.billNo,required this.amount}):super(id: id,code: code, name: name, nameEn: nameEn);
    
  factory CustomerV5.fromJson(Map<String,dynamic> json){
    return CustomerV5(
      json['id'],
      json['code'], 
      json['name'], 
      json['name_en'], 
      branchCode: json['branch_code'], 
      branchName: json['branch_name'], 
      billNo: json['bill_no'],
      amount: json['amount'].toDouble());
  }
  
}
class Customer{
  String id;
  String code;
  String name;
  String nameEn;

  //Customer.extend({required this.id,required this.code,required this.name,required this.nameEn});
  Customer({
    required this.id,
    required this.code,
    required this.name,
    required this.nameEn
  });

  factory Customer.fromJson(Map<String,dynamic> json){
    return Customer(id: json['id'], code: json['code'], name: json['name'], nameEn: json['name_en']);
  }
}


class Balance{
  double billAmount;
  double feeAmount;
  String feeType;
  double totalAmount;
  String currency;
  String paymentToken;
  //List<PayoutAccount> payoutAccounts;

  Balance({
    required this.billAmount,
    required this.feeAmount,
    required this.feeType,
    required this.totalAmount,
    required this.currency,
    required this.paymentToken,
    //required this.payoutAccounts
    });

    factory Balance.fromJson(Map<String,dynamic> json){
      return Balance(
        billAmount: json['bill_amount'].toDouble(), 
        feeAmount: json['fee_amount'].toDouble(), 
        feeType: json['fee_type'], 
        totalAmount: json['total_amount'].toDouble(), 
        currency: json['currency'], 
        paymentToken: json['payment_token']);
        //payoutAccounts: (json['payout_accounts'] as List).map((e) => PayoutAccount.fromJson(e)).toList());
    }
}