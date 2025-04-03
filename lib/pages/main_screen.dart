import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(title: Text('TODO List'), centerTitle: true),
      body: Column(
        children: [
          Text('TODO List', style: TextStyle(color: Colors.white)),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/todo');
              // Navigator.pushNamed(context, '/todo');
              // Navigator.pushNamedAndRemoveUntil(context, '/todo', (route) => true);
            },
            child: Text('Перейти далее'),
          ),
        ],
      ),
    );
  }
}
