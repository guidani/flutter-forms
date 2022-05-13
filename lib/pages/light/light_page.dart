import 'package:flutter/material.dart';

class LightPage extends StatefulWidget {
  const LightPage({Key? key}) : super(key: key);

  @override
  State<LightPage> createState() => _LightPageState();
}

class _LightPageState extends State<LightPage> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Light'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Expanded(
            child: Column(
              children: [
                value == true ? lightOn() : lightOff(),
                const SizedBox(
                  height: 10.0,
                ),
                Text('Ligar/Desligar'),
                Switch.adaptive(
                    value: value,
                    onChanged: (value) {
                      setState(() => {
                            this.value = value,
                          });
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget lightOff() {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(),
        color: Colors.white70,
      ),
    );
  }

  Widget lightOn() {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(),
        color: Colors.yellow,
        boxShadow: [
          BoxShadow(color: Colors.yellow, spreadRadius: 10.0, blurRadius: 10.0)
        ],
      ),
    );
  }
}
