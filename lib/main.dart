import 'package:flutter/material.dart';
import './stat_chart.dart';

void main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

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
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  _navigate(BuildContext context, {String action}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WHStatsChart.withSampleDate();
    }));
  }
}
