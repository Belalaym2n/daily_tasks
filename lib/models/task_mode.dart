class TaskModel {
  String tittle;
  String description;
  String id;
  bool isDone;
  int date;

  TaskModel(
      {required this.tittle,
        required this.description,
        this.id = '',
        this.isDone = false,
        required this.date});

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
    description: json['description'],
    tittle: json['tittle'],
    date: json['date'],
    id: json['id'],
    isDone: json['isDone'],
  );

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'tittle': tittle,
      'date': date,
      'id': id,
      'isDone': isDone,
    };
  }
}