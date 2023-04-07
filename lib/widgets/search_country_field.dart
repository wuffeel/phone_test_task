import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phone_test_task/styles/phone_task_text_styles.dart';

import '../styles/app_colors.dart';

class SearchCountryField extends StatelessWidget {
  final TextEditingController textController;

  const SearchCountryField({Key? key, required this.textController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.containerBackgroundColor,
      ),
      child: TextField(
        controller: textController,
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
