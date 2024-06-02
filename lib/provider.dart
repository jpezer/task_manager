import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/features/bloc/bloc/task_bloc.dart';
import 'package:task_manager_app/features/domain/repositories/tasks_get_data.dart';

class ProviderBloc extends StatelessWidget {
  const ProviderBloc({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TaskBloc(firebaseInterface: FirebaseData()),
        ),
      ],
      child: child,
    );
  }
}
