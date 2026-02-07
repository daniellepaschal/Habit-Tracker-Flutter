import 'package:flutter/material.dart';

void main() {
  runApp(const HabitApp());
}

class HabitApp extends StatelessWidget {
  const HabitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HabitPage(),
    );
  }
}

class HabitPage extends StatefulWidget {
  const HabitPage({super.key});

  @override
  State<HabitPage> createState() => _HabitPageState();
}

class _HabitPageState extends State<HabitPage> {
  List<String> habits = ['Pray', 'Workout', 'Read', 'Code'];
  List<bool> completed = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Habit Tracker'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: habits.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              habits[index],
              style: TextStyle(
                fontSize: 18,
                decoration: completed[index]
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            trailing: Icon(
              completed[index]
                  ? Icons.check_circle
                  : Icons.circle_outlined,
              color: completed[index] ? Colors.green : Colors.grey,
            ),
            onTap: () {
              setState(() {
                completed[index] = !completed[index];
              });
            },
          );
        },
      ),
    );
  }
}

