import 'package:fgetx/app/data/models/post_model.dart';
import 'package:fgetx/app/service/post_service.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  var posts = <PostModel>[].obs;
  var isLoading = true.obs;

  final PostService _service = PostService();

  @override
  void onInit() {
    super.onInit();
    getPosts();
  }

  void getPosts() async {
    try {
      isLoading(true);
      var result = await _service.fetchPosts();
      posts.assignAll(result);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}