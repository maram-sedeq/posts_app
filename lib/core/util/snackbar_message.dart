import 'package:flutter/material.dart';

class SnackbarMessage {

void showSuccesSnackBar({required String message, required BuildContext context}){

   ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    message,
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.pink[300],
                ),
              );
}

void showErrorSnackBar({required String message, required BuildContext context}){

   ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    message,
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.red,
                ),
              );
}

}