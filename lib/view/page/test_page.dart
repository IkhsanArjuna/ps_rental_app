import 'package:flutter/material.dart';
import 'package:ps_rental_app/data/forum_data.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: ForumData().getAllMessageForum(1),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else 
            {
              return Text("test");
            }
            
          }),
    );
  }
}
