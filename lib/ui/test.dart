import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  TextEditingController _textController = TextEditingController();
  bool _isButtonEnabled = false;

  void _checkTextField() {
    setState(() {
      if (_textController.text.isNotEmpty) {
        _isButtonEnabled = true;
      } else {
        _isButtonEnabled = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textController,
              onChanged: (value) {
                _checkTextField(); // Cek TextField saat nilai berubah
              },
              decoration: InputDecoration(labelText: 'Input Text Here'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isButtonEnabled
                  ? () {
                      // Aksi saat tombol ditekan
                      print('Button Pressed');
                    }
                  : null, // Button dinonaktifkan jika _isButtonEnabled adalah false
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
