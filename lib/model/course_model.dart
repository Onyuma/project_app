class CourseModel {
  late String courseTitle;
  late String courseCode;
  late int courseUnit;
  late String courseStatus;
  late List<String> courseInstructor;

  CourseModel.fromDb(Map<String, dynamic> courseDetails) {
    courseTitle = courseDetails['course_title'];
    courseCode = courseDetails['course_code'];
    courseUnit = courseDetails['course_unit'];
    courseStatus = courseDetails['course_status'];
    courseInstructor = courseDetails['course_instructor'];
  }

  static Future<List> getCourse(List<Map<String, dynamic>> course) async {
    return course;
  }
}
