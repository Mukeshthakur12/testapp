
import 'package:flutter/material.dart';

class SelectedDataScreen extends StatelessWidget {
  final List<String> selectedButtons;

  SelectedDataScreen({required this.selectedButtons});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Buttons'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selected Buttons:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              itemCount: selectedButtons.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(selectedButtons[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}