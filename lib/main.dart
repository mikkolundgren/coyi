import 'package:flutter/material.dart';
import './stat_chart.dart';
import './live_feed.dart';
import 'backend.dart';

void main() {
  /*
  getStatistics().then((result) {
    print('got result size ' + result.length.toString());
  });
  */
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("COYI"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 50),
          ),
          Image.asset(
            "assets/logo.png",
            scale: 3.5,
          ),
          Padding(
            padding: EdgeInsets.only(top: 50),
          ),
          Center(
            child: FloatingActionButton.extended(
              heroTag: 'stats',
              label: Text('Statistics'),
              icon: Icon(Icons.category),
              backgroundColor: Colors.pink,
              onPressed: () {
                _navigate(context);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          Center(
            child: FloatingActionButton.extended(
              heroTag: 'live',
              label: Text('Live score'),
              icon: Icon(Icons.access_alarm),
              backgroundColor: Colors.pink,
              onPressed: () {
                _navigate(context, action: 'live');
              },
            ),
          )
        ],
      ),
    );
  }

  _navigate(BuildContext context, {String action}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      if (action == 'live') {
        return LiveFeed();
      } else {
        return WHStatsChart.withSampleDate();
      }
    }));
  }
}
