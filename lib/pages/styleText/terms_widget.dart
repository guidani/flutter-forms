import 'package:flutter/material.dart';
import 'package:forms/pages/styleText/mock_text.dart';

class UserTermsWidget extends StatelessWidget {
  const UserTermsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
      ),
      child: const Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Text(
            loremText,
            overflow: TextOverflow.fade,
          ),
        ),
      ),
    );
  }
}
