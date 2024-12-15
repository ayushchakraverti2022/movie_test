import 'package:flutter/material.dart';
import 'package:movie_test/colors/color.dart';
import 'package:movie_test/fonts/font.dart';
import 'package:stylish_dialog/stylish_dialog.dart';

class CustomDialog {

  static Widget customPD() {
    return Center(
      child: Container(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(
            color: CustomColor.themeColor(),
            strokeWidth: 5,
          )),
    );
  }

  BuildContext context;
  late StylishDialog stylishDialog;
  CustomDialog(this.context);

  void showPD() async{
    // stylishDialog.dismiss();
    stylishDialog = StylishDialog(
      context: context,
      alertType: StylishDialogType.PROGRESS,
      style: DefaultStyle(),
      dismissOnTouchOutside: false,
      title: Text('Please wait....', style: Fonts.LightTextFeildStyle()),
    );
    stylishDialog.show();
  }

  void showError(String error) async {
    // stylishDialog.dismiss();
    stylishDialog = StylishDialog(
      context: context,
      alertType: StylishDialogType.ERROR,
      style: DefaultStyle(),
      dismissOnTouchOutside: true,
      title: Text(error, style: Fonts.LightTextFeildStyle()),
    );
    stylishDialog.show();
  }

  void showInfo(String info) async {
    // stylishDialog.dismiss();
    stylishDialog = StylishDialog(
      context: context,
      alertType: StylishDialogType.INFO,
      style: DefaultStyle(),
      dismissOnTouchOutside: true,
      title: Text(info, style: Fonts.LightTextFeildStyle()),
    );
    stylishDialog.show();
  }

  void showSuccess(String message) async{
    // stylishDialog.dismiss();
    stylishDialog = StylishDialog(
      context: context,
      alertType: StylishDialogType.SUCCESS,
      style: DefaultStyle(),
      dismissOnTouchOutside: true,
      title: Text(message, style: Fonts.LightTextFeildStyle()),
    );
    stylishDialog.show();
  }

  void dismissCD() async {
    stylishDialog.dismiss();
  }
}
