import 'secrets/secrets.dart';
import 'dart:convert';
import 'constants.dart';
import 'package:http/http.dart' as http;
import 'domain/statistics.dart';

Map<String, String> _headers = {
  'X-RapidAPI-Host': HOST,
  'X-RapidAPI-Key': API_KEY
};

Future<List<Statistics>> getStatistics() async {
  var client = http.Client();

  var result = List<Statistics>();
  try {
    var whResponse = await client.get(
        BASE_URL + '/statistics/' + PREMIER_LEAGUE + '/' + WEST_HAM,
        headers: _headers);
    Api wh = Api.fromJson(json.decode(whResponse.body));
    result.add(wh.statistics);
    var brResponse = await client.get(
        BASE_URL + '/statistics/' + PREMIER_LEAGUE + '/' + BRIGHTON,
        headers: _headers);
    Api br = Api.fromJson(json.decode(brResponse.body));
    result.add(br.statistics);
    print('fetched statistics..');
  } catch (e) {
    throw (e);
  } finally {
    client.close();
  }
  return result;
}
