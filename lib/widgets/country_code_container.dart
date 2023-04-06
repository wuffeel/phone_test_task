import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              Padding(
                padding: const EdgeInsets.only(right: 3.0),
                child: Text(
                  countryFlag,
                  style: GoogleFonts.inter(fontSize: 16),
                ),
              ),
              Text(
                countryCode,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(89, 76, 116, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
