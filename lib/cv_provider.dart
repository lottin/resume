
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CVProvider with ChangeNotifier {
  String fullName = '';
  String bio = '';
  String slack = '';
  String github = '';

  SharedPreferences? _preferences;

  Future<void> initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
    fullName = _preferences!.getString('fullName') ?? '';
    bio = _preferences!.getString('bio') ?? '';
    slack = _preferences!.getString('slack') ?? '';
    github = _preferences!.getString('github') ?? '';
  }

  Future<void> updateCVInformation({
    required String fullName,
    required String bio,
    required String slack,
    required String github,
  }) async {
    this.fullName = fullName;
    this.bio = bio;
    this.slack = slack;
    this.github = github;

    await _preferences?.setString('fullName', fullName);
    await _preferences?.setString('bio', bio);
    await _preferences?.setString('slack', slack);
    await _preferences?.setString('github', github);

    notifyListeners();
  }
}