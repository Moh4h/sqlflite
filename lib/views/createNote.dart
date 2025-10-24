import 'package:flutter/material.dart';

class CreateNote extends StatelessWidget {
   CreateNote({super.key});
  TextEditingController controllerTitle=TextEditingController();
TextEditingController controllerDesc=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          if(controllerTitle.text.isEmpty ||controllerDesc.text.isEmpty){

          }else{
            
          }
        },
      ),
      appBar: AppBar(title: Text("Create Note")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 8,
          children: [
            TextFormField(
              controller: controllerTitle,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: "Title",
                hintStyle: TextStyle(fontSize: 24),
                border: InputBorder.none,
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: controllerDesc,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "Description",
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
