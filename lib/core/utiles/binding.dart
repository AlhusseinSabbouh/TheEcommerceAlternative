import 'package:ecmmerce_app/core/view_model/add_course_view_model.dart';
import 'package:get/get.dart';

import '../view_model/auth_view_model.dart';
import '../view_model/control_view_model.dart';
import '../view_model/home_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel(), fenix: true);
    Get.lazyPut(() => ControlViewModel(), fenix: true);
    Get.lazyPut(() => AddCourseViewModel(), fenix: true);
    Get.lazyPut(() => HomeViewModel(), fenix: true);
  }
}
