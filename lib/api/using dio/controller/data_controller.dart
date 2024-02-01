import 'package:advanced_flutter/api/using%20dio/services/dio_service.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../model/data_model.dart';

class DataController extends GetxController {
  RxList<DataModel> dataS = RxList(); //similar to -var dataS=[].obs
  RxBool isLoading = true.obs;
  RxBool isListDown = false.obs;
  RxBool isNetConnected = true.obs;

  var url = 'https://jsonplaceholder.typicode.com/posts';
  var scrollController =
      ItemScrollController(); //to control positions of scrollable

  ///to check the internet is connected or not
  void isInternetConnected() async {
    isNetConnected.value = await InternetConnectionChecker().hasConnection;
  }

  ///to fetch all the data from api
  fetchData() async {
    isInternetConnected();
    isLoading.value = true;
    var response = await DioService().getData(url);
    if (response.statusCode == 200) {
      response.data.forEach((data) {
        // DataModel.fromJson(data); //was added later by other
        dataS.add(DataModel.fromJson(data));
      });
      isLoading.value = false;
    }
  }

  ///scroll ListView to down
  scrollToDown() {
    scrollController.scrollTo(
        index: dataS.length,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.bounceInOut);
    isListDown.value = true;
  }

  ///scroll ListView to up
  scrollToUp() {
    scrollController.scrollTo(
        index: 0,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.bounceInOut);
    isListDown.value = false;
  }

  @override
  void onInit() {
    fetchData();
    isInternetConnected();
    super.onInit();
  }
}
