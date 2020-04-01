import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/pages/login/login.dart';
import 'package:providers/providers/firebaseAuthService.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<FirebaseAuthService>(
      create: (_) => FirebaseAuthService(),
      child: MaterialApp(
        title: 'Login',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: Login(),
      ),
    );
  }
}
