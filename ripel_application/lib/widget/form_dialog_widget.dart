import 'package:flutter/material.dart';
import 'package:ripel_application/components/editor_form.dart';
import 'package:ripel_application/database/DAO/list_DAO.dart';
import 'package:ripel_application/models/list.dart';

const _LabelDescription = 'Descrição';
const _LabelTitle = 'Tarefa';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();

  final ListDao _dao = ListDao();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Adicionar Tarefa',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                Editor(
                  controller: _controllerTitle,
                  labelText: _LabelTitle,
                ),
                SubEditor(
                  subController: _controllerDescription,
                  labelDescription: _LabelDescription,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 15, 122, 70),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _createdList(context);
                      }
                    },
                    child: Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  void _createdList(BuildContext context) {
    final String title = _controllerTitle.text;
    final String description = _controllerDescription.text;
    final newList = Listing(0, title, description);
    _dao.save(newList).then((id) => Navigator.pop(context));
  }
}
