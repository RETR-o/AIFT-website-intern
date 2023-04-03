import 'package:act/HomePage/AdmissionPage.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

double collapsableHeight = 0.0;

class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {



  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    return Column(
        children: [

          Container(
            alignment: Alignment.center,
            child: const AutoSizeText(
              "Courses",
              minFontSize: 30,
              maxFontSize: 50,
              style: TextStyle(fontSize: 50),
              maxLines: 1,
            ),
          ),
          SizedBox(
            width: screenSize.width,
            height: 400,
              child: Padding(
              padding: EdgeInsets.only(top:25,left: 40,right: 40),

              child: Container(
              decoration: const BoxDecoration(
              image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: AssetImage('assets/courses.png'),),
              ),
              ),
          ),
      ),

             Container(
               padding: EdgeInsets.only(bottom: 200),
                child: IconButton(
                  iconSize: 200.0,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AdmissionPage()),
                    );
                  },
                  icon: Image.asset('assets/join.png'),
                ),
            ),


        ],
    );
  }
}
