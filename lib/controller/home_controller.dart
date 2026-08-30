import 'package:flutter_app/model/post_model.dart';
import 'package:flutter_app/model/slider_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  final banners = <SliderModel>[].obs;

  final latestPosts = <PostModel>[].obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadHome();
  }

  Future<void> loadHome() async {
    isLoading.value = true;
    try{
      //Replace old data
      banners.assignAll(_fetchBanners());
      latestPosts.assignAll(_fetchLatestPosts());
    } finally {
      isLoading.value = false;
    }
  }

  List<SliderModel> _fetchBanners() {
    return <SliderModel>[
      SliderModel(
        title: 'Welcome to GetX Basic',
        subtitle: 'Learn flutter with GetX',
        imageUrl: 'https://picsum.photos/800/400?random=1',
      ),
      SliderModel(
        title: 'Flutter Development',
        subtitle: 'Build modern mobile applications',
        imageUrl: 'https://picsum.photos/800/400?random=2',
      ),
      SliderModel(
        title: 'GetX State Management',
        subtitle: 'Simple and powerful state management',
        imageUrl: 'https://picsum.photos/800/400?random=3',
      ),
    ];
  }

  List<PostModel> _fetchLatestPosts() {
    return <PostModel>[
      PostModel(
        title: 'Getting Started with Flutter',
        imageUrl: 'https://picsum.photos/200/200?random=10',
        author: const UserModel(displayName: 'Makara'),
      ),
      PostModel(
        title: 'Understanding GetX',
        imageUrl: 'https://picsum.photos/200/200?random=11',
        author: const UserModel(displayName: 'Sok'),
      ),
      PostModel(
        title: 'Flutter Navigation',
        imageUrl: 'https://picsum.photos/200/200?random=12',
      ),
    ];
  }

}