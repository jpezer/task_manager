import 'package:flutter/material.dart';
import 'package:task_manager_app/features/presentation/add_new_task_box.dart';
import 'package:task_manager_app/features/presentation/all_tasks.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  final String routeName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Task Manager',
            style: TextStyle(color: Colors.black87),
          ),
        ),
        shadowColor: Colors.black54,
      ),
      body: const Column(
        children: [
          AllTasks(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          AddNewTaskBox(context);
        },
      ),
    );
  }
}
