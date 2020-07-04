import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:dio/dio.dart';

class Loading extends StatefulWidget {
  @override
  State createState() => LoadingState();
}

class LoadingState extends State<Loading> {
  void getImages() async {
    List<String> paths = List();
    List<String> authors = List();
    List<String> fullImagePaths = List();

    var response = await Dio().get(
        'https://api.unsplash.com/photos/?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0');
    print(response.data.length);

    for (int i = 0; i < response.data.length; i++) {
      paths.add(response.data[i]['urls']['thumb']);
      authors.add(response.data[i]['user']['username']);
      fullImagePaths.add(response.data[i]['urls']['regular']);
    }

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'authors': authors,
      'paths': paths,
      'fullImagePaths': fullImagePaths
    });
  }

  @override
  void initState() {
    super.initState();
    getImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
            child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        )));
  }
}
