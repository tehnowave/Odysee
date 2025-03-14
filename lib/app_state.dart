import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _favorite = prefs
              .getStringList('ff_favorite')
              ?.map((path) => path.ref)
              .toList() ??
          _favorite;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<DocumentReference> _favorite = [];
  List<DocumentReference> get favorite => _favorite;
  set favorite(List<DocumentReference> value) {
    _favorite = value;
    prefs.setStringList('ff_favorite', value.map((x) => x.path).toList());
  }

  void addToFavorite(DocumentReference value) {
    favorite.add(value);
    prefs.setStringList('ff_favorite', _favorite.map((x) => x.path).toList());
  }

  void removeFromFavorite(DocumentReference value) {
    favorite.remove(value);
    prefs.setStringList('ff_favorite', _favorite.map((x) => x.path).toList());
  }

  void removeAtIndexFromFavorite(int index) {
    favorite.removeAt(index);
    prefs.setStringList('ff_favorite', _favorite.map((x) => x.path).toList());
  }

  void updateFavoriteAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    favorite[index] = updateFn(_favorite[index]);
    prefs.setStringList('ff_favorite', _favorite.map((x) => x.path).toList());
  }

  void insertAtIndexInFavorite(int index, DocumentReference value) {
    favorite.insert(index, value);
    prefs.setStringList('ff_favorite', _favorite.map((x) => x.path).toList());
  }

  DocumentReference? _addCountry;
  DocumentReference? get addCountry => _addCountry;
  set addCountry(DocumentReference? value) {
    _addCountry = value;
  }

  LatLng? _location;
  LatLng? get location => _location;
  set location(LatLng? value) {
    _location = value;
  }

  DocumentReference? _travelRef;
  DocumentReference? get travelRef => _travelRef;
  set travelRef(DocumentReference? value) {
    _travelRef = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
