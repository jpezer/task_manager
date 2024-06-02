import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/features/bloc/bloc/task_bloc.dart';

class Task extends StatelessWidget {
  const Task({
    super.key,
    required this.title,
    required this.text,
    required this.id,
    required this.isActive,
  });

  final String title;
  final String text;
  final String id;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isActive ? Colors.grey.shade200 : Colors.grey.shade500,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 10),
            const Divider(thickness: 1, color: Colors.black),
            SizedBox(
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade700),
                    onPressed: () {
                      context.read<TaskBloc>().add(
                            UpdateDataEvent(
                              id: id,
                              title: title,
                              text: text,
                              isActive: isActive,
                            ),
                          );
                    },
                    child: isActive
                        ? const Text(
                            'Završeno',
                            style: TextStyle(color: Colors.white),
                          )
                        : const Text(
                            'Nije završeno',
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange.shade700),
                    onPressed: () {
                      context.read<TaskBloc>().add(DeleteTaskEvent(id: id));
                    },
                    child: const Text(
                      'Izbriši',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
