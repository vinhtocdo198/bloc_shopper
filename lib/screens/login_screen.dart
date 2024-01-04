import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Welcome',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 33.0,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Username'),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Password'),
                    obscureText: true,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),

          // Enter button
          SizedBox(
            height: 30.0,
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/shopping'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
              ),
              child: const Text(
                'ENTER',
                style: TextStyle(
                  color: Colors.brown,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
