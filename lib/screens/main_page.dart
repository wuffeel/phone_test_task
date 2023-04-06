import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phone_test_task/widgets/country_code_container.dart';
import 'package:phone_test_task/widgets/phone_input_field.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Center(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CountryCodeContainer(
                      onPressed: () {},
                      countryFlag: '🇺🇸',
                      countryCode: '+1',
                    ),
                  ),
                  Expanded(
                    child: PhoneInputField(
                        mask: '(###) ###-##-##',
                        filter: {'#': RegExp(r'\d')},
                        onChanged: (unmaskedText) {
                          setState(() {
                            _isFabEnabled = unmaskedText.length == 10;
                          });
                        }),
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
