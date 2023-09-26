class ConfirmRequestModel{
  String billCode;
  String customerCode;
  double billAmount;
  double totalAmount;
  String currency;
  String paymentToken;
  String paymentBy;
  String paymentAccount;
  String paymentType;
  String refNo;
  String note;
  String paymentAccountName;
  String paymentAccountPhoneNumber;
  double paymentFee;
  String paymentChannel;
  String paymentFeeChargeBy;

  ConfirmRequestModel({
    required this.billCode,
    required this.customerCode,
    required this.billAmount,
    required this.totalAmount,
    required this.currency,
    required this.paymentToken,
    required this.paymentBy,
    required this.paymentAccount,
    required this.paymentType,
    required this.refNo,
    required this.note,
    required this.paymentAccountName,
    required this.paymentAccountPhoneNumber,
    required this.paymentFee,
    required this.paymentChannel,
    required this.paymentFeeChargeBy
  });
}

 