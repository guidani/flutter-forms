import 'package:flutter/material.dart';

class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({Key? key}) : super(key: key);

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  bool _telemetryCheckbox = false;
  bool _promotionCheckbox = false;
  bool _serviceTermsCheckbox = false;
  dynamic _acceptAllTerms = false;

  dynamic changeBoxState() {
    if (_telemetryCheckbox == true ||
        _promotionCheckbox == true ||
        _serviceTermsCheckbox) {
      if (_telemetryCheckbox == true &&
          _promotionCheckbox == true &&
          _serviceTermsCheckbox) {
        return true; // should set to true if tristate is true
      }
      return null; // should set to null if tristate is true
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          title: const Text(
              'Aceito compartilhar dados para melhoria do aplicativo.'),
          value: _telemetryCheckbox,
          onChanged: (bool? value) {
            setState(() {
              _telemetryCheckbox = value!;
              changeBoxState();
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Aceito receber comunicação sobre promoções.”'),
          value: _promotionCheckbox,
          onChanged: (bool? value) {
            setState(() {
              _promotionCheckbox = value!;
              changeBoxState();
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Aceito os termos de serviço.'),
          value: _serviceTermsCheckbox,
          onChanged: (bool? value) {
            setState(() {
              _serviceTermsCheckbox = value!;
              changeBoxState();
            });
          },
        ),
        CheckboxListTile(
          tristate: true,
          title: const Text('Aceitar todos os items acima.'),
          value: changeBoxState(),
          onChanged: (value) {
            setState(() {
              _acceptAllTerms = value;
              _serviceTermsCheckbox = value ?? false;
              _promotionCheckbox = value ?? false;
              _telemetryCheckbox = value ?? false;
            });
          },
        ),
      ],
    );
  }
}
