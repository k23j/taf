import 'package:taf/test/sprint/data/default_sprint_course.dart';
import 'package:taf/test/sprint/models/on_going_sprint.dart';
import 'package:taf/test/sprint/models/sprint_course.dart';

class SprintData {
  final SprintCourse course;
  OnGoingSprint? onGoingSprint;

  SprintData({required this.course});

  factory SprintData.standard() => SprintData(course: standardSprintCourse);
}

class SprintResult {

}
