import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/screens/homescreen.dart';
import 'package:untitled/screens/signin.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Column(
            children: [
              Image(
                image: AssetImage("assets/icon/icons8-buy-64 (1).png" ),
                height: 200,
                width: 400,
              ),
              Padding(padding:EdgeInsets.symmetric(horizontal: 20),
              child:  TextFormField(
                validator: (value) {
                  if (value!.isEmpty)
                    return 'please enter your username';
                },
                cursorColor: Colors.black,
                style:TextStyle(fontSize: 20, ),
                decoration: InputDecoration(
               focusedBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(20),
                 borderSide: BorderSide(
                color: Colors.white,
                   width: 2.0
                   ),
               ),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText:"username",
                    prefixIcon: const Icon(Icons.person, ),
                    iconColor: Colors.black,
                    fillColor:Colors.deepOrangeAccent
                ),
              ),
              ),

              SizedBox(height: 35,),
    Padding(padding:EdgeInsets.symmetric(horizontal: 20),
             child:
              TextFormField(
                cursorColor: Colors.black,
                validator: (value) {
                  if (value!.isEmpty)
                    return 'please enter your Email';
                },

                style:TextStyle(fontSize: 20, ),
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.0
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText:"Email",
                  prefixIcon: const Icon(Icons.email),
                   iconColor: Colors.black,
                    fillColor:Colors.deepOrangeAccent,

                ),
              ),
    ),
              SizedBox(height: 35,),
    Padding(padding:EdgeInsets.symmetric(horizontal: 20),
              child:
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty)
                    return 'please enter your Password';
                },

                cursorColor: Colors.black,
                style:TextStyle(fontSize: 20, ),
                obscureText: true,
                decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                   borderSide: BorderSide(
                    color: Colors.white,
                    width: 2.0
                      ),
                ),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText:"Password",

                prefixIcon: const Icon(Icons.password) ,
                    iconColor: Colors.black,
                    fillColor:Colors.deepOrangeAccent
                ),
              )
              ),
              SizedBox(height: 70,),
              ElevatedButton(
                onPressed:() {  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Homepage(),),
                );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent, // Background color
                  foregroundColor: Colors.black, // Text color
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 13),),
                child: const Text("Login", style: TextStyle(fontSize: 25 ,fontWeight: FontWeight.bold),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account ? ",
                  style: TextStyle(
                    color:Colors.deepOrangeAccent,
                    fontSize: 19
                  ),
                  ),
                  ElevatedButton(
                    onPressed:() {  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => signin(),),
                    );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Background color
                      padding: EdgeInsets.symmetric(horizontal: 30),),
                    child: Text('sign in',
                     style: TextStyle(
                       color: Colors.white,
                         fontSize:19 ,
                       ),
                      )
                  ),
  ]
              )
            ],
          )
        ],
      ),
    );
  }
}
