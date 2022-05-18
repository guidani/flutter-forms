import 'package:flutter/material.dart';

class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({Key? key}) : super(key: key);

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  bool? _promotionCheckbox = false;
  bool? _serviceTermsCheckbox = false;
  bool? _acceptAllTerms = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          title: const Text('Aceito receber comunicação sobre promoções.'),
          value: _promotionCheckbox,
          onChanged: (value) {
            setState(() {
              _promotionCheckbox = value!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Aceito os termos de serviço.'),
          value: _serviceTermsCheckbox,
          onChanged: (value) {
            setState(() {
              _serviceTermsCheckbox = value!;
            });
          },
        ),
        CheckboxListTile(
          tristate: true,
          title: const Text('Aceitar todos os items acima.'),
          value: _acceptAllTerms,
          onChanged: (value) {
            setState(() {
              _acceptAllTerms = value;
              _serviceTermsCheckbox = value;
              _promotionCheckbox = value;
            });
          },
        ),
      ],
    );
  }
}
