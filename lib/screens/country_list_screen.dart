import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phone_test_task/styles/phone_task_text_styles.dart';
import 'package:phone_test_task/widgets/country_list_tile.dart';

import '../models/country.dart';
import '../services/country_service.dart';
import '../widgets/search_country_field.dart';

class CountryListScreen extends StatefulWidget {
  final VoidCallback onCrossTap;

  const CountryListScreen({
    Key? key,
    required this.onCrossTap,
  }) : super(key: key);

  @override
  State<CountryListScreen> createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  final _searchController = TextEditingController();
  String _searchText = '';

  final _countryService = CountryService();
  late Future<List<Country>> _countriesFuture;

  @override
  void initState() {
    super.initState();
    _countriesFuture = _countryService.getCountries();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
                onTap: widget.onCrossTap,
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
          SearchCountryField(
            textController: _searchController,
          ),
          Expanded(
            child: FutureBuilder<List<Country>>(
              future: _countriesFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final countries = snapshot.data!
                    ..sort((a, b) => a.name!.compareTo(b.name!));
                  final filteredCountries = countries
                      .where((country) =>
                          country.name!
                              .toLowerCase()
                              .contains(_searchText.toLowerCase()) ||
                          country.countryCallCode!.contains(_searchText))
                      .toList();
                  return ListView.builder(
                    padding: const EdgeInsets.only(top: 12.0),
                    itemCount: filteredCountries.length,
                    itemBuilder: (context, index) {
                      final country = filteredCountries[index];
                      return CountryListTile(
                        onPressed: () {
                          Navigator.pop(context, country);
                        },
                        countryFlag: country.flag!,
                        countryName: country.name!,
                        countryCallCode: country.countryCallCode!,
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('An error occurred'),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
