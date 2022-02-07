import 'package:flutter/material.dart';

class MenuOrderWay extends StatelessWidget {
  const MenuOrderWay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "メニュー名理解",
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: Color(0xff37251b)),
        ),
        iconTheme: IconThemeData(color: Color(0xff37251b)),
      ),
      // appBar: AppBar(
      //   title: Text("メニューの理解"),
      // ),
      body: ListView(
        children: [
          explanation(
            title: "Coffee",
            korName: "아인슈페너 (アインシュペノ)",
            jpName: "ウインナーコーヒー",
            descrip: "アメリカーノなどのブラックコーヒーの上にクリームが加わったコーヒー、"
                "昔は「비엔나커피[ウィンナー·コーヒー]」という表現を使ったが、"
                "最近はあまり使わない。韓国では普通の아인슈패너[アインシュペノ]あるいは"
                " ~~슈패너[~~シュペノ] という表現が出てくるならこの飲み物です。",
            context: context,
          ),
          explanation(
            title: "Smoothie",
            korName: "스무디 (スムディ)",
            jpName: "スムージー",
            descrip: "普通、果物を挽いて作った飲み物を意味します。"
                "ヨーグルトが入ったら、~~요거트스무디[~~ヨゴトゥ スムディ]という名前を使用します。",
            context: context,
          ),
          explanation(
            title: "Frappe, Frappuccino",
            korName: "프라페 (プラペ), 프라푸치노 (プラプチノ)",
            jpName: "フラッペ, フラペチーノ",
            descrip: "スターバックス フラペチーノスタイルでいろんな材料を入れて挽いて作った飲み物を意味します。"
                "韓国ではふつう、~치노[~ちの]、~푸치노[~ぷちの]、~프라페[~フラッペ]などを使います",
            context: context,
          ),
        ],
      ),
    );
  }

  Padding explanation(
      {required title,
      required korName,
      required jpName,
      required descrip,
      required context}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: Color(0xff37251b)),

              //textAlign: TextAlign.center,
            ),
          ),
          Divider(
            color: Colors.black,
            height: 1,
            indent: 10,
            endIndent: 10,
          ),
          Container(
            child: Text(
              korName,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Color(0xff37251b)),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            jpName,
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(color: Color(0xff37251b)),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            descrip,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: 16,
                ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
