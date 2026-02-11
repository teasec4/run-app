import 'package:flutter/material.dart';
import '../../features/runner_profile/presentation/runner_profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 16),
              child: const RunnerProfileScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
