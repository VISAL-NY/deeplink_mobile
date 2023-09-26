import 'package:intl/intl.dart';
class ConvertFormat{
   static String convertDateTimeToString(String dateTime){
    DateTime inputDate=DateTime.parse(dateTime);
    final outputFormat=DateFormat('MM/dd/yyyy hh:mm a');
    return outputFormat.format(inputDate);
  }
  static String convertCurrency(double number,String currency){
    if(currency=="KHR"){
      var formatter=NumberFormat("#,###");
      var formatCurrency=formatter.format(number);
      return formatCurrency;
    }
    else{
      var formatter=NumberFormat("#,##0.00");
      return formatter.format(number);
    }
  }
}