import 'package:flutter/material.dart';
import 'package:ripel_application/components/build_view.dart';
import 'package:ripel_application/widget/form_dialog_widget.dart';

class ListViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListViewWidgetState();
}

class ListViewWidgetState extends State<ListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 221, 221, 180),
      body: BuildView(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 53, 163, 110),
        child: Icon(Icons.new_label),
        elevation: 10,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => FormularioTransferencia(),
          ).then((value) => setState(() {}));
        },
      ),
      bottomNavigationBar: Container(
        width: 10.0,
        height: 40.0,
        color: Color.fromARGB(255, 221, 221, 180),
        child: BottomAppBar(
          notchMargin: 2,
          shape: const CircularNotchedRectangle(),
          color: Color.fromARGB(255, 4, 79, 7),
          child: IconTheme(
            data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.monetization_on)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.monetization_on)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
