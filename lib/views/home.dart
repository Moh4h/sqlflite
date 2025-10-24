import 'package:flutter/material.dart';
import 'package:flutter_sql/model/sqldata.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});
  Sqldata sqldata = Get.put(Sqldata());
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add,size: 36,),onPressed: () {
       // sqldata.insertData("insert into 'notes' ('title','note') values('test','testing ??')");
        Get.toNamed("/CreateNote",);
      },),
      appBar: AppBar(title: Text("Notes")),
      body: 
         ListView(
          children: [
            GetBuilder<Sqldata>(
              builder:
                  (controller) => FutureBuilder(
                    future: controller.readDate(),
                    builder: (context, AsyncSnapshot<List<Map>> snapshot) {
                      if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8,
                                ),
                            itemBuilder: (context, index) {
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(spacing: 16,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${snapshot.data![index]["title"]}",
                                        maxLines: 4,
                                      ),
                                      Text(
                                        "${snapshot.data![index]["note"]}",
                                        maxLines: 4,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: snapshot.data!.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                          ),
                        );
                      } else {
                        return Center(child: Text("No data"));
                      }
                    },
                  ),
            ),
          ],
        ),
      );
    
  }
}
