import 'package:flutter/material.dart';


class AddTaskScreen extends StatefulWidget{
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();

}

class _AddTaskScreenState extends State<AddTaskScreen>{
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();


  @override
}