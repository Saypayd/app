import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login.dart';
import 'register.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Get.to(() => const LoginScreen()),
              child: const Text('Login'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Get.to(() => const RegisterScreen()),
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
