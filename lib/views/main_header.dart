import 'package:flutter/material.dart';
import '../model/user_data.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key, required this.userData});

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(userData.myUserAccount.img),
        ),
        Text(
          userData.myUserAccount.name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        Text(userData.myUserAccount.email),
        const SizedBox(height: 20),
      ]
    );
  }
}