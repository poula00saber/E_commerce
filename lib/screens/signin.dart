import 'package:flutter/material.dart';
import 'homescreen.dart';

import 'homescreen.dart';

class signin extends StatelessWidget {
  signin({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Column(
            children: [
              const Image(
                image: AssetImage("assets/icon/icons8-buy-64 (1).png"),
                height: 300,
                width: 400,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey, // Assign the key to the Form widget
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your username';
                                }
                                return null;
                              },
                              cursorColor: Colors.black,
                              style: const TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 2.0),
                                ),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                labelText: "Frist Name",
                                prefixIcon: const Icon(Icons.person),
                                iconColor: Colors.black,
                                fillColor: Colors.deepOrangeAccent,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10), // المسافة بين الـ TextFormFields
                          Expanded(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your Email';
                                }
                                return null;
                              },
                              cursorColor: Colors.black,
                              style: const TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 2.0),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                labelText: "Last Name",
                                prefixIcon: const Icon(Icons.person),
                                iconColor: Colors.black,
                                fillColor: Colors.deepOrangeAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 35),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Email';
                          }
                          if (!value.contains('@')) {
                            return 'Please enter a valid email address with an @ symbol';
                          }
                          return null;
                        },
                        cursorColor: Colors.black,
                        style: const TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 2.0),
                          ),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: "Email",
                          prefixIcon: const Icon(Icons.email),
                          iconColor: Colors.black,
                          fillColor: Colors.deepOrangeAccent,
                        ),
                      ),
                      SizedBox(height: 30,),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Password';
                          }
                          return null;
                        },
                        cursorColor: Colors.black,
                        style: const TextStyle(fontSize: 20),
                        obscureText: true,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 2.0),
                          ),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: "Password",
                          prefixIcon: const Icon(Icons.password),
                          iconColor: Colors.black,
                          fillColor: Colors.deepOrangeAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 70),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Homepage(),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent, // Background color
                  foregroundColor: Colors.black, // Text color
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25, vertical: 10),
                ),
                child: const Text(
                  "Sign In",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

