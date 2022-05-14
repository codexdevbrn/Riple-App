import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;

  Editor({
    required this.controller,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 90,
        ),
        child: TextFormField(
          validator: (controller) {
            if (controller == null || controller.isEmpty) {
              return 'Este campo é obrigatório';
            }
            return null;
          },
          controller: controller,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          style: const TextStyle(fontSize: 18.0),
          decoration: InputDecoration(
              border: const UnderlineInputBorder(), labelText: labelText),
        ));
  }
}

class SubEditor extends StatelessWidget {
  final TextEditingController subController;
  final String? labelDescription;

  SubEditor({
    required this.subController,
    this.labelDescription,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 90,
        ),
        child: TextFormField(
          controller: subController,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          style: const TextStyle(fontSize: 18.0),
          decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              labelText: labelDescription),
        ));
  }
}
