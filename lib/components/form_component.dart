import 'package:flutter/material.dart';

class FormComponent extends StatelessWidget {
  final String title;
  final String hint;
  final String errorMessage;
  final void Function(String) onChanged;

  const FormComponent({super.key, required this.title, required this.hint, required this.errorMessage, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.normal
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 0, 50, 15),
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: hint,
            ),
            onChanged: onChanged,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return errorMessage;
              }
              return null;
            },
          ),
        ),
      ]
    );
  }
}