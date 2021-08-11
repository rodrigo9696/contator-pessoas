import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "contador de pessoas",
      home: Home()));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infotext = "Pode Entrar!!";

  void _changepeople(int delta){
    if(_people == 0 && delta == -1) {
      setState(() {
        _people = 0;

      });
    }else{
      setState(() {
        _people += delta;
        if(_people >=10){
          _infotext = "Não pode entrar!!";
        }else{
          _infotext = "Pode Entrar!!";
        }
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_people",
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    onPressed: () {
                      _changepeople(1);

                    },
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    onPressed: () {
                      _changepeople(-1);
                    },
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              _infotext,
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 30.0,
              ),
            )
          ],
        )
      ],
    );
  }
}
