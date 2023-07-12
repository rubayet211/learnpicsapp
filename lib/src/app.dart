// Import flutter helper library
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';

class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;

  void fetchImage() async {
    counter++;
    String urlString = "https://jsonplaceholder.typicode.com/photos/$counter";
    Uri uri = Uri.parse(urlString);
    var resonpse = await get(uri);
    var imageModel = ImageModel.fromJson(json.decode(resonpse.body));
  }

  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Text('$counter'),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,
        ),
        appBar: AppBar(
          title: Text('Let\'s see some images!'),
        ),
      ),
    );
  }
}
