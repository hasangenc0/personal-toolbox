final createTodoTable = """
CREATE TABLE TodoTable (
  id INTEGER PRIMARY KEY,
  title TEXT,
  description TEXT,
  done INTEGER,
  removed INTEGER,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
""";
