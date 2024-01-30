import 'package:get/get.dart';

class CountController extends GetxController{
      var count=0.obs;
      // RxInt _count1=RxInt(0);
      void increment(){
        count++;
      }
      void decrement(){
        count--;
      }
}