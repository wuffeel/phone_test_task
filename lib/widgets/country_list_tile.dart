import 'package:flutter/material.dart';
import 'package:phone_test_task/styles/phone_task_text_styles.dart';

class CountryListTile extends StatelessWidget {
  final String countryFlag;
  final String countryCallCode;
  final String countryName;
  final VoidCallback onPressed;

  const CountryListTile({
    Key? key,
    required this.countryFlag,
    required this.countryName,
    required this.countryCallCode,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              countryFlag,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(width: 22),
            Text(
              countryCallCode,
              style: PhoneTaskTextStyles.commonTextBlack,
            ),
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                countryName,
                style: PhoneTaskTextStyles.commonTextWhite,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
