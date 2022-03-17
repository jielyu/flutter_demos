import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBTestModel {
  int id;
  String name;
  int value;
  double num;
  DBTestModel(this.id, this.name, this.value, this.num);
  DBTestModel.fromjson(Map m)
      : id = m["id"],
        name = m["name"],
        value = m["value"],
        num = m["num"];

  @override
  String toString() {
    return "TestItem{id:$id, name:$name, value:$value, num:$num}";
  }
}

class SqflitePage extends StatefulWidget {
  const SqflitePage({Key? key}) : super(key: key);

  @override
  State<SqflitePage> createState() => _SqflitePageState();
}

class _SqflitePageState extends State<SqflitePage> {
  late Database db;
  List<DBTestModel> items = [];
  @override
  void initState() {
    super.initState();
    _openDatabase();
  }

  @override
  void dispose() {
    db.close();
    super.dispose();
  }

  Future<void> _openDatabase() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    print(path);

    // // Delete the database
    // await deleteDatabase(path);

    // open the database
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
    });
    await _loadItems();
    setState(() {});
  }

  Future<void> _insertItem() async {
    int id1 = await db.rawInsert(
        'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');
  }

  Future<void> _loadItems() async {
    List<Map> list = await db.rawQuery('SELECT * FROM Test');
    if (items.isNotEmpty) {
      items.clear();
    }
    for (var item in list) {
      items.add(DBTestModel.fromjson(item));
    }
  }

  Future<void> _cleanDatabase() async {
    var count = await db.rawDelete('DELETE FROM Test');
    print("delete $count items from db");
  }

  @override
  Widget build(BuildContext context) {
    print(items);
    return Scaffold(
      appBar: AppBar(
        title: const Text("sqflite"),
        actions: [
          IconButton(
              onPressed: () async {
                await _cleanDatabase();
                await _loadItems();
                setState(() {});
              },
              icon: const Icon(Icons.clear))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await _insertItem();
          await _loadItems();
          setState(() {});
        },
      ),
      body: Container(
        alignment: Alignment.center,
        child: items.isNotEmpty
            ? ListView.builder(
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("${item.id}"),
                      Text(item.name),
                      Text("${item.value}"),
                      TextButton(
                          onPressed: () async {
                            int count = await db.rawUpdate(
                                'UPDATE Test SET name = ?, value = ?, num = ? WHERE id = ?',
                                ['updated name', '100', '100', '${item.id}']);
                            _loadItems();
                            setState(() {});
                            print("update $count items");
                          },
                          child: Text("${item.num}"))
                    ],
                  );
                },
                itemCount: items.length,
              )
            : Container(
                alignment: Alignment.center,
                child: const Text("empty dataset"),
              ),
      ),
    );
  }
}
