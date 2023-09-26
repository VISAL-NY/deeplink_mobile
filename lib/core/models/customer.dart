class Customer{
    String brandCode;
    String brandName;
    String customerCode;
    String customerName;
    String customerNameLatin;
    String billNo;
    double amount;

    Customer({required this.brandCode,
              required this.brandName,
              required this.customerCode,
              required this.customerName,
              required this.customerNameLatin,
              required this.billNo,
              required this.amount});

    factory Customer.fromJson(Map<String,dynamic> json){
      return Customer(
        brandCode: json['brand_code'],
         brandName: json['brand_name'], 
         customerCode: json['customer_code'], 
         customerName: json['customer_name'],
          customerNameLatin: json['customer_name_latin'], 
          billNo: json['bill_no'], 
          amount: json['amount']);
    }
}