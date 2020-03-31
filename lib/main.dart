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
      appBar: AppBar(
        title: Text('Battery Powered Heating and Cooling'),
      ),
      body: Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Switch(
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
              RaisedButton(
                child: Text("Heating"),
                onPressed: _changeText,
                color: Colors.red,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Colors.grey,
              ),
              RaisedButton(
                child: Text("Cooling"),
                onPressed: _changeText,
                color: Colors.blue,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Colors.grey,
              ),
            ],
          ),
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
