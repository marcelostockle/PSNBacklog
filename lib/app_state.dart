import 'package:flutter/material.dart';
import '/backend/backend.dart';
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

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<String> _tags = [
    'Plug n Play',
    'Replayability',
    'Rewarding Grind',
    'PVP',
    'Co-op'
  ];
  List<String> get tags => _tags;
  set tags(List<String> value) {
    _tags = value;
  }

  void addToTags(String value) {
    _tags.add(value);
  }

  void removeFromTags(String value) {
    _tags.remove(value);
  }

  void removeAtIndexFromTags(int index) {
    _tags.removeAt(index);
  }

  void updateTagsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _tags[index] = updateFn(_tags[index]);
  }

  void insertAtIndexInTags(int index, String value) {
    _tags.insert(index, value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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
