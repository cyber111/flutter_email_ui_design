class Task {
  Task({
    this.isDone = false,
    required this.title,
    required this.id,
  });

  int id;

  ///Title of the To do task
  String title;

  ///weather it is done or not
  bool? isDone;
}
