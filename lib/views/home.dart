import 'package:flutter/material.dart';
import 'package:flutter_sql/model/sqldata.dart';

class Home extends StatelessWidget {
  Home({super.key});
  Sqldata sqldata = Sqldata();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("home")),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () async {
              int response = await sqldata.insertData('''
insert into 'notes'('note') values ('note 1232')
''');
              print(response.toString() + "================");
            },
            child: Text("insert data"),
          ),
          ElevatedButton(
            onPressed: () async {
              List<Map> response = await sqldata.selectData(
                "select * from 'notes'",
              );
              print(response);
            },
            child: Text("read data"),
          ),
          ElevatedButton(
            onPressed: () async {
              int response = await sqldata.daleteData(
                "delete from 'notes' where id=3",
              );
              print(response);
            },
            child: Text("delete data"),
          ),
           ElevatedButton(
            onPressed: () async {
              int response = await sqldata.daleteData(
                "update 'notes' set note='kkkkk' where id=1",
              );
              print(response);
            },
            child: Text("update data"),
          ),
        ],
      ),
    );
  }
}
