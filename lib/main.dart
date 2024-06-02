import 'package:flutter/material.dart';
import 'package:task_manager_app/features/presentation/home_screen.dart';
import 'package:task_manager_app/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderBloc(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          const HomeScreen().routeName: (context) => const HomeScreen(),
        },
        home: const HomeScreen(),
      ),
    );
  }
}
