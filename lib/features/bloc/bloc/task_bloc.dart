import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_manager_app/features/domain/enums/task_status.dart';
import 'package:task_manager_app/features/domain/models/task.dart';
import 'package:task_manager_app/features/domain/repositories/tasks_get_data.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  IFirebaseInterface firebaseInterface;
  TaskBloc({required this.firebaseInterface}) : super(TaskState(status: TaskStateStatus.initial)) {
    on<LoadDataEvent>(_loadData);
    on<AddNewTaskEvent>(_addTask);
    on<DeleteTaskEvent>(_deleteTask);
    on<UpdateDataEvent>(_updateTask);
  }

  Future _addTask(AddNewTaskEvent event, Emitter<TaskState> emit) async{
    bool success = await firebaseInterface.addNewTask(title: event.title, text: event.text);
    if (success) {
      add(LoadDataEvent());
    } else {
      emit(state.copyWith(status: TaskStateStatus.error));
    }
  }

  Future _loadData(LoadDataEvent event, Emitter<TaskState> emit) async{
    emit(state.copyWith(status: TaskStateStatus.loading));
    final data = await firebaseInterface.getdata();
    emit(state.copyWith(status: TaskStateStatus.loaded, task: data));
  }

  Future _deleteTask(DeleteTaskEvent event, Emitter<TaskState> emit)async {
    bool success = await firebaseInterface.deleteData(event.id);
    if (success) {
      add(LoadDataEvent());
    } else {
      emit(state.copyWith(status: TaskStateStatus.error));
    }
  }

  Future _updateTask(UpdateDataEvent event, Emitter<TaskState> emit)async {
    bool success = await firebaseInterface.updateTask(
      id: event.id,
      title: event.title,
      text: event.text,
      isActive: event.isActive,
    );
    if (success) {
      add(LoadDataEvent());
    } else {
      emit(state.copyWith(status: TaskStateStatus.error));
    }
  }
}


