final createPhoneBookTable = """
CREATE TABLE PhoneBook (
  id INTEGER PRIMARY KEY,
  key TEXT,
  value TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
""";
