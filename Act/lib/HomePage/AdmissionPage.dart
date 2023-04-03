import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'HomePage.dart';
import 'NavBarButton.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:flutter/foundation.dart';

double collapsableHeight = 0.0;

class AdmissionPage extends StatefulWidget {
  const AdmissionPage({super.key});

  @override
  _AdmissionPageState createState() => _AdmissionPageState();
}

class _AdmissionPageState extends State<AdmissionPage> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final Size screenSize = MediaQuery.of(context).size;
    return Column(
        children: [

          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 40),
            child: const AutoSizeText(
              "Admission",
              minFontSize: 40,
              maxFontSize: 70,
              style: TextStyle(fontSize: 70),
              maxLines: 1,
            ),
          ),


          SizedBox(
            width: screenSize.width,
            height: screenSize.height,
            child: Padding(
              padding: EdgeInsets.only(left: 30,top: 50, bottom: 55, right:30),
              child: GoogleFormScreen(),
            ),),



    ],

    );
  }
}


class GoogleFormScreen extends StatelessWidget {
  final String formUrl = 'https://form.jotform.com/230766676330460';

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return HtmlWidget('''
        <html>
          <head>
            <meta http-equiv="Content-Security-Policy" content="default-src 'self'; script-src 'self' 'unsafe-inline' 'unsafe-eval'">
          </head>
          <body>
            <iframe src="https://form.jotform.com/230766676330460">Loading…</iframe>
          </body>
        </html>
      ''');
    } else {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: NotificationListener<ScrollUpdateNotification>(
          onNotification: (notification) {
            // Prevent the web view from scrolling
            return true;
          },
          child: InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(formUrl)),
          ),
        ),
      );
    }
  }
}













