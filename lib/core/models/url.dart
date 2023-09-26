class URL{
  String returnUrl;
  String callbackUrl;

  URL({required this.returnUrl,required this.callbackUrl});

  factory URL.fromJson(Map<String,dynamic> json){
    return URL(
      returnUrl: json['return_url'], 
      callbackUrl: json['callback_url']);
  }
}