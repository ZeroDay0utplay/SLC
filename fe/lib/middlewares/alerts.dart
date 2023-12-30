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

Future<int> successAlert(String? msg, BuildContext context) async{
  await QuickAlert.show(
    context: context,
    type: QuickAlertType.success,
    text: msg,
    autoCloseDuration: const Duration(seconds: 2),
    showConfirmBtn: false,
  );
  return 1;
}

Future<int> warningAlert(String? msg, BuildContext context) async{
  QuickAlert.show(
    context: context,
    type: QuickAlertType.warning,
    text: msg,
  );
  return 1;
}

Future<int> errorAlert(String? msg, BuildContext context) async{
  await QuickAlert.show(
    context: context,
    type: QuickAlertType.error,
    title: 'Oops...',
    text: msg,
  );
  return 1;
}