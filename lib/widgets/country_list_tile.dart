import 'package:flutter/material.dart';
import 'package:phone_test_task/styles/phone_task_text_styles.dart';

class CountryListTile extends StatelessWidget {
  final String countryFlag;
  final String countryCode;
  final String countryName;

  const CountryListTile({
    Key? key,
    required this.countryFlag,
    required this.countryName,
    required this.countryCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            countryFlag,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(width: 22),
          Text(
            countryCode,
            style: PhoneTaskTextStyles.commonTextBlack,
          ),
          const SizedBox(width: 12),
          Text(
            countryName,
            style: PhoneTaskTextStyles.commonTextWhite,
          ),
        ],
      ),
    );
  }
}
