import 'package:flutter/material.dart';

enum PersonGender { masculino, feminino, outro }

class RadioBoxesWidget extends StatefulWidget {
  const RadioBoxesWidget({Key? key}) : super(key: key);

  @override
  State<RadioBoxesWidget> createState() => _RadioBoxesWidgetState();
}

class _RadioBoxesWidgetState extends State<RadioBoxesWidget> {
  PersonGender? _personGender = PersonGender.masculino;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('Masculino'),
          leading: Radio<PersonGender>(
            value: PersonGender.masculino,
            groupValue: _personGender,
            onChanged: (PersonGender? value) {
              setState(() {
                _personGender = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Feminino'),
          leading: Radio<PersonGender>(
            value: PersonGender.feminino,
            groupValue: _personGender,
            onChanged: (PersonGender? value) {
              setState(() {
                _personGender = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Outro'),
          leading: Radio<PersonGender>(
            value: PersonGender.outro,
            groupValue: _personGender,
            onChanged: (PersonGender? value) {
              setState(() {
                _personGender = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
