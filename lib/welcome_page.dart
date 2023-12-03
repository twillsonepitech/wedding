import 'package:flutter/material.dart';
import 'user_info_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
                  Colors.purple,
                  Colors.blue,
        ])),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Image.asset(
              'assets/wedding.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Book your Wedding',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UserInfoPage()));
            },
            child: Container(
              height: 53,
              width: 320,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white),
              ),
              child: const Center(
                child: Text(
                  'REGISTER',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
          ),
          const Spacer(),
        ]),
      ),
    );
  }
}
