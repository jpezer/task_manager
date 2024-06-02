import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/features/bloc/bloc/task_bloc.dart';

void AddNewTaskBox(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.75,
        padding: const EdgeInsets.all(20),
        child: const TaskForm(),
      );
    },
  );
}

class TaskForm extends StatefulWidget {
  const TaskForm({super.key});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();

  String _titleValue = '';
  String _textValue = '';

  void _saveData(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context
          .read<TaskBloc>()
          .add(AddNewTaskEvent(title: _titleValue, text: _textValue));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Unesite naslov',
              ),
              validator: (value) {
                if (value == null || value.length <= 3) {
                  return 'Unesite valjan naslov';
                }
              },
              onChanged: (value) {
                setState(() {
                  _titleValue = value;
                });
              },
            ),
            TextFormField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Unesite opis zadatka',
              ),
              validator: (value) {
                if (value == null || value.length <= 10) {
                  return 'Unesite vise detalja';
                }
              },
              onChanged: (value) {
                setState(() {
                  _textValue = value;
                });
              },
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.green),
              ),
              onPressed: () {
                _textValue.length < 300 ? _saveData(context) : null;
              },
              child: const Text(
                'Dodaj zadatak',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ));
  }
}
