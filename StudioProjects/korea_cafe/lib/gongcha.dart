import 'package:flutter/material.dart';

class GongChaOrder extends StatelessWidget {
  const GongChaOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Color(0xff37251b)),
        title: Text(
          "注文方法",
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: Color(0xff37251b)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "飲み物には最大3つのトッピングが追加できる。",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Text(
                "トッピング1つ追加に、Largeサイズのメニューは500ウォン、Jumboサイズは700ウォン",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "1) ミルクフォーム:ソフトな泡",
                textAlign: TextAlign.center,
              ),
              Text(
                "2) タピオカパール:もちっとした食感のよいパール",
                textAlign: TextAlign.center,
              ),
              Text(
                "3) ココナッツ:甘いココナッツゼリー",
                textAlign: TextAlign.center,
              ),
              Text(
                "4) アロエ:サクサクとしたアロエ",
                textAlign: TextAlign.center,
              ),
              Text(
                "5) ホワイトパール:海藻で作った透明なパール",
                textAlign: TextAlign.center,
              ),
              Text(
                "6) チーズフォーム:濃いチーズの風味が感じられる泡",
                textAlign: TextAlign.center,
              ),
              Icon(
                Icons.arrow_drop_down,
                size: 30,
                color: Color(0xff37251b),
              ),
              Text(
                "メニューを選択した後に糖度（0%、30%、50%、70%、100%）糖度を選択",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Icon(
                Icons.arrow_drop_down,
                size: 30,
                color: Color(0xff37251b),
              ),
              Text(
                "アイスドリンクは氷の量（Less、Regular、Full）を選択する。",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "* 飲み物によっては基本的にトッピングが既に入っている場合があるので注意！",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
