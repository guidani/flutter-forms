import 'package:flutter/material.dart';
import 'package:forms/pages/styleText/description_widget.dart';
import 'package:forms/pages/styleText/mock_text.dart';
import 'package:forms/pages/styleText/my_date_picker.dart';
import 'package:forms/pages/styleText/radio_boxes_widget.dart';
import 'package:forms/pages/styleText/terms_widget.dart';

class StyleTextPage extends StatefulWidget {
  const StyleTextPage({Key? key}) : super(key: key);

  @override
  State<StyleTextPage> createState() => _StyleTextPageState();
}

class _StyleTextPageState extends State<StyleTextPage> {
  final _formKey = GlobalKey<FormState>();
  late FocusNode myFocusNode;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();

  bool _telemetryCheckbox = false;
  bool _promotionCheckbox = false;
  bool _serviceTermsCheckbox = false;
  bool _acceptAllTerms = false;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    myFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Toggle text style"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    'Cadastro',
                    style: TextStyle(fontSize: 30),
                  ),
                  const Divider(),
                  TextFormField(
                    controller: _nameController,
                    textInputAction: TextInputAction.next,
                    autofocus: true,
                    focusNode: myFocusNode,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Este campo precisa ser preenchido';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      label: Text('Nome'),
                      hintText: 'Digite seu nome',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    controller: _lastNameController,
                    textInputAction: TextInputAction.next,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Este campo precisa ser preenchido';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      label: Text('Sobrenome'),
                      hintText: 'Digite seu sobrenome',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Data de nascimento: ',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.grey),
                      ),
                    ),
                    child: MyDatePicker(),
                  ),
                  const SizedBox(height: 10.0),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sexo: ',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  RadioBoxesWidget(),
                  const SizedBox(height: 10.0),
                  DescriptionWidget(),
                  const SizedBox(height: 10.0),
                  const UserTermsWidget(),
                  const SizedBox(height: 10.0),
                  CheckboxListTile(
                    title: const Text(
                        'Aceito compartilhar dados para melhoria do aplicativo.'),
                    value: _telemetryCheckbox,
                    onChanged: (value) {
                      setState(() {
                        _telemetryCheckbox = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text(
                        'Aceito receber comunicação sobre promoções.”'),
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
                    title: const Text('Aceitar todos os items acima.'),
                    value: _acceptAllTerms,
                    onChanged: (value) {
                      setState(() {
                        _acceptAllTerms = value!;
                        _serviceTermsCheckbox = value;
                        _promotionCheckbox = value;
                        _telemetryCheckbox = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Enviando dados!'),
                            ),
                          );
                        }
                      },
                      child: const Text('Enviar'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
