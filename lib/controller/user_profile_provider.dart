import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../data/local/local_request.dart';
import '../model/user_profile_model.dart';

class UserProfileProvider with ChangeNotifier {
  UserProfileProvider() {
    getSavedUserProfile();
  }
  UserProfileModel _userProfileModel = UserProfileModel(username: "",
      email: "", gender: "", dob: "", account: false, notification: false, theme: false);

  UserProfileModel? get userProfileModel => _userProfileModel;

  void setUserName({required String value}) {
    _userProfileModel.username = value;
    notifyListeners();
  }

  void setUserEmail({required String value}) {
    _userProfileModel.email = value;
    notifyListeners();
  }

  void setGender({required String value}) {
    _userProfileModel.gender = value;
    notifyListeners();
  }

  void setDob({required String value}) {
    _userProfileModel.dob = value;
    notifyListeners();
  }

  void setAccount() {
    _userProfileModel.account = !_userProfileModel.account;
    saveUserProfile();
  }

  void setNotification() {
    _userProfileModel.notification = !_userProfileModel.notification;
    saveUserProfile();
  }
  void setTheme() {
    _userProfileModel.theme = !_userProfileModel.theme;
    saveUserProfile();
  }
  Future saveUserProfile() async {
    await LocalRequest.instance.setString(
        key: LocalRequest.userInfoKey, value: jsonEncode(_userProfileModel));
    notifyListeners();
  }

  void getSavedUserProfile() {
    try {
      var savedData =
          LocalRequest.instance.getString(key: LocalRequest.userInfoKey);
      if (savedData.isNotEmpty) {
        _userProfileModel = UserProfileModel.fromJson(json.decode(savedData));
      }
    } catch (_) {}
    notifyListeners();
  }
}
