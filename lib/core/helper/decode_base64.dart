import 'dart:convert';

class DecodeBase64{
  static String decodeBase64(String base64String){
    List<int> decodeBytes=base64.decode(base64String);
    return utf8.decode(decodeBytes);
  }
}