
class Transaction {
  String id;
  double originalAmount;
  double convenienceFeeAmount;
  double sponsorFeeAmount;
  String feeChannel;
  double totalAmount;
  String currency;
  String description;
  double minAmount;
  double maxAmount;
  String paymentToken;
  Transaction(
      {required this.id,
      required this.originalAmount,
      required this.convenienceFeeAmount,
      required this.sponsorFeeAmount,
      required this.feeChannel,
      required this.totalAmount,
      required this.currency,
      required this.description,
      required this.minAmount,
      required this.maxAmount,
      required this.paymentToken});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
        id: json['id'],
        originalAmount: json['original_amount'].toDouble(),
        convenienceFeeAmount: json['convenience_fee_amount'].toDouble(),
        sponsorFeeAmount: json['sponsor_fee_amount'].toDouble(),
        feeChannel: json['fee_channel'],
        totalAmount: json['total_amount'].toDouble(),
        currency: json['currency'],
        description: json['description'],
        minAmount: json['min'].toDouble(),
        maxAmount: json['max'].toDouble(),
        paymentToken: json['payment_token']);
  }
}
