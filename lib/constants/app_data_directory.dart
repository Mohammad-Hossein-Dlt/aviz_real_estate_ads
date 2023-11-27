import 'dart:io';

class AppDataDirectory {
  static Directory appDataDirectory = Directory("");
  static Directory cache() => Directory('${appDataDirectory.path}/cache');
}
