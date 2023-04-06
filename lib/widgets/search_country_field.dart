import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phone_test_task/styles/phone_task_text_styles.dart';

class SearchCountryField extends StatelessWidget {
  const SearchCountryField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromRGBO(244, 245, 255, 0.4),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: PhoneTaskTextStyles.commonTextBlack,
          labelStyle: PhoneTaskTextStyles.commonTextBlack,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          prefixIcon: Align(
            widthFactor: 1.0,
            heightFactor: 1.0,
            child: SvgPicture.asset(
              'assets/search_icon.svg',
            ),
          ),
        ),
      ),
    );
  }
}
