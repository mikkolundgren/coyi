class Api {
  final Statistics statistics;
  Api({this.statistics});
  factory Api.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> statsJson = json['api'];
    return Api(statistics: Statistics.fromJson(statsJson['statistics']));
  }
}

class Statistics {
  final Matchs matches;
  Statistics.fromJson(Map<String, dynamic> json)
      : matches = Matchs.fromJson(json['matchs']);
}

class Matchs {
  final Stat wins;
  final Stat draws;
  final Stat loses;
  Matchs.fromJson(Map<String, dynamic> json)
      : wins = Stat.fromJson(json['wins']),
        draws = Stat.fromJson(json['draws']),
        loses = Stat.fromJson(json['loses']);
}

class Stat {
  final int home;
  final int away;
  final int total;
  Stat.fromJson(Map<String, dynamic> json)
      : home = json['home'],
        away = json['away'],
        total = json['total'];
}
