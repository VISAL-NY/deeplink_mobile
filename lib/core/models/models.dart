import 'dart:ui';

class BankAccountNumber {
  static const firstAccount = '899837848';
  static const secondAccount = '984783938';
  static const thirdAccount = '938993893';
}


class  CONST{
 static Color white=const Color(0xFFFFFFFF);
 static Color fontColor=const Color(0xFF20334F);
 static Color backColor=const Color(0xFF607D8B);

 static String bankName='ABC Bank';
}

class URLBankAPI{
  static const inquiryUrl="https://localhost:7179/inquiry";
  static const submitUrl="https://localhost:7179/submit";
}

class NewModelTest{
  String code;
  String message;
  String? messageKh;
  Data data;

  NewModelTest({required this.code,required this.message,required this.messageKh,required this.data});
  
  factory NewModelTest.fromJson(Map<String,dynamic> json){
    return NewModelTest(
      code: json['code']  ,
      message: json['message'], 
      messageKh: json['message_kh'],
      data: Data.fromJson(json['data'] as Map<String,dynamic>));
  }

}


class Data{
  Supplier supplier;
  Customer customer;
  List<Balance> balances;

  Data({required this.supplier,required this.customer,required this.balances});

  factory Data.fromJson(Map<String ,dynamic> json){
    return Data(
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


class Customer{
  String id;
  String code;
  String name;
  String nameEn;

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
        billAmount: json['bill_amount'], 
        feeAmount: json['fee_amount'], 
        feeType: json['fee_type'], 
        totalAmount: json['total_amount'], 
        currency: json['currency'], 
        paymentToken: json['payment_token']);
        //payoutAccounts: (json['payout_accounts'] as List).map((e) => PayoutAccount.fromJson(e)).toList());
    }

}