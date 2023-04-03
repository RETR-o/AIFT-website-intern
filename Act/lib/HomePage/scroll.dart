import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[900],
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Active Institute of Fashion Technology',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'B3, Gomathy Star city, Noothencheri, Madambakkam ',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 5),
          const Text(
            'Chennai, Tamil Nadu 600126',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 5),
          const Text(
            'Phone: 1234567890',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 5),
          const Text(
            'Email: AIFT@gmail.com',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Text(
                'Follow us:',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {},
                icon: const Icon(FlutterIcons.logo_facebook_ion, color: Colors.white),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(FlutterIcons.instagram_ant, color: Colors.white),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(FlutterIcons.twitter_ant, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Website made by Raghul and Prakash',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

