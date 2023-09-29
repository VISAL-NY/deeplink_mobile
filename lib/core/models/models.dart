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
 static String success="SUCCESS";
}

class URLBankAPI{
  static const baseUrl="http://192.168.197.7:40124";
  static const inquiryV4Url="/transaction/inquiryV4";
  static const inquiryV5Url="/transaction/inquiryV5";
  static const submitV2Url="/transaction/submitV2";
  static const submitV3Url="/transaction/submitV3";
}
