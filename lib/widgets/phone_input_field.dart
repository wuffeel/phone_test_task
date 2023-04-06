import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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
        color: const Color.fromRGBO(244, 245, 255, 0.4),
      ),
      child: TextField(
        onChanged: (_) {
          widget.onChanged(_maskFormatter.getUnmaskedText());
        },
        autofocus: true,
        decoration: InputDecoration(
          hintText: 'Your phone number',
          hintStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color.fromRGBO(120, 134, 184, 1),
          ),
          labelStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color.fromRGBO(89, 76, 116, 1),
          ),
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
