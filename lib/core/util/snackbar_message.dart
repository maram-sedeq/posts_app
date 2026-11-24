import 'package:flutter/material.dart';
import 'package:posts_app/core/app_theme.dart';

class SnackbarMessage {

void showSuccesSnackBar({required String message, required BuildContext context}){

   ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    message,
                    style: TextStyle(color: secondaryColor),
                  ),
                  backgroundColor: primaryColor,
                ),
              );
}

void showErrorSnackBar({required String message, required BuildContext context}){

   ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    message,
                    style: TextStyle(color:secondaryColor),
                  ),
                  backgroundColor:errorColor,
                ),
              );
}

}