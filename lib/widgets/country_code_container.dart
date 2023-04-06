import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phone_test_task/styles/phone_task_text_styles.dart';

class CountryCodeContainer extends StatelessWidget {
  final VoidCallback onPressed;
  final String countryFlag;
  final String countryCode;

  const CountryCodeContainer({
    Key? key,
    required this.onPressed,
    required this.countryFlag,
    required this.countryCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color.fromRGBO(244, 245, 255, 0.4)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 14.0,
          ),
          child: Row(
            children: <Widget>[
              Text(
                countryFlag,
                style: GoogleFonts.inter(fontSize: 16),
              ),
              const SizedBox(width: 3),
              Text(
                countryCode,
                style: PhoneTaskTextStyles.commonTextBlack,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
