import 'package:flutter/material.dart';
import 'services.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  bool isSwitched = false;
  String msg = 'Flutter RaisedButton example';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 100, 0, 100),
              child: Container(

                height: 140,
                width: 400,
                decoration: BoxDecoration(
                    color: Colors.blue[400],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(5))

                ),
                child: Center(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(40, 10, 20, 10),
                      child: Text('Battery Powered Heating & Cooling Suit',
                        style: TextStyle(fontSize: 25, color: Colors.white,),),
                    ),
                  ),

                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(40))

              ),
              height: 150,
              width: 300,
              child: Center(
                child: Text(
                  '37',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 60,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 100, 0, 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Turn ON/OFF       '),
                  Transform.scale(
                    scale: 1.5,
                    child: Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                          print(isSwitched);
                          if (isSwitched)
                            Services.sendON();
                          else
                            Services.sendOFF();
                        });
                      },
                      activeTrackColor: Colors.lightGreenAccent,
                      activeColor: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    child: RaisedButton(
                      child: Text("Heating", style: TextStyle(fontSize: 25),),
                      onPressed: _changeText,
                      color: Colors.red,
                      textColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      splashColor: Colors.grey,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    child: RaisedButton(
                      child: Text("Cooling", style: TextStyle(fontSize: 25),),
                      onPressed: _changeText,
                      color: Colors.blue,
                      textColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      splashColor: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _changeText() {
    setState(() {
      if (msg.startsWith('F')) {
        msg = ' ';
      } else {
        msg = '';
      }
    });
  }
}
