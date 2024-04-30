enum StorageKeysEnum {
  token,
  userInfo,
  isAuth,
  userName,
  userPhoto,
  userEmail,
  groupInfos,
  mainUser,
}

extension StorageKeysEnumExt on StorageKeysEnum {
  String get getString {
    switch (this) {
      case StorageKeysEnum.token:
        return 'token';
      case StorageKeysEnum.userInfo:
        return 'userInfo';
      case StorageKeysEnum.isAuth:
        return 'isAuth';
      case StorageKeysEnum.userName:
        return 'userName';
      case StorageKeysEnum.userPhoto:
        return 'userPhoto';
      case StorageKeysEnum.userEmail:
        return 'userEmail ';
      case StorageKeysEnum.groupInfos:
        return 'groupInfos ';
      case StorageKeysEnum.mainUser:
        return 'groupInfos ';
      default:
        return '';
    }
  }

  static StorageKeysEnum? fromString(String storageKeys) {
    switch (storageKeys.toLowerCase()) {
      case 'token':
        return StorageKeysEnum.token;
      case 'userInfo':
        return StorageKeysEnum.userInfo;
      case 'isAuth':
        return StorageKeysEnum.isAuth;
      case 'groupInfos ':
        return StorageKeysEnum.groupInfos;
      default:
        return null;
    }
  }
}
