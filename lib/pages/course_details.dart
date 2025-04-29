import 'package:flutter/material.dart';

class CourseDetails extends StatefulWidget {
  String? courseTitle;
  CourseDetails(courseTitle, {super.key});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.courseTitle}',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 105, 65),
        toolbarHeight: 90,
      ),
    );
  }
}
