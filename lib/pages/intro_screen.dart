import 'package:flutter/material.dart';
import 'package:project_app/model/matches.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<dynamic> res = [];
  void getResponse() async {
    Matches matches = Matches();
    res = await matches.getMatches();
    print(matches.res);
    if (res.isNotEmpty) {
      Navigator.popAndPushNamed(context, '/home', arguments: {'match': res[0]});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getResponse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/abu_bg.jpg'))),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color.fromARGB(211, 76, 175, 79),
            ),
          ),
          const SafeArea(
              child: Center(
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Center(
                    child: Text(
                      'U21CS',
                      style: TextStyle(
                          fontSize: 60,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Billabong'),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
