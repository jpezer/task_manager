import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/features/bloc/bloc/task_bloc.dart';
import 'package:task_manager_app/features/domain/enums/task_status.dart';
import 'package:task_manager_app/features/presentation/task.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({super.key});

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  @override
  void initState() {
    context.read<TaskBloc>().add(LoadDataEvent());
    super.initState();
  }

  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state.status == TaskStateStatus.initial ||
            state.status == TaskStateStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SizedBox(
          height: MediaQuery.of(context).size.height - 80,
          child: RefreshIndicator(
            onRefresh: () async {
              context.read<TaskBloc>().add(LoadDataEvent());
            },
            child: ListView.builder(
              itemCount: state.task?.length,
              itemBuilder: (BuildContext context, int index) {
                return Task(
                  title: state.task![index].title,
                  text: state.task![index].text,
                  id: state.task![index].id!,
                  isActive: state.task![index].isActive,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
