import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeForm extends StatefulWidget {
  const HomeForm({super.key});

  @override
  State<HomeForm> createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  List users = [];
  String baseUrl = "http://localhost/";
//http://127.0.0.1/flutter_app/10.250.125.159
  Future<void> fetchUsers() async {
    final uri = Uri.parse("${baseUrl}flutter_app/get_user.php");
    final resp = await http.get(uri);
    if (resp.statusCode == 200) {
      setState(() {
        users = jsonDecode(resp.body);
      });
    } else {
      print('Failed to load users');
    }
  }

  Future<void> addUser() async {
    final url = Uri.parse(baseUrl);
    var response = await http.post(url, body: {
      'name': _firstNameController.text,
      'email': _passwordController.text,
      'password': _passwordController.text
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(data['message']),
      ));

      fetchUsers();
    } else {
      print('Unable to insert user');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
    //addUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert Users'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                label: Text('Enter first name'),
              ),
            ),
            TextField(
              controller: _emailAddressController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                label: Text('Enter email address'),
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                label: Text('Enter password'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: addUser,
              child: const Text('Add User'),
            ),
            Expanded(
                flex: 1,
                child: (users.isEmpty)
                    ? const Center(
                        child: Text('Empty User List'),
                      )
                    : ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(users[index]['name']),
                            subtitle: Text(users[index]['email']),
                          );
                        },
                      ))
          ],
        ),
      ),
    );
  }
}
