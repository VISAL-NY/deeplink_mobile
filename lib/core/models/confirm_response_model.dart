class ConfirmV2ResponseModel{
  String code;
  String message;
  String? messageKh;
  ConfirmV2Data data;

  ConfirmV2ResponseModel({required this.code,required this.message,required this.messageKh,required this.data});

  factory ConfirmV2ResponseModel.fromJson(Map<String,dynamic> json){
    return ConfirmV2ResponseModel(
      code: json['code'], 
      message: json['message'], 
      messageKh: json['message_kh'], 
      data: ConfirmV2Data.fromJson(json['data'] as Map<String,dynamic>));
  }

}

class ConfirmV2Data{
  String paymentAccountName;
  String paymentAccountPhoneNumber;
  double paymentFee;
  String paymentChannel;
  String paymentFeeChargeBy;
  String refData;
  String receiptCode;
  String customerCode;
  String customerName;
  String paidTo;
  String paidDate;
  String currency;
  double billAmount;
  double feeAmount;
  double totalAmount;
  String paymentBy;
  String paymentAccount;
  String paymentType;
  String refNo;
  String note;

  ConfirmV2Data({
    required this.paymentAccountName,
    required this.paymentAccountPhoneNumber,
    required this.paymentFee,
    required this.paymentChannel,
    required this.paymentFeeChargeBy,
    required this.refData,
    required this.receiptCode,
    required this.customerCode,
    required this.customerName,
    required this.paidTo,
    required this.paidDate,
    required this.currency,
    required this.billAmount,
    required this.feeAmount,
    required this.totalAmount,
    required this.paymentBy,
    required this.paymentAccount,
    required this.paymentType,
    required this.refNo,
    required this.note,
  });

  factory ConfirmV2Data.fromJson(Map<String,dynamic> json){
    return ConfirmV2Data(
      paymentAccountName: json['payment_account_name'], 
      paymentAccountPhoneNumber: json['payment_account_phone_number'], 
      paymentFee: json['payment_fee'].toDouble(), 
      paymentChannel: json['payment_channel'], 
      paymentFeeChargeBy: json['payment_fee_charge_by'], 
      refData: json['ref_data'], 
      receiptCode: json['receipt_code'],
       customerCode: json['customer_code'], 
       customerName: json['customer_name'], 
       paidTo: json['paid_to'], 
       paidDate: json['paid_date'], 
       currency: json['currency'], 
       billAmount: json['bill_amount'].toDouble(), 
       feeAmount: json['fee_amount'].toDouble(), 
       totalAmount: json['total_amount'].toDouble(), 
       paymentBy: json['payment_by'],
      paymentAccount: json['payment_account'], 
      paymentType: json['payment_type'], 
      refNo: json['ref_no'], 
      note: json['note']);
  }
}


class ConfirmV3ResponseModel{
  String code;
  String message;
  String? messageKh;
  ConfirmV3Data? data;
  ConfirmV3ResponseModel({required this.code,required this.message,required this.messageKh,required this.data});

  factory ConfirmV3ResponseModel.fromJson(Map<String,dynamic> json){
    return ConfirmV3ResponseModel(
      code: json['code'], 
      message: json['message'], 
      messageKh: json['message_kh'] ?? "", 
      data:json['data']!=null? ConfirmV3Data.fromJson(json['data'] as Map<String,dynamic>):null
       );
  }
}

class ConfirmV3Data{
  MerchantResponseV3? merchant;
  TransactionResponseV3? transaction;

  ConfirmV3Data({required this.merchant,required this.transaction});

  factory ConfirmV3Data.fromJson(Map<String,dynamic> json){
    return ConfirmV3Data(
      merchant: json['merchant']!=null? MerchantResponseV3.fromJson(json['merchant'] as Map<String,dynamic>) :null, 
      transaction: json['transaction']!=null? TransactionResponseV3.fromJson(json['transaction'] as Map<String,dynamic>):null
      );
  }
}
class MerchantResponseV3{
  String code;
  String name;
  MerchantResponseV3({required this.code,required this.name});

  factory MerchantResponseV3.fromJson(Map<String,dynamic> json){
    return MerchantResponseV3(
      code: json['code'], 
      name: json['name']
      );
  }
}

class TransactionResponseV3{
  String id;
  double originalAmount;
  double convenienceFeeAmount;
  double sponsorFeeAmount;
  String feeChannel;
  double totalAmount;
  String currency;
  String description;
  String bankRef;

  TransactionResponseV3({
    required this.id,
    required this.originalAmount,
    required this.convenienceFeeAmount,
    required this.sponsorFeeAmount,
    required this.feeChannel,
    required this.totalAmount,
    required this.currency,
    required this.description,
    required this.bankRef
  });

  factory TransactionResponseV3.fromJson(Map<String,dynamic> json){
    return TransactionResponseV3(
      id: json['id'], 
      originalAmount: json['original_amount'], 
      convenienceFeeAmount: json['convenience_fee_amount'], 
      sponsorFeeAmount: json['sponsor_fee_amount'], 
      feeChannel: json['fee_channel'], 
      totalAmount: json['total_amount'], 
      currency: json['currency'], 
      description: json['description'],
       bankRef: json['bank_ref']);
  }
}

