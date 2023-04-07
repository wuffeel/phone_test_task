import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:phone_test_task/models/country.dart';
import 'package:phone_test_task/screens/country_list_screen.dart';
import 'package:phone_test_task/styles/phone_task_text_styles.dart';
import 'package:phone_test_task/widgets/country_code_container.dart';
import 'package:phone_test_task/widgets/phone_input_field.dart';

import '../widgets/country_description_dialog.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isFabEnabled = false;
  Country? _selectedCountry;

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
                    onPressed: () async {
                      final selectedCountry =
                          await showMaterialModalBottomSheet(
                        enableDrag: false,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) => CountryListScreen(
                          onCrossTap: () =>
                              Navigator.pop(context, _selectedCountry),
                        ),
                      );
                      setState(() {
                        _selectedCountry = selectedCountry;
                      });
                    },
                    countryFlag: _selectedCountry?.flag ?? '🇺🇸',
                    countryCode: _selectedCountry?.countryCallCode ?? '+1',
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
          onPressed: _isFabEnabled
              ? () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CountryDescriptionDialog(
                        title: _selectedCountry?.name ?? 'United States',
                        callCode: _selectedCountry?.countryCallCode ?? '+1',
                        flag: _selectedCountry?.flag ?? '🇺🇸',
                      );
                    },
                  );
                }
              : null,
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
