import 'package:flutter/material.dart';
import 'package:ripel_application/components/list_card.dart';
import 'package:ripel_application/database/DAO/list_DAO.dart';
import 'package:ripel_application/models/list.dart';

class BuildView extends StatelessWidget {
  final ListDao _dao = ListDao();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Listing>>(
      initialData: [],
      future: _dao.findAll(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            break;
          case ConnectionState.waiting:
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Text('Carregando')
                ],
              ),
            );
            break;
          case ConnectionState.active:
            break;
          case ConnectionState.done:
            final List<Listing> _listing = snapshot.data as List<Listing>;
            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final Listing list = _listing[index];
                return CardExibition(list);
              },
              itemCount: _listing.length,
            );
            break;
        }
        return Text('Unknown error');
      },
    );
  }
}
