import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ChooseColor extends StatefulWidget {
  const ChooseColor({super.key});

  @override
  State<ChooseColor> createState() => _ChooseColorState();
}

class _ChooseColorState extends State<ChooseColor> {
  Color color = Colors.red;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 200,
                height: 200,
                color: color,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(width: 1, color: Colors.black),
                    backgroundColor: Colors.white,
                    shape: const StadiumBorder()),
                onPressed: () => pickColor(context),
                child: const Text(
                  "PICK COLOR",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildColorPicker() => ColorPicker(
        pickerColor: color,
        onColorChanged: (color) => setState(() => this.color = color),
      );

  void pickColor(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Pick Your Color"),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildColorPicker(),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  "Select",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      );
}
