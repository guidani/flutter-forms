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
              TextField(
                controller: controller,
                autofocus: true,
                // onChanged: _searchFunc,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  label: Text('Pesquisa'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                ),
              ),
              Autocomplete(optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text.trim() == '') {
                  return const Iterable<String>.empty();
                }
                return _jogos.where((String option) {
                  return option
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase());
                });
              }),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
