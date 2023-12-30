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

void successLoginAlert(String? msg, BuildContext context, fn) async{
  await QuickAlert.show(
    context: context,
    type: QuickAlertType.success,
    text: msg,
    autoCloseDuration: const Duration(seconds: 2),
    showConfirmBtn: false,
  );
  fn();
}

void user404Alert(String? msg, BuildContext context){
  QuickAlert.show(
    context: context,
    type: QuickAlertType.warning,
    text: msg,
  );
}

void wrongPwdAlert(String? msg, BuildContext context) async{
  await QuickAlert.show(
    context: context,
    type: QuickAlertType.error,
    title: 'Oops...',
    text: msg,
  );
}

void confirmAlert(String? msg, String email, BuildContext context, fn) async{
  await QuickAlert.show(
    context: context,
    type: QuickAlertType.warning,
    text: msg,
    autoCloseDuration: const Duration(seconds: 2),
    showConfirmBtn: false,
  );
  fn(email);
}