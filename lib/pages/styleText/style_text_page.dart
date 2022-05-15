import 'package:flutter/material.dart';

class StyleTextPage extends StatefulWidget {
  const StyleTextPage({Key? key}) : super(key: key);

  @override
  State<StyleTextPage> createState() => _StyleTextPageState();
}

class _StyleTextPageState extends State<StyleTextPage> {
  late FocusNode myFocusNode;
  TextEditingController _descriptionController = TextEditingController();
  bool isItalic = false;
  bool isBold = false;
  bool isUnderline = false;
  Map<String, dynamic> decorations = {
    "isItalic": false,
    "isBold": false,
    "isUnderline": false
  };

  bool _telemetryCheckbox = false;
  bool _promotionCheckbox = false;
  bool _serviceTermsCheckbox = false;
  bool _acceptAllTerms = false;

  List<bool> _selections = List.generate(3, (_) => false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    myFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(decorations.keys);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Toggle text style"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  textInputAction: TextInputAction.next,
                  autofocus: true,
                  focusNode: myFocusNode,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Este campo precisa ser preenchido';
                    }
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
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    label: Text('Sobrenome'),
                    hintText: 'Digite seu sobrenome',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: _descriptionController,
                  style: TextStyle(
                    fontStyle: isItalic ? FontStyle.italic : null,
                    fontWeight: isBold ? FontWeight.bold : null,
                    decoration: isUnderline ? TextDecoration.underline : null,
                  ),
                  decoration: const InputDecoration(
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
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In facilisis auctor laoreet. Aenean varius fringilla dolor facilisis efficitur. Maecenas eleifend laoreet leo, ut faucibus urna tempus ut. Mauris ullamcorper et enim a pulvinar. Nulla molestie tortor et imperdiet luctus. Maecenas vel libero at ipsum condimentum egestas eget vel enim. Integer ut orci vitae sem auctor iaculis non id lectus. Pellentesque lobortis, libero id tempus dignissim, urna ex dapibus ante, sed tincidunt justo orci ut metus. Donec at ante laoreet dolor pharetra hendrerit id vel nisl.'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        leading: Checkbox(
                          value: _telemetryCheckbox,
                          onChanged: (value) {
                            setState(() {
                              _telemetryCheckbox = value!;
                            });
                          },
                        ),
                        title: const Text(
                            'Aceito compartilhar dados para melhoria do aplicativo.”'),
                      ),
                      ListTile(
                        leading: Checkbox(
                          value: _promotionCheckbox,
                          onChanged: (value) {
                            setState(() {
                              _promotionCheckbox = value!;
                            });
                          },
                        ),
                        title: const Text(
                            'Aceito receber comunicação sobre promoções.”'),
                      ),
                      ListTile(
                        leading: Checkbox(
                          value: _serviceTermsCheckbox,
                          onChanged: (value) {
                            setState(() {
                              _serviceTermsCheckbox = value!;
                            });
                          },
                        ),
                        title: const Text('Aceito os termos de serviço.”'),
                      ),
                      ListTile(
                        leading: Checkbox(
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
                        title: const Text('Aceitar todos os items acima.”'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Enviar'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
