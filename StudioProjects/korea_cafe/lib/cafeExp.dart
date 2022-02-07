import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:korea_cafe/drinkDes.dart';
import 'package:korea_cafe/gongcha.dart';

import 'banner_ad.dart';

class CafeExplanation extends StatefulWidget {
  String? enTitle;
  String? cafeImage;
  String? jaTitle;
  String? korTitle;
  String? cafeDes;
  String? cafeType;

  CafeExplanation({
    Key? key,
    required this.enTitle,
    required this.cafeImage,
    required this.jaTitle,
    required this.korTitle,
    required this.cafeDes,
    required this.cafeType,
  }) : super(key: key);

  @override
  _CafeExplanationState createState() => _CafeExplanationState();
}

class _CafeExplanationState extends State<CafeExplanation> {
  //String cafeDescription = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    downloadImage();
    callMenu();
  }

  List menukorName = [];
  List menuJpName = [];
  List menuEnName = [];
  List menuPrice = [];
  List menuDescription = [];
  List type = [];
  List menuType = [];
  List yomi = [];
  List finalImageURL = [];

  String _tag = "ALL";
  bool _toggle = true;
  bool _toggle2 = false;
  bool _toggle3 = false;
  bool _toggle4 = false;
  bool _toggle5 = false;
  bool _toggle6 = false;

  Color _active = Color(0xffece0d1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Color(0xff37251b),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          child: Image.asset(
                            widget.cafeImage.toString(),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.jaTitle.toString(),
                                style: Theme.of(context).textTheme.subtitle2),
                            Text(
                              widget.enTitle.toString(),
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            Text(
                              widget.korTitle.toString(),
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        widget.enTitle == "GongCha"
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xffece0d1),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GongChaOrder()),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                      child: Image.asset(
                                          "assets/images/icons/caution2.png"),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      "注文方法",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              )

                            // InkWell(
                            //     onTap: () {},
                            //     child: Row(
                            //       children: [
                            //         Container(
                            //           height:
                            //               MediaQuery.of(context).size.height *
                            //                   0.02,
                            //           child: Image.asset(
                            //               "assets/images/icons/caution2.png"),
                            //         ),
                            //         SizedBox(
                            //           width: 3,
                            //         ),
                            //         Text("注文方法")
                            //       ],
                            //     ),
                            //   )
                            : Container()
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.08,
                child: ListView(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text(
                      widget.cafeDes.toString(),
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ]),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.01,
              child: Divider(
                color: Colors.black,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.04,
              width: MediaQuery.of(context).size.width * 0.9,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (_toggle != true) {
                          _toggle = true;
                          _toggle2 = false;
                          _toggle3 = false;
                          _toggle4 = false;
                          _toggle5 = false;
                          _toggle6 = false;
                        }
                        _tag = "ALL";
                        //print(_toggle);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: _toggle != true
                            ? Colors.transparent
                            : Color(0xffece0d1),
                      ),
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Center(
                        child: Text(
                          "ALL",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "/",
                      style: TextStyle(
                        fontSize: 20,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (_toggle2 != true) {
                          _toggle = false;
                          _toggle2 = true;
                          _toggle3 = false;
                          _toggle4 = false;
                          _toggle5 = false;
                          _toggle6 = false;
                        }
                        _tag = "COFFEE";
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: _toggle2 != true
                            ? Colors.transparent
                            : Color(0xffece0d1),
                      ),
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Center(
                        child: Text(
                          "COFFEE",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "/",
                      style: TextStyle(
                        fontSize: 20,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (_toggle3 != true) {
                          _toggle = false;
                          _toggle2 = false;
                          _toggle3 = true;
                          _toggle4 = false;
                          _toggle5 = false;
                          _toggle6 = false;
                        }
                        _tag = "NON-COFFEE";
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: _toggle3 != true
                            ? Colors.transparent
                            : Color(0xffece0d1),
                      ),
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Center(
                        child: Text(
                          "NON-COFFEE",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "/",
                      style: TextStyle(
                        fontSize: 20,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (_toggle4 != true) {
                          _toggle = false;
                          _toggle2 = false;
                          _toggle3 = false;
                          _toggle4 = true;
                          _toggle5 = false;
                          _toggle6 = false;
                        }
                        _tag = "TEA";
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: _toggle4 != true
                            ? Colors.transparent
                            : Color(0xffece0d1),
                      ),
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Center(
                        child: Text(
                          "TEA",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "/",
                      style: TextStyle(
                        fontSize: 20,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (_toggle5 != true) {
                          _toggle = false;
                          _toggle2 = false;
                          _toggle3 = false;
                          _toggle4 = false;
                          _toggle5 = true;
                          _toggle6 = false;
                        }
                        _tag = "FRAPPE";
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: _toggle5 != true
                            ? Colors.transparent
                            : Color(0xffece0d1),
                      ),
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Center(
                        child: Text(
                          "FRAPPE",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "/",
                      style: TextStyle(
                        fontSize: 20,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _tag = "DESSERT";
                        if (_toggle6 != true) {
                          _toggle = false;
                          _toggle2 = false;
                          _toggle3 = false;
                          _toggle4 = false;
                          _toggle5 = false;
                          _toggle6 = true;
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: _toggle6 != true
                            ? Colors.transparent
                            : Color(0xffece0d1),
                      ),
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Center(
                        child: Text(
                          "DESSERT",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.01,
              child: Divider(
                color: Colors.black,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: menuEnName.isEmpty ? 0 : menuEnName.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    //height: MediaQuery.of(context).size.height * 0.2,
                    child: InkWell(
                      onTap: () {
                        index >= finalImageURL.length
                            ? showDialog<String>(
                                context: context,
                                builder: (BuildContext context) =>
                                    new AlertDialog(
                                  content: new Text(
                                    "ロード中です。イメージが出るまで しばらくお待ちください。",
                                    style: TextStyle(
                                      fontSize: 17,
                                    ),
                                  ),
                                  actions: <Widget>[
                                    Container(
                                      color: Color(0xfffeeae6),
                                      child: new FlatButton(
                                        child: new Text(
                                          "OK",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CoffeExp(
                                          tagNum: index,
                                          cafeTitle: widget.enTitle.toString(),
                                          description: menuDescription[index],
                                          entitle: menuEnName[index],
                                          jaTitle: menuJpName[index],
                                          korTitle: menukorName[index],
                                          price: menuPrice[index],
                                          type: type[index],
                                          menuImage: finalImageURL[index],
                                          yomi: yomi[index],
                                        )),
                              );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03,
                          ),
                          if (_tag == "ALL") imageOfMenu(context, index),
                          if (_tag == "COFFEE" && menuType[index] == "coffee")
                            imageOfMenu(context, index)
                          else
                            Container(),
                          if (_tag == "NON-COFFEE" &&
                              menuType[index] == "nonCoffee")
                            imageOfMenu(context, index)
                          else
                            Container(),
                          if (_tag == "TEA" && menuType[index] == "TEA")
                            imageOfMenu(context, index)
                          else
                            Container(),
                          if (_tag == "FRAPPE" && menuType[index] == "Frappe")
                            imageOfMenu(context, index)
                          else
                            Container(),
                          if (_tag == "DESSERT" && menuType[index] == "Dessert")
                            imageOfMenu(context, index)
                          else
                            Container(),
                          SizedBox(
                            width: 30,
                          ),
                          if (_tag == "ALL") menuDescriptionRow(context, index),
                          if (_tag == "COFFEE" && menuType[index] == "coffee")
                            menuDescriptionRow(context, index)
                          else
                            Container(),
                          if (_tag == "NON-COFFEE" &&
                              menuType[index] == "nonCoffee")
                            menuDescriptionRow(context, index)
                          else
                            Container(),
                          if (_tag == "TEA" && menuType[index] == "TEA")
                            menuDescriptionRow(context, index)
                          else
                            Container(),
                          if (_tag == "FRAPPE" && menuType[index] == "Frappe")
                            menuDescriptionRow(context, index)
                          else
                            Container(),
                          if (_tag == "DESSERT" && menuType[index] == "Dessert")
                            menuDescriptionRow(context, index)
                          else
                            Container(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            AdMob(),
            //SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          ],
        ),
      ),
    );
  }

  Padding menuDescriptionRow(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  menuJpName[index],
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        fontSize: 16,
                      ),
                ),
                SizedBox(height: 5),
                Text(menukorName[index],
                    style: Theme.of(context).textTheme.bodyText1),
                SizedBox(height: 5),
                Text(
                  menuEnName[index],
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
          Text(
            "₩${menuPrice[index]}",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(width: 7),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: Color(0xff37251b),
            size: 15,
          ),
        ],
      ),
    );
  }

  Widget imageOfMenu(BuildContext context, int index) {
    try {
      return Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.2,
          child: Image.network(
            finalImageURL[index],
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              //finalImageURL[index] = "assets/images/cafe/cheap/cafe.png";
              return Image.asset(finalImageURL[index]);
            },
          ),
        ),
      );
    } catch (e) {
      return Padding(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.2,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.13,
            child: LinearProgressIndicator(
              backgroundColor: Color(0xffdbc1ac),
              color: Color(0xff37251b),
            ),
          ),
        ),
      );
    }
  }

  // imageOfMenu(BuildContext context, int index) {
  //   try {
  //     return Padding(
  //         padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
  //         child: Container(
  //             width: MediaQuery.of(context).size.width * 0.2,
  //             child: Container(
  //               child: Image.network(
  //                 finalImageURL[index],
  //                 fit: BoxFit.cover,
  //               ),
  //             )));
  //   } catch (e) {
  //     return Padding(
  //       padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
  //       child: Container(
  //           width: MediaQuery.of(context).size.width * 0.2,
  //           child: Container(
  //             child: LinearProgressIndicator(
  //               minHeight: 10,
  //               backgroundColor: Color(0xffdbc1ac),
  //               color: Color(0xff37251b),
  //             ),
  //           )),
  //     );
  //   }

  //   // return Padding(
  //   //     padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
  //   //     child: Container(
  //   //       width: MediaQuery.of(context).size.width * 0.2,
  //   //       child: FadeInImage.assetNetwork(
  //   //           placeholder: "assets/images/cafe/ordinal/paik.png",
  //   //           image: finalImageURL[index]),
  //   //       // child: Container(
  //   //       //   child: Image.network(
  //   //       //     finalImageURL[index],
  //   //       //     fit: BoxFit.cover,
  //   //       //   ),
  //   //       // ),
  //   //       // child: CachedNetworkImage(
  //   //       //   imageUrl: finalImageURL[index],
  //   //       //   placeholder: (context, url) => CircularProgressIndicator(),
  //   //       //   errorWidget: (context, url, error) => Icon(Icons.error),
  //   //       // ),
  //   //       // child: finalImageURL.length == menuDescription.length
  //   //       //     ? Container(
  //   //       //         height: MediaQuery.of(context).size.height * 0.1,
  //   //       //         child: LinearProgressIndicator(
  //   //       //           backgroundColor: Color(0xffdbc1ac),
  //   //       //           color: Color(0xff37251b),
  //   //       //         ),
  //   //       //       )
  //   //       //     : Container(
  //   //       //         child: Image.network(
  //   //       //           finalImageURL[index],
  //   //       //           fit: BoxFit.cover,
  //   //       //         ),
  //   //       //       ),
  //   //       // child: CachedNetworkImage(
  //   //       //   imageUrl: finalImageURL[index],
  //   //       //   //placeholder: (context, url) => new CircularProgressIndicator(),
  //   //       //   errorWidget: (context, url, error) => new Icon(Icons.error),
  //   //       // ),
  //   //     ));
  // }

  List menuTypeDoc = [
    "coffee",
    "nonCoffee",
    "TEA",
    "Dessert",
    "Frappe",
  ];
  final firestoreInstance = FirebaseFirestore.instance;
  Future callMenu() async {
    for (int _i = 0; _i < menuTypeDoc.length; _i++) {
      await firestoreInstance
          .collection(widget.cafeType.toString())
          .doc(widget.enTitle)
          .collection(menuTypeDoc[_i])
          .orderBy("price")
          .get()
          .then((value2) {
        value2.docs.forEach((element2) {
          if (this.mounted) {
            setState(() {
              if (element2.data()["title"] == null) {
              } else {
                menuEnName.add(element2.data()["title"]);
                menukorName.add(element2.data()["korName"]);
                menuJpName.add(element2.data()["jpName"]);
                menuDescription.add(element2.data()["description"]);
                menuPrice.add(element2.data()["price"]);
                type.add(element2.data()["type"]);
                yomi.add(element2.data()["yomi"]);
                menuType.add(menuTypeDoc[_i]);
                //finalImageURL.add(element2.data()['drinkImage']);
              }
            });
          }
        });
      });
    }
    //   await firestoreInstance
    //       .collection("ordinal")
    //       .doc(widget.enTitle)
    //       .collection("coffee")
    //       .get()
    //       .then((value2) {
    //     value2.docs.forEach((element2) {
    //       setState(() {
    //         print(element2.data()["title"]);
    //       });
    //     });
    //   });
    //   await firestoreInstance
    //       .collection("ordinal")
    //       .doc(widget.enTitle)
    //       .collection("nonCoffee")
    //       .get()
    //       .then((value2) {
    //     value2.docs.forEach((element2) {
    //       setState(() {
    //         print(element2.data()["title"]);
    //         print(element2.data()["price"]);
    //       });
    //     });
    //   });
    //   await firestoreInstance
    //       .collection("ordinal")
    //       .doc(widget.enTitle)
    //       .collection("Dessert")
    //       .get()
    //       .then((value2) {
    //     value2.docs.forEach((element2) {
    //       setState(() {
    //         print(element2.data()["title"]);
    //       });
    //     });
    //   });
  }

  Future downloadImage() async {
    String downloadURL;

    for (int _j = 0; _j < menuTypeDoc.length; _j++) {
      await firestoreInstance
          .collection(widget.cafeType.toString())
          .doc(widget.enTitle)
          .collection(menuTypeDoc[_j])
          .orderBy("price")
          .get()
          .then((snap) async {
        for (var element in snap.docs) {
          try {
            downloadURL = await FirebaseStorage.instance
                .ref()
                .child(element.data()["drinkImage"])
                .getDownloadURL();
            if (this.mounted) {
              setState(() {
                finalImageURL.add(downloadURL.toString());
              });
            }
          } catch (e) {
            finalImageURL.add("assets/images/papercup.png");
          }
        }
      });
    }
  }
}
