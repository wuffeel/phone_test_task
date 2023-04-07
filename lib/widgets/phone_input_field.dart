import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:phone_test_task/styles/phone_task_text_styles.dart';

import '../styles/app_colors.dart';

class PhoneInputField extends StatefulWidget {
  final String mask;
  final Map<String, RegExp> filter;
  final void Function(String) onChanged;

  const PhoneInputField({
    Key? key,
    required this.mask,
    required this.filter,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<PhoneInputField> createState() => _PhoneInputFieldState();
}

class _PhoneInputFieldState extends State<PhoneInputField> {
  late final MaskTextInputFormatter _maskFormatter;

  @override
  void initState() {
    super.initState();
    _maskFormatter = MaskTextInputFormatter(
      mask: widget.mask,
      filter: widget.filter,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.containerBackgroundColor,
      ),
      child: TextField(
        onChanged: (_) {
          widget.onChanged(_maskFormatter.getUnmaskedText());
        },
        autofocus: true,
        decoration: InputDecoration(
          hintText: 'Your phone number',
          hintStyle: PhoneTaskTextStyles.commonTextHint,
          labelStyle: PhoneTaskTextStyles.commonTextBlack,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 14.0,
          ),
        ),
        inputFormatters: [_maskFormatter],
        keyboardType: TextInputType.phone,
      ),
    );
  }
}
