import 'package:flutter/material.dart';
import 'package:forms/pages/styleText/style_text_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: Expanded(
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
                child: Text('01 - Editar formulários'),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
