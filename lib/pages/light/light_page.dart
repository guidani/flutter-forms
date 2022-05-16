import 'package:flutter/material.dart';

class LightPage extends StatefulWidget {
  const LightPage({Key? key}) : super(key: key);

  @override
  State<LightPage> createState() => _LightPageState();
}

class _LightPageState extends State<LightPage> {
  bool value = true;
  bool lightValue = false;
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightValue ? Color.fromRGBO(12, 12, 12, 1) : null,
      appBar: AppBar(
        backgroundColor: lightValue ? Color.fromARGB(75, 75, 75, 75) : null,
        actions: [
          Row(
            children: [
              Icon(Icons.sunny),
              Switch(
                value: lightValue,
                onChanged: (lightValue) {
                  setState(() => {
                        this.lightValue = lightValue,
                      });
                },
              ),
              Icon(Icons.dark_mode),
            ],
          )
        ],
        title: Text('Light'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              value == true ? lightOn() : lightOff(),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'Ligar/Desligar',
                style: TextStyle(
                    color: lightValue ? Colors.white : Colors.black,
                    fontSize: 20),
              ),
              Transform.scale(
                scale: 2,
                child: Switch.adaptive(
                    value: value,
                    onChanged: (value) {
                      setState(() => {
                            this.value = value,
                          });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget lightOff() {
    return Container(
      child: Icon(
        Icons.sunny,
        size: 150,
      ),
    );
  }

  Widget lightOn() {
    return Container(
      child: Icon(
        Icons.sunny,
        size: 150,
        color: Colors.yellow,
      ),
    );
  }
}
