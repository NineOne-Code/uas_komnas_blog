import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uas_komnas_blog/services/services.dart';

class LocalStorage {
  static final LocalStorage _instance = LocalStorage._internal();
  LocalStorage._internal();
  factory LocalStorage() => _instance;

  SharedPreferences? _pref;

  Future<void> init() async {
    _pref = await SharedPreferences.getInstance().then((value) {
      print('initial shared preference');
      return value;
    });
  }

  void likePost({required int blogId}) async {
    List<int> _list = getLikes();
    _list.add(blogId);
    print(_list);
    await _pref?.setString(KeyStorage.likes, _list.toString());
  }

  void dislikePost({required int blogId}) async {
    List<int> _list = getLikes();
    _list.remove(blogId);
    print(_list);
    await _pref?.setString(KeyStorage.likes, _list.toString());
  }

  List<int> getLikes() {
    if (_pref != null) {
      return _pref!.containsKey(KeyStorage.likes)
          ? List<int>.from(
              (jsonDecode(_pref!.getString(KeyStorage.likes)!) as List)
                  .map((e) => e as int))
          : [];
    } else {
      return [];
    }
  }

  void deleteLikes() {
    if (_pref != null && _pref!.containsKey(KeyStorage.likes)) {
      _pref?.remove(KeyStorage.likes);
    }
  }
}

class KeyStorage {
  static const String likes = 'likes';
  static const String post = 'post';
}
