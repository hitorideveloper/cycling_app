import 'package:flutter/material.dart';

class PhotoSize extends StatelessWidget {
  final String? imageUrl;

  const PhotoSize({
    Key? key,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Color(0xff37251b)),
        ),
        body: Center(
            child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          child: Image.network(
            imageUrl!,
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return Image.asset(imageUrl!);
            },
          ),
        )));
  }
}
