import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _codeResetPass = 0;
  int get codeResetPass => _codeResetPass;
  set codeResetPass(int value) {
    _codeResetPass = value;
  }

  List<String> _categoriesList = [''];
  List<String> get categoriesList => _categoriesList;
  set categoriesList(List<String> value) {
    _categoriesList = value;
  }

  void addToCategoriesList(String value) {
    categoriesList.add(value);
  }

  void removeFromCategoriesList(String value) {
    categoriesList.remove(value);
  }

  void removeAtIndexFromCategoriesList(int index) {
    categoriesList.removeAt(index);
  }

  void updateCategoriesListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    categoriesList[index] = updateFn(_categoriesList[index]);
  }

  void insertAtIndexInCategoriesList(int index, String value) {
    categoriesList.insert(index, value);
  }
}
