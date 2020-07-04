import 'package:flutter/material.dart';

class FullImage extends StatelessWidget {
  final String author;
  final String fullImagePath;

  FullImage({this.author, this.fullImagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
        body:
            SafeArea(
            child:
        SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              BackButton(color: Colors.black,),
              Image.network(
                fullImagePath,
                fit: BoxFit.fill,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: LinearProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes
                          : null,
                    ),
                  );
                },
              ),
              Divider(color: Colors.grey[400],),
              Text('author:', style: TextStyle(
                fontStyle: FontStyle.italic,
                    fontSize: 15.0
              )),
              Text(author,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold)),

            ],
          ),
        ))));
  }
}
