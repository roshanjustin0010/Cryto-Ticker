import 'package:dio/dio.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
// const apiKey = '66659D78-0C80-4587-B7C5-6BC2A28F9DA5'; my
const apiKey = 'B4BA3C54-ECED-4FA3-8F97-32517A9C313E';
// const apiKey = 'B4BA3C54-ECED-4FA3-8F97-32517A9C315cskd';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      String requestURL =
          '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';
      var response = await Dio().get(requestURL);
      // print(response.data);
      // print(response.data['rate']);
      if (response.statusCode == 200) {
        double price = response.data['rate'];
        cryptoPrices[crypto] = price.toStringAsFixed(0);
        // print(cryptoPrices);
      } else {
        // print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}
