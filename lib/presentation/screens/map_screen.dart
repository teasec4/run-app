import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state/map_state.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MapState(),
      child: Consumer<MapState>(
        builder: (context, state, _) {
          return Scaffold(
            body: Center(
              child: Text(
                'Map',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          );
        },
      ),
    );
  }
}
