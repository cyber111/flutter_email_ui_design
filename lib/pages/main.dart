import 'package:flutter/material.dart';
import 'package:flutter_email_ui_design/models/task.dart';
import 'package:flutter_email_ui_design/pages/task_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDoList',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'To Do List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int i = 0;
  final TextEditingController _controller = TextEditingController();
  String taskName = '';
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildToDoList(),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              openDialog(context, _controller);
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 5,
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                tasks.clear();
              });
            },
            tooltip: 'Clear',
            child: const Icon(Icons.block),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void openDialog(
      BuildContext context, TextEditingController? controller) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Enter the Title of the Task'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'title'),
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                setState(() {
                  if (_controller.text != '') {
                    tasks.add(Task(title: _controller.text, id: i++), );
                    Navigator.pop(context);
                  }
                });
              },
              child: const Text('Submit'),
            )
          ],
        );
      },
    );
  }

  Widget _buildToDoList() {
    return ListView(
      children: _buildListTasks(tasks),
    );
  }

  List<Widget> _buildListTasks(List<Task> tasks) {
    List<Widget> taskWidgets = [];
    for (var task in tasks) {
      taskWidgets.add(
        TaskCard(
          title: task.title,
          subTitle: 'Please touch to complete',
          isDone: task.isDone,
          onTap: () {
            setState(() {
              if(task.isDone == false) {
                task.isDone = true;
              } else {
                task.isDone = false;
              }
            });
          },
          deleteTask: () {
            setState(() => tasks.remove(task));
          },
        ),
      );
    }
    return taskWidgets;
  }
}
