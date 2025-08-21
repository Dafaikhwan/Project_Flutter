import 'package:get/get.dart';

import '../controllers/pemesanan_makanan_controller.dart';

class PemesananMakananBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PemesananMakananController>(
      () => PemesananMakananController(),
    );
  }
}
