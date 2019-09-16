import 'package:coyi/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/events.dart';
import 'bloc/live_feed_bloc.dart';

class LiveFeed extends StatefulWidget {
  LiveFeed({Key key}) : super(key: key);

  _LiveFeedState createState() => _LiveFeedState();
}

class _LiveFeedState extends State<LiveFeed> {
  var _homeTeam = '48';
  var _awayTeam = '48';

  final bloc = LiveFeedBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statistics"),
      ),
      body: Center(
        child: _feed(),
      ),
    );
  }

  Widget _feed() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 200),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "30 min",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 20,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.asset(
                  'assets/' + _homeTeam + '.png',
                  scale: 20,
                ),
                Container(
                  child: Text(
                    "WHU",
                    style: TextStyle(
                      fontSize: 75,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "2",
                    style: TextStyle(
                      fontSize: 75,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  child: Text(
                    " ",
                    style: TextStyle(
                      fontSize: 75,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "-",
                    style: TextStyle(
                      fontSize: 75,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Image.asset(
                  'assets/' + _awayTeam + '.png',
                  scale: 20,
                ),
                Container(
                  child: Text(
                    "LIV",
                    style: TextStyle(
                      fontSize: 75,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "0",
                    style: TextStyle(
                      fontSize: 75,
                    ),
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget _scores() {
    return BlocListener<LiveFeedBloc, int>(
      bloc: bloc,
      listener: (context, state) {
        
      }, 
    );
  }
}
