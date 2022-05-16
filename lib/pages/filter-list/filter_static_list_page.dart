import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FilterStaticList extends StatefulWidget {
  const FilterStaticList({Key? key}) : super(key: key);

  @override
  State<FilterStaticList> createState() => _FilterStaticListState();
}

class _FilterStaticListState extends State<FilterStaticList> {
  late FocusNode myFocusNode;
  TextEditingController controller = TextEditingController();

  List<String> _jogos = [
    'Halo 2',
    'Halo: Reach',
    'Warframe',
    'FIFA',
    'God of War',
    'Super Mario',
    'Mario Maker',
    'Sonic',
    'Zelda',
    'League of Legends',
    'DoTA'
  ];

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter From Static List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              Autocomplete(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text.trim() == '') {
                    return const Iterable<String>.empty();
                  }
                  return _jogos.where((String option) {
                    return option
                        .toLowerCase()
                        .contains(textEditingValue.text.toLowerCase());
                  });
                },
                displayStringForOption: (String name) => name,
                fieldViewBuilder: (BuildContext context,
                    TextEditingController controller,
                    FocusNode myFocusNode,
                    VoidCallback onFiendSubmitted) {
                  return TextField(
                    controller: controller,
                    autofocus: true,
                    focusNode: myFocusNode,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      label: Text('Pesquisa'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                    ),
                  );
                },
                // ! INCORRETO
                optionsViewBuilder: (
                  BuildContext context,
                  AutocompleteOnSelected<String> onSelected,
                  Iterable<String> options,
                ) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      child: Container(
                        width: 300,
                        color: Colors.cyan,
                        child: ListView.builder(
                            padding: EdgeInsets.all(10.0),
                            itemCount: options.length,
                            itemBuilder: (context, index) {
                              final String name = options.elementAt(index);
                              return GestureDetector(
                                onTap: () {
                                  onSelected(name);
                                },
                                child: ListTile(
                                  title: Text(name),
                                ),
                              );
                            }),
                      ),
                    ),
                  );
                },
              ),
              const Divider(
                color: Colors.transparent,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _jogos.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        onTap: () {},
                        leading: Text('${index + 1}'),
                        title: Text(_jogos[index]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
