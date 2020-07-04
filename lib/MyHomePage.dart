import 'package:flutter/material.dart';
import 'ImageCard.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> paths = List();
  List<String> fullImagePaths = List();
  List<String> authors = List();

  void getData() {
    Map data = Map();
    data = ModalRoute.of(context).settings.arguments;
    print(data.containsKey('paths'));
    paths = data['paths'];
    authors = data['authors'];
    fullImagePaths = data['fullImagePaths'];
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
        body: GridView.count(
            crossAxisCount: 2,
            children: List.generate(paths.length, (index) {
              return Center(
                  child: ImageCard(
                      path: paths[index],
                      author: authors[index],
                      fullImagePath: fullImagePaths[index]));
            })));
  }
}
