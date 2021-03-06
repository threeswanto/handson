import 'dart:io';

import 'package:http/io_client.dart';

class API {
  String baseUrl;
  IOClient ioClient;

  API(String baseUrl) {
    this.baseUrl = baseUrl;
    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
    this.ioClient = new IOClient(httpClient);
  }
}
