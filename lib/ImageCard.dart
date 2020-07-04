import 'package:flutter/material.dart';
import 'FullImage.dart';

class ImageCard extends StatelessWidget {
  final String path;
  final String author;
  final String fullImagePath;

  ImageCard({this.path, this.author, this.fullImagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.0),
      child: Card(
        color: Colors.grey[200],
        child: Container(
          padding: EdgeInsets.all(7.0),
          child: Column(
            children: <Widget>[
              GestureDetector(
                  child: Image.network(
                    path,
                    width: double.infinity,
                    height: 100.0,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes
                              : null,
                        ),
                      );
                    },
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return FullImage(
                          author: author, fullImagePath: fullImagePath);
                    }));
                  }),
              Divider(
                color: Colors.grey,
              ),
              Text('author:',
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 8.0)),
              Text('$author',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}
