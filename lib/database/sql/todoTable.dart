const TODO_LIST_TABLE_NAME = "TodoTable";
final createTodoTable = """
CREATE TABLE $TODO_LIST_TABLE_NAME (
  id INTEGER PRIMARY KEY,
  title TEXT,
  description TEXT,
  done INTEGER,
  removed INTEGER,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
""";
