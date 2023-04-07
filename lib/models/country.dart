class Country {
  final String? countryCallCode;
  final String? countryCode;
  final String? flag;
  final String? name;

  Country({
    this.countryCallCode,
    this.countryCode,
    this.flag,
    this.name,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    String countryCallCode = json['idd']['root'];
    final callSuffixes = json['idd']['suffixes'];
    if (callSuffixes.isNotEmpty && callSuffixes.length == 1) {
      countryCallCode += callSuffixes[0];
    }

    return Country(
      countryCallCode: countryCallCode,
      countryCode: json['cca2'],
      name: json['name']['common'],
      flag: json['flag'],
    );
  }
}
