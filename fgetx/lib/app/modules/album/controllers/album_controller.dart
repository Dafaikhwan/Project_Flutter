import 'package:fgetx/app/data/models/album_model.dart';
import 'package:fgetx/app/service/album_service.dart';
import 'package:get/get.dart';


class AlbumController extends GetxController {
  var albums = <Album>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchAlbums();
    super.onInit();
  }

  Future<void> fetchAlbums() async {
    try {
      isLoading(true);
      albums.value = await AlbumService.fetchAlbums();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
