import 'dart:ui';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'onboarding1.dart';
class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.black ,
      ),
      backgroundColor: Colors.black,
      body: Center (

     child:Column(

      children: [
    Image.asset("assets/images/Online shopping-amico.png",
    )
        ,

    SizedBox(height:40),
    Container( height: 80,
    child : const Text("B E D For Buying !",
      style: TextStyle(fontWeight: FontWeight.bold , fontSize: 40,
        fontFamily:'EduVICWANTBeginner',
        color: Colors.deepOrange,

      ),
    ),
    ),
        Container(height: 50,
          child :
          const Text("Buying Everything Directly",
            style: TextStyle( fontSize: 24,
              fontFamily:'EduVICWANTBeginner',
              color: Colors.deepOrange,

            ),
          ),
        ),
        Container(
          child :
          const Text("All Product you need is here",
            style: TextStyle( fontSize: 19,
              fontFamily:'EduVICWANTBeginner',
              color: Colors.deepOrange,

            ),
          ),
        ),
      SizedBox(height:50),
    ElevatedButton(
    onPressed:() {  Navigator.push(context,
        MaterialPageRoute(builder: (context) => Onboarding(),),
    );
    },
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.deepOrangeAccent, // Background color
    foregroundColor: Colors.black, // Text color
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),),
    child: const Text("Get Started", style: TextStyle(fontSize: 25 ,fontWeight: FontWeight.bold),),
    ),
      ]
    ),
    )
    );
  }
}
