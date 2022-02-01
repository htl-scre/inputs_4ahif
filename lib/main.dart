import 'package:flutter/material.dart';

void main() {
  runApp(InputDemo());
}

class InputDemo extends StatelessWidget {
  const InputDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  static const options = ['A', 'B', 'C'];

  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectOption = HomePage.options[0];
  final controller = TextEditingController();

  List<DropdownMenuItem<String>> buildDropDownItems() {
    final result = <DropdownMenuItem<String>>[];
    for (final option in HomePage.options) {
      final item = DropdownMenuItem(
        child: Text(option),
        value: option,
      );
      result.add(item);
    }
    return result;
  }

  bool isOk() {
    return controller.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(isOk() ? Icons.check : Icons.error),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            decoration: InputDecoration(),
            keyboardType: TextInputType.number,
            controller: controller,
            onChanged: (input) => setState(() {}),
          ),
          DropdownButton(
            items: buildDropDownItems(),
            value: selectOption,
            onChanged: (selected) {
              setState(() {
                selectOption = selected as String;
              });
            },
          )
        ],
      ),
    );
  }
}
