import 'dart:convert';
import 'package:http/http.dart' as http;


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
const apiKey = 'AF7EAB78-3EE3-4F27-9E53-E8D1A49020E5';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Uri uri = Uri.parse('$coinAPIURL/BTC/$selectedCurrency?apikey=$apiKey');
    http.Response response = await  http.get(uri);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      double lastPrice = decodedData['rate']; 
      return lastPrice.toStringAsFixed(0);
    } else {
      print(response.statusCode);
    }
  }
}

