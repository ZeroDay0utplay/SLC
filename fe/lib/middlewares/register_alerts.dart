import 'package:quickalert/quickalert.dart';
import 'package:flutter/material.dart';


void showErrorDialog(String errorMessage, BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Error'),
        content: Text(errorMessage),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void successRegisterAlert(String? msg, BuildContext context, fn, String email) async{
  await QuickAlert.show(
    context: context,
    type: QuickAlertType.success,
    text: msg,
    autoCloseDuration: const Duration(seconds: 2),
    showConfirmBtn: false,
  );
  fn(email);
}

void invalidMailAlert(String? msg, BuildContext context){
  QuickAlert.show(
    context: context,
    type: QuickAlertType.warning,
    text: msg,
  );
}

void pwdNotMatchAlert(String? msg, BuildContext context) async{
  await QuickAlert.show(
    context: context,
    type: QuickAlertType.error,
    title: 'Oops...',
    text: msg,
  );
}