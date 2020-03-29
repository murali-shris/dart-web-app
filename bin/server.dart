library piratesnest;

import 'dart:async';
import 'dart:io';

import 'package:logging/logging.dart';
import 'package:rpc/rpc.dart';

import 'package:dart_web_app/server/restapi.dart';
import 'package:dart_web_app/config/app_config.dart';
import 'package:safe_config/safe_config.dart';


final ApiServer _apiServer = new ApiServer(prettyPrint: true);

var config = new ApplicationConfiguration('config/config.yaml');
String host = config.host;
int port = config.port;
Future main() async {
  // Add a bit of logging...
  Logger.root..level = Level.INFO
    ..onRecord.listen(print);

  // Set up a server serving the product API.
  _apiServer.addApi(new ProductsApi());
  print('starting server on host: ${host} port: ${port}' );
  HttpServer server =
  await HttpServer.bind(host, port);
  server.listen((request) => _apiServer.httpRequestHandler(request));
  print('Server listening on http://${server.address.host}:'
      '${server.port}');
}