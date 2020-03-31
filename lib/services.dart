import 'package:http/http.dart';

class Services {
  static sendON() async {
    // set up POST request arguments
    String url =
        'https://io.adafruit.com/api/v2/rooloo/feeds/iot/data?x-aio-key=aio_rFgk24w5QVwMb6nJzUp6pZgEwlu5';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"value": "ON"}';
    // make POST request
    Response response = await post(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    String body = response.body;
  }

  static sendOFF() async {
    // set up POST request arguments
    String url =
        'https://io.adafruit.com/api/v2/rooloo/feeds/iot/data?x-aio-key=aio_rFgk24w5QVwMb6nJzUp6pZgEwlu5&value=ON';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"value": "OFF"}';
    // make POST request
    Response response = await post(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    String body = response.body;
  }
}
