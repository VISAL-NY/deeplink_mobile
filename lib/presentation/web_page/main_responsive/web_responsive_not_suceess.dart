import 'package:deeplink_cookbook/core/models/confirm_response_model.dart';
import 'package:deeplink_cookbook/core/models/models.dart';
import 'package:deeplink_cookbook/presentation/web_page/response_web/res_web_not_success.dart';
import 'package:deeplink_cookbook/presentation/web_page/web_not_success.dart';
import 'package:flutter/material.dart';

class WebResponsiveNotSuccess extends StatelessWidget {
   WebResponsiveNotSuccess({super.key});
   late ConfirmResponseModel confirmResponseModel;
  late NewModelTest newModelTest;
  late String myAccount;

   WebResponsiveNotSuccess.sendData({required this.confirmResponseModel,required this.newModelTest,required this.myAccount,super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context,constaint){
          if(constaint.maxWidth > 840){
            return WebNotSuccess(confirmResponseModel: confirmResponseModel,newModelTest: newModelTest,myAccount: myAccount,);
          }
          else{
            return ResWebNotSuccess(confirmResponseModel: confirmResponseModel, newModelTest: newModelTest, myAccount: myAccount);
          }
        }
        ),
    );
  }
}