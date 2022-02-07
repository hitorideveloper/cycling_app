import 'package:flutter/material.dart';
import 'package:korea_cafe/drinkDes.dart';
import 'package:korea_cafe/savedData/db_helper.dart';
import 'package:korea_cafe/savedData/memo.dart';

class SavedMenu extends StatefulWidget {
  const SavedMenu({Key? key}) : super(key: key);

  @override
  _SavedMenuState createState() => _SavedMenuState();
}

var savedData;

class _SavedMenuState extends State<SavedMenu> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callSaved();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "お気に入り",
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: Color(0xff37251b)),
        ),
        iconTheme: IconThemeData(color: Color(0xff37251b)),
      ),
      body: ListView.builder(
          itemCount: savedData == null ? 0 : savedData[0].length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(3, 10, 5, 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CoffeExp(
                              tagNum: savedData[0][index],
                              cafeTitle: savedData[1][index],
                              description: savedData[9][index],
                              entitle: savedData[4][index],
                              jaTitle: savedData[2][index],
                              korTitle: savedData[3][index],
                              price: savedData[7][index],
                              type: savedData[6][index],
                              menuImage: savedData[8][index],
                              yomi: savedData[5][index],
                            )),
                  );
                },
                child: Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: Column(
                        children: [
                          Expanded(
                            //height: MediaQuery.of(context).size.height * 0.15,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Image.network(savedData[8][index]),
                            ),
                          ),
                          // SizedBox(height: 2),
                          // Container(
                          //   child: Text(
                          //     savedData[1][index],
                          //     style: Theme.of(context)
                          //         .textTheme
                          //         .subtitle2!
                          //         .copyWith(
                          //           fontSize: 16,
                          //         ),
                          //     textAlign: TextAlign.center,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              child: Text(
                            (() {
                              if (savedData[1][index] == "A TWOSOME PLACE") {
                                return "ツーサムプレイス";
                              } else if (savedData[1][index] ==
                                  "CAFFE PASCUCCI") {
                                return "パスクチ";
                              } else if (savedData[1][index] == "GongCha") {
                                return "貢茶";
                              } else if (savedData[1][index] ==
                                  "HOLLYS COFFEE") {
                                return "ハリスコーヒー";
                              } else if (savedData[1][index] ==
                                  "MEGA MGC COFFEE") {
                                return "メガ MGC コーヒー";
                              } else if (savedData[1][index] ==
                                  "PAIK’S COFFEE") {
                                return "ペクダバン";
                              } else if (savedData[1][index] == "THE VENTI") {
                                return "ザ·ベンティ";
                              } else if (savedData[1][index] ==
                                  "EDIYA COFFEE") {
                                return "イディヤ コーヒー";
                              } else if (savedData[1][index] == "Cafe BomBom") {
                                return "カフェボムボム";
                              }
                              return "";
                            })(),
                            style:
                                Theme.of(context).textTheme.subtitle2!.copyWith(
                                      fontSize: 16,
                                    ),
                          )),
                          SizedBox(
                            height: 2,
                          ),
                          Container(
                              child: Text(
                            (() {
                              if (savedData[1][index] == "A TWOSOME PLACE") {
                                return "투썸플레이스";
                              } else if (savedData[1][index] ==
                                  "CAFFE PASCUCCI") {
                                return "파스쿠치";
                              } else if (savedData[1][index] == "GongCha") {
                                return "공차";
                              } else if (savedData[1][index] ==
                                  "HOLLYS COFFEE") {
                                return "할리스커피";
                              } else if (savedData[1][index] ==
                                  "MEGA MGC COFFEE") {
                                return "메가 MGC 커피";
                              } else if (savedData[1][index] ==
                                  "PAIK’S COFFEE") {
                                return "빽다방";
                              } else if (savedData[1][index] == "THE VENTI") {
                                return "더 벤티";
                              } else if (savedData[1][index] ==
                                  "EDIYA COFFEE") {
                                return "이디야 커피";
                              } else if (savedData[1][index] == "Cafe BomBom") {
                                return "카페 봄봄";
                              }
                              return "";
                            })(),
                            style:
                                Theme.of(context).textTheme.subtitle2!.copyWith(
                                      fontSize: 16,
                                    ),
                          )),
                          Container(
                            child: Text(
                              savedData[1][index],
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                    fontSize: 16,
                                  ),
                              //textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            child: Text(savedData[2][index],
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                      fontSize: 16,
                                    )),
                          ),
                          SizedBox(height: 2),
                          Container(
                            child: Text(savedData[3][index]),
                          ),
                          SizedBox(height: 2),
                          Container(
                            child: Text(savedData[4][index]),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xff37251b),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Future<void> callSaved() async {
    DBHelper sd = DBHelper();
    //print(widget.cafeTitle);
    savedData = await sd.searchDB();
    setState(() {
      savedData = savedData;
    });
  }
}
