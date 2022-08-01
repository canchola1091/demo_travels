

import 'package:flutter/material.dart';
import 'package:demo_travels/src/utils/utils.dart' as utils;

final ThemeData theme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Colors.white,
  // scaffoldBackgroundColor: Colors.grey,
  appBarTheme: AppBarTheme(color: primaryColor),
  hintColor: subTitleColor,
  disabledColor: subTitleColor,
  unselectedWidgetColor: secondaryColor,
  textSelectionTheme: TextSelectionThemeData(
    // selectionColor: secondaryColor.withOpacity(0.7),
    selectionColor: primaryColor,
    selectionHandleColor: primaryColor,
  ),
);

// final Color primaryColor = utils.hexToColor('#2a3988');
final Color primaryColor = utils.hexToColor('#32b768');

final Color secondaryColor = utils.hexToColor('#2DAFCE');

final Color subTitleColor = utils.hexToColor('#3A555B');

final Color errorColor = utils.hexToColor('#b00020');

final Color snackBarColor = utils.hexToColor('#1D363C').withOpacity(0.95);

final Color iconColor = utils.hexToColor('#38dfff');

final Color bgButon = utils.hexToColor('#d1fae5');

final Color bgScaffold = utils.hexToColor('#f6f6f6');
