import 'package:get/get.dart';
import 'package:quiz_app/models/mcq_response.dart';
import 'package:quiz_app/services/remote_service.dart';

class McqController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<Mcq> dataList = <Mcq>[].obs;

  @override
  void onInit() {
    fetcData();
    super.onInit();
  }

  // ignore: avoid_void_async
  void fetcData() async {
    try {
      isLoading(true);
      final responseData = await RemoteServices.fetchMcqs();
      if (responseData != null) {
        dataList.assignAll(responseData);
      }
    } finally {
      isLoading(false);
    }
  }

  // void addItem(String url, String title) {
  //   int maxIndex = albumList.map<int>((e) => e.id).reduce(max);
  //   albumList.insert(
  //       0,
  //       Album(
  //           albumId: 1,
  //           thumbnailUrl: url,
  //           title: title,
  //           url: url,
  //           id: maxIndex + 1));
  // }

  // void editItem(Mcq model) {
  //   int index = dataList.indexWhere((element) => element.id == model.id);
  //   albumList[index] = album;
  // }
}
