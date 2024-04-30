import 'package:Formus/app/domains/enums/storage_keys_enum.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageService {
  late Box _dataBox;

  String get _localStorageBox {
    return const String.fromEnvironment('flavor', defaultValue: 'HML')
                .toUpperCase() ==
            'PROD'
        ? 'localStorage'
        : 'localStorageHml';
  }

  Future<void> startLocalStorageBox() async {
    try {
      await Hive.initFlutter();
      _dataBox = await Hive.openBox(_localStorageBox);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  getFieldValue(StorageKeysEnum fieldName) {
    return _dataBox.get(fieldName.getString);
  }

  getFieldValueAsDynamic(StorageKeysEnum fieldName) {
    return _dataBox.get(fieldName.getString);
  }

  Future<void> setFieldValueAsDynamic(
      StorageKeysEnum fieldName, dynamic fieldValue) async {
    try {
      await _dataBox.put(fieldName.getString, fieldValue);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> setFieldValue(
      StorageKeysEnum fieldName, String? fieldValue) async {
    try {
      await _dataBox.put(fieldName.getString, fieldValue);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> deleteField(StorageKeysEnum fieldName) async {
    try {
      await _dataBox.delete(fieldName.getString);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> clear() async {
    _dataBox.clear();
  }
}
