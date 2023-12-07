
import 'package:daily_tasks5/layout/homeLayout.dart';
import 'package:daily_tasks5/models/user_model.dart';
import 'package:daily_tasks5/screens/login/login_tap.dart';
import 'package:daily_tasks5/shared/network/firebase_managment/opperation_for_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpTab extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Name';
                }
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: ageController,
              decoration: const InputDecoration(labelText: 'age'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your age';
                }
                return null;
              },
            ),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                final bool emailValid =
                RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[com]+")
                    .hasMatch(value);

                if (!emailValid) {
                  return "something went wrong";
                }
                return null;
              },
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                RegExp regex =
                RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z]).{7,}$');
                if (!regex.hasMatch(value)){
                  return "something went wrong";
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

        ElevatedButton(
          onPressed: () {
            if(formKey.currentState!.validate()){
              UserModel user=UserModel(name: nameController.text,
                  age: ageController.text, email: emailController.text);
              OpperationalForUser.addUser(user);
Navigator.pushNamedAndRemoveUntil(context,
    HomeLayout.routeName, (route) => false);
            }

            },

          child: Text('SignUp',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 18)),
        ),

          ],
        ),
      ),
    );
  }
}