class ConfirmResponseModel{
  String code;
  String message;
  String? messageKh;
  Data data;

  ConfirmResponseModel({required this.code,required this.message,required this.messageKh,required this.data});

  factory ConfirmResponseModel.fromJson(Map<String,dynamic> json){
    return ConfirmResponseModel(
      code: json['code'], 
      message: json['message'], 
      messageKh: json['message_kh'], 
      data: Data.fromJson(json['data'] as Map<String,dynamic>));
  }

}

class Data{
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

  Data({
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

  factory Data.fromJson(Map<String,dynamic> json){
    return Data(
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