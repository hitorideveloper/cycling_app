import 'package:flutter/material.dart';

class Warning extends StatelessWidget {
  const Warning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "参考事項",
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: Color(0xff37251b)),
        ),
        iconTheme: IconThemeData(color: Color(0xff37251b)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Column(
            children: [
              SizedBox(height: 15),
              Text(
                "支店によって取り扱うメニューと価格が異なる場合があります。",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 15),
              Text(
                "季節ごとに販売していないメニューがある場合がございます。",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 15),
              Text(
                "写真、メニューの説明、価格などは当カフェの公式ホームページやアプリなどを参考に制作いたしました。",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 15),
              Text(
                "メニュー写真資料の著作権は、当カフェが保有しております。",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 15),
              Text(
                "建議事項 : going2de@gmail.com",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
