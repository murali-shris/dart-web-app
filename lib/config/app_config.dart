import 'package:safe_config/safe_config.dart';
import 'dart:io';

class ApplicationConfiguration extends Configuration {
  ApplicationConfiguration(String fileName) :
        super.fromFile(File(fileName));
  String host;
  int port;
}