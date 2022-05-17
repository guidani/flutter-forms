import 'package:flutter/material.dart';
import 'package:forms/pages/styleText/mock_text.dart';
import 'package:forms/pages/styleText/my_date_picker.dart';

class StyleTextPage extends StatefulWidget {
  const StyleTextPage({Key? key}) : super(key: key);

  @override
  State<StyleTextPage> createState() => _StyleTextPageState();
}

enum PersonGender { masculino, feminino, outro }

class _StyleTextPageState extends State<StyleTextPage> {
  final _formKey = GlobalKey<FormState>();
  late FocusNode myFocusNode;
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();

  bool isItalic = false;
  bool isBold = false;
  bool isUnderline = false;
  Map<String, dynamic> decorations = {
    "isItalic": false,
    "isBold": false,
    "isUnderline": false
  };

  PersonGender? _personGender = PersonGender.masculino;

  bool _telemetryCheckbox = false;
  bool _promotionCheckbox = false;
  bool _serviceTermsCheckbox = false;
  bool _acceptAllTerms = false;

  List<bool> _selections = List.generate(3, (_) => false);

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
                    onChanged: (value) {},
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
                  const SizedBox(
                    height: 10.0,
                  ),
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
                  const SizedBox(
                    height: 10.0,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
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
// ! NÃO FUNCIONANDO
                  // InputDatePickerFormField(
                  //   errorFormatText: 'Formato de data incorreta',
                  //   errorInvalidText: 'Data inválida',
                  //   fieldHintText: 'dd/mm/YYYY',
                  //   fieldLabelText: 'Data de nascimento',
                  //   // initialDate: DateTime.now(),
                  //   firstDate: DateTime(1900),
                  //   lastDate: DateTime(2999),
                  // ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sexo: ',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
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
                  const SizedBox(
                    height: 10.0,
                  ),
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
                  const SizedBox(
                    height: 10.0,
                  ),
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
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
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
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
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
