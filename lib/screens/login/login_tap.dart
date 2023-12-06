import 'package:daily_tasks5/layout/homeLayout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginTab extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
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
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }

                final bool emailValid =
                RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[com]+")
                    .hasMatch(value);

                if (!emailValid) {
                  return "email or password went wrong";
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
                  return "email or password went wrong";
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if(formKey.currentState!.validate()){
                  Navigator.pushNamedAndRemoveUntil(context, HomeLayout.routeName, (route) => false
                  );
                }



              },
              child: Text('Login',
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