import 'package:Formus/app/services/local_storage/local_storage_service.dart';
import 'package:Formus/environment.dart';

import 'package:get/get.dart';

Future<void> initialize() async {
  Enviroment().load();
  LocalStorageService localStorage = Get.put(
    LocalStorageService(),
    permanent: true,
  );
  await localStorage.startLocalStorageBox();
}
