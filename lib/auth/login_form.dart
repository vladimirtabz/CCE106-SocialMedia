import 'package:flutter/material.dart';
import 'package:flutter_socmed/views/social_media.dart';

class LoginForm extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late String errorMessage = '';
  late bool isError = false;

  @override
  void initState() {
    errorMessage = 'This is an error message';
    isError = false;
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool checkLogin(String username, String password) {
    var valid = true;

    if (username.trim().isEmpty) {
      errorMessage = 'Username cannot be empty';
      valid = false;
    } else if (password.isEmpty) {
      errorMessage = 'Password cannot be empty';
      valid = false;
    } else {
      errorMessage = '';
    }

    setState(() {
      isError = !valid;
    });

    return valid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo.png', height: 48, width: 48),

                  const SizedBox(width: 12),

                  Text('Lichess', style: txtstyle),
                ],
              ),

              const SizedBox(height: 15),

              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Enter Username',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Enter Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.password),
                ),
              ),

              const SizedBox(height: 15),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  if (checkLogin(
                    usernameController.text,
                    passwordController.text,
                  )) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SocialMedia(),
                      ),
                    );
                  }
                },
                child: Text('LOGIN', style: txtstyle2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

var txtstyle = const TextStyle(
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontSize: 14,
);

var registertxtstyle = const TextStyle(
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontSize: 14,
);

var errortxtstyle = const TextStyle(
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontSize: 14,
  color: Colors.red,
);

var txtstyle2 = const TextStyle(
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontSize: 14,
  color: Colors.white,
);
