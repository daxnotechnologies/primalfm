import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Drawer/DrawerScreen.dart';

class PolicyScreenPage extends StatefulWidget {
  const PolicyScreenPage({Key? key}) : super(key: key);

  @override
  State<PolicyScreenPage> createState() => _PolicyScreenPageState();
}

class _PolicyScreenPageState extends State<PolicyScreenPage> {
  GlobalKey<ScaffoldState> scaffoldKey=new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer:DrawerScreenPage(),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 20),
                      child: IconButton(
                        onPressed: () {
                          scaffoldKey.currentState!.openDrawer();
                        },
                        icon: Icon(
                          Icons.menu_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 20),
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 27,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
                  child: Column(
                    children: [
                      Text(
                        'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit, sed do\neiusmod tempor incididunt ut\nlabore et dolore magna aliqua. Ut \nenim ad minim veniam, quis\nnostrud exercitation ullamco\nlaboris nisi ut aliquip ex ea\ncommodo consequat. Duis aute\nirure dolor in reprehenderit in\nvoluptate velit esse cillum dolore \neu fugiat nulla pariatur. Excepteur \nsint occaecat cupidatat non \nproident, sunt in culpa qui officia \ndeserunt mollit anim id est \nlaborum. Lorem ipsum dolor sit\namet, consectetur adipiscing elit, \nsed do eiusmod tempor incididunt\nut labore et dolore magna aliqua.\nUt enim ad minim veniam, quis\nnostrud exercitation ullamco\nlaboris nisi ut aliquip ex ea \ncommodo consequat. Duis aute \nirure dolor in reprehenderit in \nvoluptate velit esse cillum dolore \neu fugiat nulla pariaturmollit anim\nid est laborum.',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 19,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
