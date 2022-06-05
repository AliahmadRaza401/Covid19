class AppApi {
  static String baseURL = 'https://api.covid19api.com';
  static String getAllCountry = '$baseURL/summary';
  countryDetail(country) {
    return '$baseURL/live/country/$country/status/confirmed';
  }
}
