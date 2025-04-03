import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _userData;

  List todoList = [];

  @override
  void initState() {
    super.initState();

    todoList.addAll([
      'Buy groceries',
      'Walk the dog',
      'Read a book',
      'Finish homework',
    ]);
  }

  void _menuOpen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(title: Text('Menu')),
            body: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/',
                      (route) => false,
                    );
                  },
                  child: Text('На главную'),
                ),
                Padding(padding: EdgeInsets.only(left: 15)),
                Text('Наше простое меню'),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('TODO List'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: _menuOpen, icon: Icon(Icons.menu_outlined)),
        ],
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(todoList[index]),
            onDismissed: (direction) {
              setState(() {
                todoList.removeAt(index);
              });
            },
            child: Card(
              child: ListTile(
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      todoList.removeAt(index);
                    });
                  },
                  icon: Icon(
                    Icons.delete_sweep,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
                title: Text(todoList[index]),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Add a new TODO'),
                content: TextField(
                  onChanged: (value) {
                    _userData = value;
                  },
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        todoList.add(_userData);
                      });
                      Navigator.pop(context);
                    },
                    child: Text('Добавить'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add_box, color: Colors.white, size: 30.0),
      ),
    );
  }
}
