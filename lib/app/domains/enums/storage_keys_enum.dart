enum StorageKeysEnum {
  token,
}

extension StorageKeysEnumExt on StorageKeysEnum {
  String get getString {
    switch (this) {
      case StorageKeysEnum.token:
        return 'token';

      default:
        return '';
    }
  }

  static StorageKeysEnum? fromString(String storageKeys) {
    switch (storageKeys.toLowerCase()) {
      case 'token':
        return StorageKeysEnum.token;

      default:
        return null;
    }
  }
}
