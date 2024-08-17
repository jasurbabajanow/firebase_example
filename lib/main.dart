import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_example/auth_screen.dart';
import 'package:firebase_example/firebase_options.dart';
import 'package:firebase_example/firebase_service.dart';
import 'package:firebase_example/user_info_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

final GlobalKey<NavigatorState> kNavigatorKey = GlobalKey<NavigatorState>();

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    FirebaseService().onListenUser((user) {
      if (user == null) {
        Navigator.push(
          kNavigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (_) => const AuthScreen(),
          ),
        );
      } else {
        Navigator.push(
          kNavigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (_) => UserInfoScreen(user: user),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: kNavigatorKey,
      debugShowCheckedModeBanner: false,
      home: const AuthScreen(),
    );
  }
}
