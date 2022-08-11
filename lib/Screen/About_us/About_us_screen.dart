import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsScreenPage extends StatefulWidget {
  const AboutUsScreenPage({Key? key}) : super(key: key);

  @override
  _AboutUsScreenPageState createState() => _AboutUsScreenPageState();
}

class _AboutUsScreenPageState extends State<AboutUsScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
          height:260,
          width: MediaQuery.of(context).size.width * 0.83,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 20),
                child: Text(
                  'Primal.FM',
                  style: TextStyle(
                    color: Color(0xffFF0000),
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 0),
                child: Text(
                  'Version 2.1.1',
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: Text(
                    'Join Our Facebook',
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  launchUrl(Uri.parse('https://www.facebook.com/fmprimal'));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 5),
                  child: Text(
                    'https://www.facebook.com/fmprimal',
                    style: TextStyle(
                      color: Colors.red.shade700,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 20),
                child: Text(
                  'Our Website',
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  launchUrl(Uri.parse('https://primal.fm/'));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 5),
                  child: Text(
                    'https://primal.fm/',
                    style: TextStyle(
                      color: Colors.red.shade700,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
