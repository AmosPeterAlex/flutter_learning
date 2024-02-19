import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Email Validation Example'),
        ),
        body: EmailForm(),
      ),
    );
  }
}

class EmailForm extends StatefulWidget {
  @override
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Enter your email',
              ),
              validator: (String? value) {
                // Email validation regex pattern
                String emailPattern =
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                RegExp regex = RegExp(emailPattern);
                if (value == null || value.isEmpty) {
                  return 'Please enter an email address';
                }
                if (!regex.hasMatch(value)) {
                  return 'Enter a valid email address';
                }
                return null;
              },
              onSaved: (String? value) {
                _email = value ?? '';
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Process the email further, for example, submit it
                  // to a backend server or use it within your app.
                  print('Email submitted: $_email');
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
