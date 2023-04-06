import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:phone_test_task/screens/country_list_screen.dart';
import 'package:phone_test_task/styles/phone_task_text_styles.dart';
import 'package:phone_test_task/widgets/country_code_container.dart';
import 'package:phone_test_task/widgets/phone_input_field.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isFabEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(142, 170, 251, 1),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 80.0,
          left: 20.0,
          right: 20.0,
          bottom: 20.0,
        ),
        child: Stack(
          children: <Widget>[
            Text(
              'Get Started',
              style: PhoneTaskTextStyles.titleTextWhite,
            ),
            Center(
              child: Row(
                children: <Widget>[
                  CountryCodeContainer(
                    onPressed: () {
                      showMaterialModalBottomSheet(
                        enableDrag: false,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) => CountryListScreen(
                          onCrossTap: () => Navigator.of(context).pop(),
                        ),
                      );
                    },
                    // TODO: use REST data and provide functionality to update
                    // data based on chosen from bottom sheet
                    countryFlag: '🇺🇸',
                    countryCode: '+1',
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: PhoneInputField(
                      mask: '(###) ###-##-##',
                      filter: {'#': RegExp(r'\d')},
                      onChanged: (unmaskedText) {
                        setState(() {
                          _isFabEnabled = unmaskedText.length == 10;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: AnimatedOpacity(
        opacity: _isFabEnabled ? 1.0 : 0.5,
        duration: const Duration(milliseconds: 300),
        child: FloatingActionButton(
          // TODO: implement some test functionality
          onPressed: _isFabEnabled ? () {} : null,
          backgroundColor: Colors.white,
          elevation: 0,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: _isFabEnabled
                  ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 12,
                        offset: const Offset(0, 2),
                      )
                    ]
                  : null,
              borderRadius: BorderRadius.circular(16),
            ),
            child: SvgPicture.asset(
              'assets/arrow_right.svg',
            ),
          ),
        ),
      ),
    );
  }
}
