import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phone_test_task/styles/phone_task_text_styles.dart';
import 'package:phone_test_task/widgets/country_list_tile.dart';

import '../widgets/search_country_field.dart';

class CountryListScreen extends StatelessWidget {
  final VoidCallback onCrossTap;

  const CountryListScreen({
    Key? key,
    required this.onCrossTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.95,
      padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(142, 170, 251, 1),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'Country code',
                  style: PhoneTaskTextStyles.titleTextWhite,
                ),
              ),
              GestureDetector(
                onTap: onCrossTap,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(244, 245, 255, 0.4),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: SvgPicture.asset(
                      'assets/cross_icon.svg',
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // TODO: implement search functionality
          const SearchCountryField(),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              // TODO: provide itemCount and ListTile data from REST
              itemCount: 5,
              itemBuilder: (context, index) => const CountryListTile(
                countryFlag: '🇺🇸',
                countryCode: '+93',
                countryName: 'USA',
              ),
            ),
          )
        ],
      ),
    );
  }
}
