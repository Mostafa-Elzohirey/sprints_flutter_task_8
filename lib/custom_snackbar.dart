import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

final snackBar = SnackBar(
  elevation: 0,
  behavior: SnackBarBehavior.fixed,
  backgroundColor: Colors.transparent,
  content: AwesomeSnackbarContent(
    title: 'counter alert',
    message: 'this number is divisible by 5!',
    contentType: ContentType.warning,
  ),
);
