class Transaction{
  String id;
  double originalAmount;
  double convinienceFeeAmount;
  double sponsorFeeAmount;
  String feeChannel;
  double totalAmount;
  String currency;
  String description;
  int minAmount;
  int maxAmount;
  String paymentToken;
  Transaction({
    required this.id,
    required this.originalAmount,
    required this.convinienceFeeAmount,
    required this.sponsorFeeAmount,
    required this.feeChannel,
    required this.totalAmount,
    required this.currency,
    required this.description,
    required this.minAmount,
    required this.maxAmount,
    required this.paymentToken
  });


  factory Transaction.fromJson(Map<String,dynamic> json){
    return Transaction(
        id: json['id'], 
        originalAmount: json['original_amount'],
       convinienceFeeAmount: json['convinience_fee_amount'], 
       sponsorFeeAmount: json['sponsor_fee_amount'], 
       feeChannel: json['fee_channel'], 
       totalAmount: json['total_amount'], 
       currency: json['currency'], 
       description: json['description'],
       minAmount: json['min_amount'],
      maxAmount: json['max_amount'], 
      paymentToken: json['payment_token']);
  }
}