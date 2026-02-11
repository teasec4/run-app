import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeState(),
      child: Consumer<HomeState>(
        builder: (context, state, _) {
          return Scaffold(
            body: Center(
              child: Text(
                'Home',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          );
        },
      ),
    );
  }
}
