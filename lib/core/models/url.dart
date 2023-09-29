class URL{
  String returnUrl;

  URL({required this.returnUrl});

  factory URL.fromJson(Map<String,dynamic> json){
    return URL(
      returnUrl: json['return_url']
    );
  }
}