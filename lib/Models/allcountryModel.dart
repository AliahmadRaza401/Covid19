class CountryModel {
    CountryModel({
        required this.id,
        required this.country,
        required this.countryCode,
        required this.slug,
        required this.newConfirmed,
        required this.totalConfirmed,
        required this.newDeaths,
        required this.totalDeaths,
        required this.newRecovered,
        required this.totalRecovered,
        required this.date,
    });

    String id;
    String country;
    String countryCode;
    String slug;
  String  newConfirmed;
    String totalConfirmed;
    String newDeaths;
    String totalDeaths;
    String newRecovered;
    String totalRecovered;
    String date;

    
}
