import 'secrets/secrets.dart';
import 'dart:convert';
import 'constants.dart';
import 'package:http/http.dart' as http;

Map<String, String> _headers = {
  'X-RapidAPI-Host': HOST,
  'X-RapidAPI-Key': API_KEY
};

Future<List<Stats>> getStatistics() async {
  var client = http.Client();

  var result = List<Stats>();
  try {
    var whResponse = await client.get(
        BASE_URL + '/statistics/' + PREMIER_LEAGUE + '/' + WEST_HAM,
        headers: _headers);
    Stats wh = Stats.fromJson(jsonDecode(whResponse.body));
    result.add(wh);
    var brResponse = await client.get(
        BASE_URL + '/statistics/' + PREMIER_LEAGUE + '/' + BRIGHTON,
        headers: _headers);
    Stats br = Stats.fromJson(jsonDecode(brResponse.body));
    result.add(br);
  } finally {
    client.close();
  }
  return result;
}

class Stats {
  final int wins;
  final int loses;
  final int draws;
  Stats(this.wins, this.loses, this.draws);
  Stats.fromJson(Map<String, dynamic> data)
      : wins = int.parse(data['api']['statistics']['matchs']['wins']),
        loses = int.parse(data['api']['statistics']['matchs']['loses']),
        draws = int.parse(data['api']['statistics']['matchs']['draws']);
}
