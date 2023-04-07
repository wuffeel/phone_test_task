import 'package:flutter/material.dart';

import '../styles/phone_task_text_styles.dart';

class CountryDescriptionDialog extends StatelessWidget {
  final String title;
  final String callCode;
  final String flag;

  const CountryDescriptionDialog({
    Key? key,
    required this.title,
    required this.callCode, required this.flag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: PhoneTaskTextStyles.titleTextBlack,
      ),
      content: Text(
        'Call phone code of the country is: $callCode\nFlag: $flag',
        style: PhoneTaskTextStyles.commonTextBlack,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'OK',
            style: PhoneTaskTextStyles.commonTextBlack,
          ),
        )
      ],
    );
  }
}
