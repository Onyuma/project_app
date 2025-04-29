import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_app/model/matches.dart';
import 'package:project_app/quiz_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  dynamic data = {};
  List<dynamic> student = [];
  void getStudents() async {
    try {
      Matches students = Matches();
      List<dynamic> result = await students.fetchUsers();
      setState(() {
        student = result;
      });
      print(student);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStudents();
  }

  Widget _buildCategoryCard(BuildContext context, String title, IconData icon,
      Color color, String questions) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const QuizScreen();
        }));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              )
            ]),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: color.withOpacity(0.2), shape: BoxShape.circle),
              child: Icon(icon, size: 30, color: color)),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            maxLines: 1,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF2C3E50),
                overflow: TextOverflow.ellipsis),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            questions,
            maxLines: 1,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.grey[600],
                overflow: TextOverflow.ellipsis),
          ),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF6C63FF), Color(0xFF3F3090)])),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(0.2)),
                      child: const Row(
                        children: [
                          CircleAvatar(
                            child: Icon(
                              Icons.person,
                              color: Color(0xFF6C63FF),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'John',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.notifications,
                      color: Colors.white,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    gradient: LinearGradient(
                        colors: [Colors.blue.shade400, Colors.white],
                        begin: Alignment.bottomCenter,
                        tileMode: TileMode.repeated,
                        end: Alignment.bottomLeft),
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.2),
                              shape: BoxShape.circle),
                          child: Image.network(
                            'https://upload.wikimedia.org/wikipedia/en/thumb/c/cc/Chelsea_FC.svg/1200px-Chelsea_FC.svg.png',
                            colorBlendMode: BlendMode.luminosity,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Chip(
                          padding: const EdgeInsets.all(8),
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(40, 10)),
                          ),
                          side: const BorderSide(color: Colors.white, width: 5),
                          backgroundColor:
                              const Color.fromARGB(255, 121, 235, 125)
                                  .withOpacity(0.8),
                          label: Text(
                            "${DateFormat.jm().format(DateTime.now())}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.2),
                              shape: BoxShape.circle),
                          child: Image.network(
                            'https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Manchester_United_FC_crest.svg/1200px-Manchester_United_FC_crest.svg.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Are you,',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 25,
                  ),
                ),
                const Text(
                  'Ready for the Semester?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Choose a course to read here',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: (student.isEmpty)
                      ? const Center(
                          child: Text(
                            'No Data',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: 0.90,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          children: student.map(
                            (e) {
                              return _buildCategoryCard(
                                context,
                                '${student[0]['matric_no']}',
                                Icons.memory_rounded,
                                const Color(0xFF4ECDC4),
                                '${student[0]['fullname']}',
                              );
                            },
                          ).toList(),
                          // children: [
                          //   _buildCategoryCard(
                          //     context,
                          //     'COSC301',
                          //     Icons.data_array_rounded,
                          //     const Color(0xFFFF6868),
                          //     'Data Structures',
                          //   ),
                          //   _buildCategoryCard(
                          //     context,
                          //     'COSC303',
                          //     Icons.memory_rounded,
                          //     const Color(0xFF4ECDC4),
                          //     'Computer Architecture',
                          //   ),
                          //   _buildCategoryCard(
                          //     context,
                          //     'COSC305',
                          //     Icons.system_security_update,
                          //     const Color(0xFFFFBE08),
                          //     'Systems Analysis',
                          //   ),
                          //   _buildCategoryCard(
                          //     context,
                          //     'COSC307',
                          //     Icons.network_check_rounded,
                          //     const Color(0xFF3D6868),
                          //     'Web Application',
                          //   ),
                          //   _buildCategoryCard(
                          //     context,
                          //     'COSC309',
                          //     Icons.dashboard_customize_rounded,
                          //     const Color(0xFFFF6868),
                          //     'Database Management',
                          //   ),
                          //   _buildCategoryCard(
                          //     context,
                          //     'COSC311',
                          //     Icons.code_off_rounded,
                          //     const Color(0xFF4ECDC4),
                          //     'Org. of Programming',
                          //   ),
                          //   _buildCategoryCard(
                          //     context,
                          //     'MATH311',
                          //     Icons.model_training_outlined,
                          //     const Color(0xFF4ECDC4),
                          //     'Mathematical Modeling',
                          //   ),
                          //   _buildCategoryCard(
                          //     context,
                          //     'GENS301',
                          //     Icons.data_array_rounded,
                          //     const Color(0xFFFF6868),
                          //     'Business Growth',
                          //   ),
                          // ],
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
