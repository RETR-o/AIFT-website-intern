import 'package:flutter/material.dart';

import 'NavBarItem.dart';
import 'HomePage.dart';

class NavBarButton extends StatefulWidget {
  final Function onPressed;

  NavBarButton({
    required this.onPressed,
  });

  @override
  _NavBarButtonState createState() => _NavBarButtonState();
}

class _NavBarButtonState extends State<NavBarButton> {
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      width: 60.0,


      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.white60,
          onTap: () {
            setState(() {
              widget.onPressed();
            });
          },
          child:const Padding(
            padding: EdgeInsets.only(top: 16.0),
          child: Icon(

            Icons.menu_sharp,
            size: 30.0,
            color: Color(0xcfffffff),
          ),),
        ),
      ),
    );
  }
}


List<Widget> navBarItems = [
  NavBarItem(
    text: 'Courses',

  ),
  NavBarItem(
    text: 'Admission',
  ),
  NavBarItem(
    text: 'Gallery',
  ),
  NavBarItem(
    text: 'Contact us',

  ),
];

