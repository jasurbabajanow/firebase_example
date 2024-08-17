import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_example/firebase_service.dart';
import 'package:flutter/material.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('User name: ${user.displayName}'),
            Text('User email: ${user.email}'),
            Text('Email: is Verify: ${user.emailVerified}'),
            TextButton(
              onPressed: () {
                FirebaseService().onVerifyEmail();
              },
              child: const Text('Verify Email'),
            ),
            TextButton(
              onPressed: () {
                FirebaseService().logOut();
              },
              child: const Text('LogOut'),
            ),
          ],
        ),
      ),
    );
  }
}
