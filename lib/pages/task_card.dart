import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.isDone,
    required this.onTap,
    required this.deleteTask,
  });

  final String title;
  final String subTitle;
  final bool? isDone;
  final void Function() onTap;
  final void Function() deleteTask;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 5),
      child: Card(
        surfaceTintColor: Colors.amberAccent,
        elevation: 5.0,
        child: ListTile(
          style: ListTileStyle.list,
          title: Text(
            title,
            style: TextStyle(
              decoration: isDone ?? false ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Text(subTitle),
          leading: const Icon(Icons.task),
          trailing: IconButton(onPressed: deleteTask, icon: const Icon(Icons.delete)),
          onTap: onTap,
          hoverColor: Colors.amber,
          enabled: true,
        ),
      ),
    );
  }
}
