import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Message.dart';
import 'package:grouped_list/grouped_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.cyan, Colors.amber],
                    begin: Alignment.topLeft,
                    end: Alignment.topRight)),
          ),
          title: Text(
            'My contacts',
          ),
        ),
        body: SafeArea(
            child: GroupedListView<dynamic, String>(
          elements: messages,
          useStickyGroupSeparators: true,
          groupBy: (element) => element['country'],
          groupSeparatorBuilder: (value) {
            return Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              child: Text(
                value,
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red[400],
            );
          },
          itemBuilder: (context, element) {
            return Card(
              elevation: 5,
              child: ListTile(
                title: Text(element['player']),
                leading: CircleAvatar(
                  foregroundImage: AssetImage('Assets/OIP.jpg'),
                  radius: 20,
                ),
              ),
            );
          },
        )),
      ),
    );
  }
}
