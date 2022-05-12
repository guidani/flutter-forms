import 'package:flutter/material.dart';
import 'package:forms/pages/styleText/style_text_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StyleTextPage()),
                );
              },
              child: Text('01'),
            )
          ],
        ),
      ),
    ));
  }
}
