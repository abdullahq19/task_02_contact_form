import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_02_contact_form/summary.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  late final TextEditingController _nameController,
      _emailController,
      _messageController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _messageController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submit() {
    Map<String, String> contact = {
      'name':
          _nameController.text.isEmpty ? 'Empty' : _nameController.text.trim(),
      'email': _emailController.text.isEmpty
          ? 'Empty'
          : _emailController.text.trim(),
      'message': _messageController.text.isEmpty
          ? 'Empty'
          : _messageController.text.trim()
    };
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const SummaryPage(),
        settings: RouteSettings(arguments: contact)));
    _nameController.clear();
    _emailController.clear();
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Form Page'),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: width * 0.9,
              child: TextFormField(
                controller: _nameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none),
                    filled: true,
                    hintText: 'Enter a name',
                    hintStyle: TextStyle(color: Colors.grey.shade500),
                    fillColor: Colors.grey.shade200,
                    prefixIcon: const Icon(Icons.person)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: width * 0.9,
              child: TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none),
                    filled: true,
                    hintText: 'Enter email address',
                    hintStyle: TextStyle(color: Colors.grey.shade500),
                    fillColor: Colors.grey.shade200,
                    prefixIcon: const Icon(Icons.email)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: width * 0.9,
              child: TextFormField(
                controller: _messageController,
                maxLines: 4,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                  filled: true,
                  hintText: 'Write a message...',
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                  fillColor: Colors.grey.shade200,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
                width: width * 0.9,
                child: CupertinoButton(
                  onPressed: _submit,
                  color: Colors.blue.shade50,
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.blue),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
