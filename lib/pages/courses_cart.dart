import 'package:flutter/material.dart';
import 'package:project_app/pages/course_details.dart';
import '../model/course_model.dart';
import '../data/course_data.dart';

class CoursesCart extends StatefulWidget {
  const CoursesCart({super.key});

  @override
  State<CoursesCart> createState() => _CoursesCartState();
}

class _CoursesCartState extends State<CoursesCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '300L Courses',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 105, 65),
        toolbarHeight: 90,
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: FutureBuilder(
            future: CourseModel.getCourse(course),
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 80,
                    width: double.infinity,
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return CourseDetails(
                                        snapshot.data![index]['courseTitle']);
                                  },
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      snapshot.data![index]['courseCode'],
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '${snapshot.data![index]['courseStatus']}',
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${snapshot.data![index]['courseTitle']}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          for (int i = 0;
                                              i <
                                                  (snapshot.data![index][
                                                              'courseInstructor']
                                                          as List)
                                                      .length;
                                              i++)
                                            Text(
                                              ' | ${snapshot.data![index]['courseInstructor'][i]}',
                                              style: const TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider()
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
