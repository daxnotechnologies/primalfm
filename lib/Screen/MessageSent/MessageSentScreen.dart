import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MessageSentScreenPage extends StatefulWidget {
  const MessageSentScreenPage({Key? key}) : super(key: key);

  @override
  _MessageSentScreenPageState createState() => _MessageSentScreenPageState();
}

class _MessageSentScreenPageState extends State<MessageSentScreenPage> {
  @override
  Widget build(BuildContext context) {
    return  Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Image(
                height: 50,
                  width: 50,
                  image: AssetImage('assets/images/RedIcon.png'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Message Sent!',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                  color: Color(0xff000000),
                ),
              ),
            ],
          ),
    );
  }
}
