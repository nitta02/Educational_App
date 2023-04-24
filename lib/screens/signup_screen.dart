// ignore_for_file: prefer_const_constructors, unused_field

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  String _selectedRole = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 80,
            ),
            Text(
              'Sign Up',
              style: boldStyle,
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_2_sharp),
                  hintText: 'Name',
                  hintStyle: regularStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: 'E-mail',
                  hintStyle: regularStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  hintText: 'Password',
                  hintStyle: regularStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: confirmPasswordController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  hintText: 'Confirm Password',
                  hintStyle: regularStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 25,
            ),
            MaterialButton(
              color: Colors.red,
              minWidth: double.infinity,
              onPressed: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString('name', nameController.text.toString());
                sp.setString('email', emailController.text.toString());
                sp.setString('password', passwordController.text.toString());
                sp.setString('confirmPassowrd',
                    confirmPasswordController.text.toString());
              },
              child: Text(
                'Sign Up',
                style: boldStyle,
              ),
            )
          ],
        )),
      ),
    );
  }
}
