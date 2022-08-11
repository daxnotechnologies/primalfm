import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:primal_fm/Screen/Home/HomeScreen.dart';

class StartScreenpage extends StatefulWidget {
  const StartScreenpage({Key? key}) : super(key: key);

  @override
  State<StartScreenpage> createState() => _StartScreenpageState();
}

class _StartScreenpageState extends State<StartScreenpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Image(
                          image: AssetImage('assets/images/logo.png'),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80, left: 30),
                    child: Text(
                      'Let’s Get\nStarted',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 53,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.07,),
              Column(
                children: [
                  Text(
                    'Enjoy the Best Radio Station\nfrom your home. Don’t miss out\nanything.',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(
                      top: MediaQuery.of(context).size.height*0.2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreenPage()));
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.red.shade700,
                            ),
                            child: Center(
                              child: Text(
                                'Get Started',
                                style: GoogleFonts.arimaMadurai(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
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
      ),
    );
  }
}
