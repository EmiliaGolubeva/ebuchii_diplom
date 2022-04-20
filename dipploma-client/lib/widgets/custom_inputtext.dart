import 'package:flutter/material.dart';

class CustomInputText extends StatelessWidget {
  const CustomInputText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'Введите номер доставки...',
        labelStyle: TextStyle(fontSize: 13.0),
        focusColor: Colors.black,
        hoverColor: Colors.black,
        suffixIcon: Icon(Icons.search),
      ),
      keyboardType: TextInputType.text,
    );
  }
}
