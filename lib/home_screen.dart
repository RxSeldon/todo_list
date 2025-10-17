import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Task> _tasks = [];

  Future<void> _navigateToAddTask() async {
    final newTask = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddTaskScreen()),
    );

    if (newTask != null && newTask is Task) {
      setState(() {
        _tasks.add(newTask);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          title: const Text('My To-Do List'),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 185, 220, 225),
                  Color.fromARGB(255, 72, 127, 209),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          elevation: 8,
          shadowColor: Colors.black26,
        ),
      ),
      body: _tasks.isEmpty
          ? const Center(
              child: Text(
                'No tasks yet!',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return ListTile(
                  leading: const Icon(Icons.check_box_outline_blank),
                  title: Text(task.title),
                  subtitle: Text(task.description ?? 'No description'),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
