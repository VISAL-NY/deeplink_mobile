class InquiryV4RequestModel{
  String? currency;
  String customerCode;
  String billCode;

  InquiryV4RequestModel({required this.currency,required this.customerCode,required this.billCode});
}


class InquiryV5RequestModel{
  String identityCode;
  String feeChannel;

  InquiryV5RequestModel({required this.identityCode,required this.feeChannel});
}
