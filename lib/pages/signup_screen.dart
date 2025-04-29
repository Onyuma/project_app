import 'dart:typed_data';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:project_app/model/biodata.dart';
import '../resources/textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  Uint8List? image;
  final bool _isLoading = false;

  String genderOption = Biodata.genderList[0];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _surnameController.dispose();
    _firstController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
  }

  String generateUsername() {
    int autoNumber = Random().nextInt(999) + 1000;
    return 'U21CS$autoNumber';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: (MediaQuery.of(context).size.width > 730)
              ? EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 3)
              : const EdgeInsets.symmetric(horizontal: 32),
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFieldWidget(
                    textEditingController: _surnameController,
                    hintText: 'Surname',
                    textInputType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFieldWidget(
                    textEditingController: _firstController,
                    hintText: 'First Name',
                    textInputType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFieldWidget(
                    textEditingController: _emailController,
                    hintText: 'Email Address',
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFieldWidget(
                    textEditingController: _phoneController,
                    hintText: 'Phone Number',
                    textInputType: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  DropdownButton(
                    value: genderOption,
                    items: Biodata.genderList.map(
                      (e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      setState(() {
                        genderOption = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_emailController.text.isNotEmpty &&
                          _firstController.text.isNotEmpty &&
                          _surnameController.text.isNotEmpty &&
                          _phoneController.text.isNotEmpty) {
                        Map<String, dynamic> userData = {
                          'firstName': _firstController.text,
                          'lastName': _surnameController.text,
                          'emailAddress': _emailController.text,
                          'phoneNumber': _phoneController.text,
                          'gender': genderOption,
                          'userName': generateUsername(),
                        };

                        // Biodata bd = Biodata.fromUser(userData);
                        // Sqldbprovider.addItem(bd);

                        print('$userData');
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                          color: Colors.blue),
                      child: (_isLoading)
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text('Create an Account'),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
