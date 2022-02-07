import 'package:flutter/material.dart';

import 'package:korea_cafe/banner_ad.dart';
import 'package:korea_cafe/maxiPhoto.dart';
import 'package:korea_cafe/savedData/db_helper.dart';
import 'package:korea_cafe/savedData/memo.dart';

int i = 0;
Color buttonColor = Colors.grey;
//late bool isPressed;
late String savedOrNot;

class CoffeExp extends StatefulWidget {
  int tagNum;
  String cafeTitle;
  String entitle;
  String jaTitle;
  String korTitle;
  String price;
  String description;
  String type;
  String yomi;
  var menuImage;

  CoffeExp({
    Key? key,
    required this.tagNum,
    required this.cafeTitle,
    required this.entitle,
    required this.jaTitle,
    required this.korTitle,
    required this.price,
    required this.description,
    required this.type,
    required this.yomi,
    required this.menuImage,
  }) : super(key: key);

  @override
  State<CoffeExp> createState() => _CoffeExpState();
}

class _CoffeExpState extends State<CoffeExp> {
  bool isPressed = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkDB();
  }

  @override
  Widget build(BuildContext context) {
    String yenPrice = (int.parse(widget.price) / 10.7).toStringAsFixed(0);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Color(0xff37251b),
                      ),
                    ),
                    IconButton(
                        color: (isPressed) ? Colors.red : Colors.grey[500],
                        onPressed: () {
                          setState(() {
                            //print(widget.cafeTitle);

                            if (isPressed == true) {
                              isPressed = false;
                              deleteDB();
                            } else {
                              isPressed = true;
                              saveDB();
                            }
                          });
                        },
                        icon: ImageIcon(
                          AssetImage("assets/images/heart.png"),
                        ))
                  ],
                ),
                Center(child: mainMenuImage(context)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 3, 15, 5),
              child: Text(
                widget.jaTitle,
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Text(
                widget.korTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Text(
                "読み方: ${widget.yomi}",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: Text(
                widget.entitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.02,
              child: Divider(
                color: Color(0xff37251b),
              ),
            ),
            if (widget.type == "None" || widget.type == "")
              Container()
            else
              Text(
                "Type: ${widget.type}",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Price: ₩${widget.price}  /",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  "  ¥$yenPrice",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.02,
              child: Divider(
                color: Color(0xff37251b),
              ),
            ),
            Text(
              "説明",
              style:
                  Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Color(0xffece0d1).withOpacity(0.5),
                ),
                height: MediaQuery.of(context).size.height * 0.15,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 7, 10, 0),
                      child: Text(
                        widget.description,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 17,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Text(
                "*価格とメニュー情報は実際と異なる場合があります。 参考用でのみご使用ください。",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 13,
                    ),
              ),
            ),
            Spacer(),
            AdMob(),
          ],
        ),
      ),
    );
  }

  Widget mainMenuImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.21,
      width: MediaQuery.of(context).size.width * 0.6,
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PhotoSize(
                          imageUrl: widget.menuImage,
                        )),
              );
            },
            child: Center(
              child: Image.network(
                widget.menuImage,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Image.asset(widget.menuImage);
                },
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 30,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PhotoSize(
                            imageUrl: widget.menuImage,
                          )),
                );
              },
              icon: Icon(
                Icons.photo_size_select_large_outlined,
                color: Colors.grey[600],
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> saveDB() async {
    DBHelper sd = DBHelper();
    //print(widget.cafeTitle);
    var fido = Memo(
      tag: widget.cafeTitle + widget.tagNum.toString(),
      tagNum: widget.tagNum,
      cafeName: widget.cafeTitle,
      jpTitle: widget.jaTitle,
      korTitle: widget.korTitle,
      enTitle: widget.entitle,
      yomi: widget.yomi,
      type: widget.type,
      price: widget.price,
      explanation: widget.description,
      imageUrl: widget.menuImage,
      //id: Str25tosha(DateTime.now().toString()),
      //subId: widget.mainNum,
      //text: "Null2",
      //widget.jaWordList![widget.mainNum],
    );
    //print(toString());
    //print();

    await sd.insertMemo(fido);
    //print(await sd.memos());
  }

  Future<void> deleteDB() async {
    DBHelper sd = DBHelper();
    //print(widget.cafeTitle);
    // var fido = Memo(
    //   tag: widget.cafeTitle + widget.tagNum.toString(),
    //   tagNum: widget.tagNum,
    //   cafeName: widget.cafeTitle,
    //   jpTitle: widget.jaTitle,
    //   korTitle: widget.korTitle,
    //   enTitle: widget.entitle,
    //   yomi: widget.yomi,
    //   type: widget.type,
    //   price: widget.price,
    //   explanation: widget.description,
    //   imageUrl: widget.menuImage,
    // );
    await sd.deleteMemo(widget.cafeTitle + widget.tagNum.toString());
    //print(await sd.memos());
  }

  Future<void> checkDB() async {
    DBHelper sd = DBHelper();
    savedOrNot = await sd.checkSavedDB(
        widget.cafeTitle + widget.tagNum.toString(), widget.entitle);
    setState(() {
      savedOrNot = savedOrNot;
      if (savedOrNot == "true") {
        isPressed = true;
      } else {}
    });
  }
}
