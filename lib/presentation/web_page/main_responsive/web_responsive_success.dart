import 'package:deeplink_cookbook/core/models/confirm_response_model.dart';
import 'package:deeplink_cookbook/core/models/models.dart';
import 'package:deeplink_cookbook/presentation/web_page/response_web/res_web_success.dart';
import 'package:deeplink_cookbook/presentation/web_page/web_success.dart';
import 'package:flutter/material.dart';

class WebResponsiveSuccess extends StatelessWidget {

  WebResponsiveSuccess({super.key});
  late ConfirmResponseModel confirmResponseModel;
  late NewModelTest newModelTest;
  late String myAccount;

  WebResponsiveSuccess.sendData({required this.confirmResponseModel,required this.newModelTest,required this.myAccount,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context,constraints){
          if(constraints.maxWidth > 840){ 
            return  WebSuccess(confirmResponseModel: confirmResponseModel,newModelTest: newModelTest,myAccount: myAccount,);
          }
          else{
            return  ResWebSuccess(confirmResponseModel: confirmResponseModel,newModelTest: newModelTest,myAccount: myAccount,);
          }
        }
        ),
    );
  }
}