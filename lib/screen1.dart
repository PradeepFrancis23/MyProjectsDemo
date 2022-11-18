import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen2.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final TextEditingController _usernamecontroller = TextEditingController();
  final RoundedLoadingButtonController buttoncontroller =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Login')),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10.0),
              child: const Text(
                'Bombay Times',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            // sign in heading
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10.0),
              child: const Text(
                'Sign In',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
              ),
            ),
            // username
            Container(
              alignment: Alignment.center,
              child: TextField(
                controller: _usernamecontroller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'User Name'),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            // password
            Container(
              alignment: Alignment.center,
              child: TextField(
                controller: _usernamecontroller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Password'),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              alignment: Alignment.center,
              child: TextField(
                controller: _usernamecontroller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Email'),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              alignment: Alignment.center,
              child: TextField(
                controller: _usernamecontroller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Mobile number'),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text(
                'Forgot Password',
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            RoundedLoadingButton(
                controller: buttoncontroller,
                onPressed: () {
                  // push to next screen
                  buttoncontroller.success();
                  // Navigator.push(context, MaterialApp.router())
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                  );
                  buttoncontroller.reset();
                },
                child: const Text('Sign In'))
          ],
        ),
      ),
    );
  }
}
