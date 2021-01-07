class TodoItemModel {
  final int id;
  final String title;
  final String description;
  final bool done;
  final bool removed;

  TodoItemModel(this.id, this.title, this.description, this.done, this.removed);

  Map<String, dynamic> getValue() {
    return {
      'title': this.title,
      'description': this.description,
      'done': this.done ? 1 : 0,
      'removed': this.removed ? 1 : 0,
    };
  }
}
