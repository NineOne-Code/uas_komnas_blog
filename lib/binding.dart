import 'package:get/get.dart';
import 'package:uas_komnas_blog/controllers/controllers.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => MenuController());
  }
}
