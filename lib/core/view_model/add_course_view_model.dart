import 'package:ecmmerce_app/core/utiles/db_helper.dart';
import 'package:ecmmerce_app/model/course.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class AddCourseViewModel extends GetxController {
  int? hours;
  String? name, desc;
  DbHelper dbHelper = DbHelper();
  List<CourseModel> courses = [CourseModel(desc: "d", hours: 5, name: "d")];
  int coursesLength = 1;

  AddCourseViewModel() {
    getAllCourses();
  }

  Future<void> addCourseToDatabase() async {
    await dbHelper
        .addCourses(CourseModel(name: name, desc: desc, hours: hours));

    print(await dbHelper.getAllCourse());
  }

  getAllCourses() async {
    List<Map<String, Object?>>? a = await dbHelper.getAllCourse();
    a?.forEach((element) {
      courses.add(CourseModel.fromJson(element));
    });
    coursesLength = courses.length;
    print(courses.length);
    update();
  }
}
