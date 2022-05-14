import 'package:flutter/material.dart';
import 'package:ripel_application/models/list.dart';

class CardExibition extends StatelessWidget {
  final Listing _lists;

  CardExibition(this._lists);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
        child: LayoutBuilder(
          builder: (context, constraints) => Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
                width: constraints.maxWidth,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 55.0,
                          height: 55.0,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              alignment: Alignment.center,
                              backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 53, 163, 110),
                              ),
                            ),
                            onPressed: () {},
                            child: Icon(Icons.edit),
                          ),
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: 200,
                          ),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(_lists.title,
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 12, 12, 12),
                                        fontFamily: 'Old',
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.normal)),
                                Text(_lists.description,
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 12, 12, 12),
                                        fontFamily: 'Light',
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.normal)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40.0,
                        ),
                        Container(
                            width: 55.0,
                            height: 55.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      alignment: Alignment.center,
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.redAccent,
                                      )),
                                  child: const Icon(Icons.delete),
                                )
                              ],
                            ))
                      ],
                    ),
                    Container(
                        width: 55.0,
                        height: 55.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  alignment: Alignment.center,
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.redAccent,
                                  )),
                              child: const Icon(Icons.delete),
                            )
                          ],
                        ))
                  ],
                )),
          ),
        ));
  }
}
