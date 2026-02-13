import 'package:flutter/material.dart';
import '../../features/runner_profile/presentation/runner_profile_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: .start,
          crossAxisAlignment: .start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: const RunnerProfileScreen(),
            ),
            Container(
              padding:const EdgeInsets.all(12) ,
              child: Text("IN PROGRESS"),
            )
            
          ],
        ),
      ),
    );
  }
}
