class Merchant{
  String code;
  String name;
  bool allowExceedPayment;
  bool allowPartialPayment;

  Merchant({required this.code,required this.name,required this.allowExceedPayment,required this.allowPartialPayment});

  factory Merchant.fromJson(Map<String,dynamic> json){
    return Merchant(
      code:json['code'], 
      name:json['name'], 
      allowExceedPayment:json['allow_exceed_payment'], 
      allowPartialPayment:json['allow_partial_payment']
      );
  }

}