class Country {
  final String? countryCallCode;
  final String? name;
  final String? flag;

  Country({this.countryCallCode, this.name, this.flag});

  factory Country.fromJson(Map<String, dynamic> json) {
    String countryCallCode = json['idd']['root'];
    final callSuffixes = json['idd']['suffixes'];
    if (callSuffixes.isNotEmpty && callSuffixes.length == 1) {
      countryCallCode += callSuffixes[0];
    }

    return Country(
      countryCallCode: countryCallCode,
      name: json['name']['common'],
      flag: json['flag'],
    );
  }
}
