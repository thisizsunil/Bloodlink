import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class bannerController extends GetxController {
  RxList<String> bannerUrls = RxList<String>([]);
  @override
  void onInit() {
    super.onInit();
    fetchBannerUrls();
  }

  // fetch banners
  Future<void> fetchBannerUrls() async {
    try {
      QuerySnapshot bannersSnapshot =
          await FirebaseFirestore.instance.collection('banners').get();
      if (bannersSnapshot.docs.isEmpty) {
        bannerUrls.value = bannersSnapshot.docs
            .map((doc) => doc['imageUrl'] as String)
            .toList();      // adding value to      bannerUrls
      }
    } catch (e) {
      print("error: $e");
    }
  }
}
