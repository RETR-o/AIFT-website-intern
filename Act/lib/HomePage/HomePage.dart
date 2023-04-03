import 'package:act/HomePage/AdmissionPage.dart';
import 'package:act/HomePage/GalleryPage.dart';
import 'package:act/HomePage/scroll.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'Courses.dart';
import 'NavBarButton.dart';
import 'Contact.dart';

double collapsableHeight = 0.0;
Color selected = const Color(0xffffeb3b);
Color notSelected = const Color(0xfffffde7);

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double collapsableHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Size ss = MediaQuery.of(context).size;
    final contactKey = GlobalKey();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 2500,
            width: ss.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          SingleChildScrollView(
            child: Column(
              children: [


                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 250),
                  child: const AutoSizeText(
                    "Welcome to AIFT",
                    minFontSize: 40,
                    maxFontSize: 70,
                    style: TextStyle(fontSize: 70),
                    maxLines: 1,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding:
                  const EdgeInsets.only(top: 50, left: 20, bottom: 50),
                  child: const AutoSizeText(
                    "Active Institute of Fashion Technology",
                    style: TextStyle(fontSize: 70),
                    maxLines: 5,
                  ),
                ),



                    Container(
                      padding: const EdgeInsets.only(top: 100),
                      child: const Courses(),
                    ),

                    Container(
                       width: ss.width,
                        padding: const EdgeInsets.only(top: 100),
                        child: const GalleryPage(),
                      ),
                    Container(

                      padding: const EdgeInsets.only(top: 100),
                      child:  AdmissionPage(),
                    ),

                    Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.only(top: 100),
                      child: Contact(key: contactKey), ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.only(top: 100),
                      child: const Footer() ),

              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80.0,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    padding: EdgeInsets.only(left: 30.0),
                    iconSize: 100.0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    },
                    icon: Image.asset('assets/logo.png'),
                  ),
                  if (width < 800.0)
                    NavBarButton(
                      onPressed: () {
                        if (collapsableHeight == 0.0) {
                          setState(() {
                            collapsableHeight = 240.0;
                          });
                        } else if (collapsableHeight == 240.0) {
                          setState(() {
                            collapsableHeight = 0.0;
                          });
                        }
                      },
                    ),
                  if (width >= 800.0)
                    Row(
                      children: navBarItems,
                    ),
                ],
              ),
            ),
          ),
        Positioned(
         child: AnimatedContainer(
            margin: EdgeInsets.only(top: 79.0),
            duration: Duration(milliseconds: 375),
            curve: Curves.ease,
            height: (width < 800.0) ? collapsableHeight : 0.0,
            width: double.infinity,
            color: Color(0xff121212),
            child: SingleChildScrollView(
              child: Column(
                children: navBarItems,
              ),
            ),
          ),),
        ],
      ),
    );
  }
}
