import 'package:flutter/material.dart';
import 'package:forms/pages/styleText/checkbox_widget.dart';
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
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  DescriptionWidget(),
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
                  const UserTermsWidget(),
                  const SizedBox(height: 10.0),
                  CheckboxWidget(),
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
