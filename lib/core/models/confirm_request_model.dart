class ConfirmV2RequestModel {
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

  ConfirmV2RequestModel(
      {required this.billCode,
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
      required this.paymentFeeChargeBy});
}

class ConfirmV3RequestModel {
  String identityCode;
  String feeChannel;
  String bankRef;
  String bankDate;
  double originalAmount;
  double convenienceFeeAmount;
  double sponsorFeeAmount;
  double totalAmount;
  String currency;
  String description;
  String paymentToken;
  String payerAccountNo;
  String payerAccountName;
  String payerPhone;

  ConfirmV3RequestModel({
    required this.identityCode,
    required this.feeChannel,
    required this.bankRef,
    required this.bankDate,
    required this.originalAmount,
    required this.convenienceFeeAmount,
    required this.sponsorFeeAmount,
    required this.totalAmount,
    required this.currency,
    required this.description,
    required this.paymentToken,
    required this.payerAccountNo,
    required this.payerAccountName,
    required this.payerPhone
  });
}
