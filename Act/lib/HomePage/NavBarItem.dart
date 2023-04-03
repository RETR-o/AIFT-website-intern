import 'package:act/HomePage/Courses.dart';
import 'package:act/HomePage/GalleryPage.dart';
import 'package:flutter/material.dart';
import 'AdmissionPage.dart';
import 'Contact.dart';
import 'HomePage.dart';
import 'NavBarButton.dart';

class NavBarItem extends StatefulWidget {
  final String text;

  NavBarItem({
    required this.text,
  });

  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  Color color = notSelected;
  final contactKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          color = selected;
        });
      },
      onExit: (value) {
        setState(() {
          color = notSelected;
        });
      },
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.white60,
          onTap: (){
            if (widget.text == 'Admission') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            } else if (widget.text == 'Gallery') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            } else if (widget.text == 'Contact us') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              ).then((_) {
                // Scroll to the bottom of the page
                Scrollable.ensureVisible(
                  contactKey.currentContext!.findRenderObject()! as BuildContext,
                  alignment: 1.0,
                  duration: Duration(milliseconds: 500),
                );
              });

            } else if (widget.text == 'Courses') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            }
          },

          child: Container(
            height: 60.0,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: 16.0,
                color: color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
