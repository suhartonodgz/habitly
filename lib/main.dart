import 'package:flutter/material.dart';
import 'package:habitly/screen/onboarding_screen.dart'; // Trailing space di import path 'package:habitly/screen/onboarding_screen.dart{?}' – ini bisa menyebabkan build error! ❌
import 'package:habitly/screen/register_screen.dart';
import 'package:habitly/screen/sign_screen.dart';
import 'package:habitly/screen/dashboard_a_screen.dart';
import 'package:habitly/screen/dashboard_b_screen.dart';
import 'package:habitly/screen/dashboard_c_screen.dart';
import 'package:habitly/screen/dashboard_d_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const OnboardingScreen(),
      routes: {
        '/sign_screen': (context) => const SignScreen(),
        '/register_screen': (context) => const RegisterScreen(),
        '/dashboard_a_screen': (context) => const DashboardAScreen(),
        '/dashboard_b_screen': (context) => const DashboardBScreen(),
        '/dashboard_c_screen': (context) => const DashboardCScreen(),
        '/dashboard_d_screen': (context) => const DashboardDScreen(),
      },
    );
  }
}
