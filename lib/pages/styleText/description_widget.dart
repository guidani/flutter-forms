import 'package:flutter/material.dart';

class DescriptionWidget extends StatefulWidget {
  const DescriptionWidget({Key? key}) : super(key: key);

  @override
  State<DescriptionWidget> createState() => _DescriptionWidgetState();
}

class _DescriptionWidgetState extends State<DescriptionWidget> {
  TextEditingController _descriptionController = TextEditingController();
  List<bool> _selections = List.generate(3, (_) => false);

  bool isItalic = false;
  bool isBold = false;
  bool isUnderline = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _descriptionController,
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'Este campo precisa ser preenchido';
            }
            return null;
          },
          style: TextStyle(
            fontStyle: isItalic ? FontStyle.italic : null,
            fontWeight: isBold ? FontWeight.bold : null,
            decoration: isUnderline ? TextDecoration.underline : null,
          ),
          decoration: const InputDecoration(
            label: Text('Descrição'),
            hintText: 'Fale um pouco sobre você',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10.0),
        ToggleButtons(
          children: const [
            Icon(Icons.format_italic),
            Icon(Icons.format_bold),
            Icon(Icons.format_underline),
          ],
          isSelected: _selections,
          color: Colors.grey,
          selectedColor: Colors.black,
          onPressed: (int index) {
            setState(() {
              _selections[index] = !_selections[index];
              isBold = _selections[0];
              isItalic = _selections[1];
              isUnderline = _selections[2];
            });
          },
        ),
      ],
    );
  }
}
