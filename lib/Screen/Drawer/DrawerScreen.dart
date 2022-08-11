import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:primal_fm/Screen/About_us/About_us_screen.dart';
import 'package:primal_fm/Screen/Home/HomeScreen.dart';
import 'package:primal_fm/Screen/Policy/PolicyScreen.dart';
import 'package:primal_fm/Screen/Popup/PopupScreen.dart';
import 'package:primal_fm/Screen/webviewChat.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class DrawerScreenPage extends StatefulWidget {
  const DrawerScreenPage({Key? key}) : super(key: key);

  @override
  _DrawerScreenPageState createState() => _DrawerScreenPageState();
}

class _DrawerScreenPageState extends State<DrawerScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.69,
        decoration: BoxDecoration(
          color: Color(0xff202020),
          borderRadius: BorderRadius.only(
            topLeft: Radius.zero,
            bottomRight: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        child:Padding(
          padding: const EdgeInsets.only(left: 20.0,top: 40),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage('assets/images/logo.png'),
                    height: 60,
                    width: 120,
                  ),
                ],
              ),
              SizedBox(
                height:MediaQuery.of(context).size.height*0.03,
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeScreenPage()));
                },
                child:Row(children: [Icon(
                  Icons.home,
                  color: Colors.white,
                ), Text(
                  '  Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),],)
              ),
              SizedBox(
                height:MediaQuery.of(context).size.height*0.02,
              ),
              Row(children: [
                Icon(
                  Icons.screen_search_desktop,
                  color: Colors.white,
                ),
                Text(
                  '  Shop',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),],), SizedBox(
                height:MediaQuery.of(context).size.height*0.02,
              ),
              InkWell(
                onTap: (){
                  launchUrl(Uri.parse('https://primal.fm/'));
                },
                child:Row(children: [ Icon(
                  Icons.ac_unit_outlined,
                  color: Colors.white,
                ),Text(
                  '  Website',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),],)
              ), SizedBox(
                height:MediaQuery.of(context).size.height*0.02,
              ),
              InkWell(
                onTap: (){
                  launchUrl(Uri.parse('https://www.facebook.com/fmprimal'));
                },
                child: Row(children: [
                  Icon(
                    Icons.facebook,
                    color: Colors.white,
                  ),
                   Text(
                    '  Facebook',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ]),
              ), SizedBox(
                height:MediaQuery.of(context).size.height*0.02,
              ),
              InkWell(
                onTap: (){
                  launchUrl(Uri.parse('https://www.instagram.com/primal.fm/'));
                },
                child: Row(children: [
                  Icon(
                    FontAwesomeIcons.instagram,
                    color: Colors.white,
                  ),
                  Text(
                    '  Instagram',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ]),
              ), SizedBox(
                height:MediaQuery.of(context).size.height*0.02,
              ),
              InkWell(
                onTap: (){
                  launchUrl(Uri.parse('https://chat.primal.fm/'));
                },
                child: Row(children: [
                 Icon(
                    CupertinoIcons.chat_bubble_text,
                    color: Colors.white,
                  ),Text(
                    '  Chat',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ]),
              ), SizedBox(
                height:MediaQuery.of(context).size.height*0.02,
              ),
              InkWell(
                onTap: (){
                  launchUrl(Uri.parse('https://primal.fm/grussbox/frame.html'));
                },
                child:Row(children: [
                   Icon(
                    Icons.person,
                    color: Colors.white,
                  ),Text(
                    '  Wish/\n  Greeting box',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ]),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.32,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap:(){
                            showDialog(context: context, builder: (context){
                              return Dialog(
                                backgroundColor: Colors.black,
                                  child: AboutUsScreenPage());
                            });
                          },
                          child: Text(
                            'About Us',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PolicyScreenPage()));
                          },
                          child: Text(
                            'Privacy Policy',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
       );
  }
}
