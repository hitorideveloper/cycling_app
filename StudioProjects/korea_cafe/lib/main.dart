import 'dart:core';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:korea_cafe/banner_ad.dart';
import 'package:korea_cafe/cafeExp.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:korea_cafe/orderDescription.dart';
import 'dart:io';
import 'package:flutter/services.dart';

import 'package:korea_cafe/savedMenu.dart';
import 'package:korea_cafe/warning.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  //final firestoreInstance = FirebaseFirestore.instance.collection("ordinal");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "MPlusRounded",
        //primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: "MPlusRounded",

            //color: Colors.black,
            color: Color(0xff37251b),
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
          subtitle2: TextStyle(
            fontFamily: "MPlusRounded",
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
          subtitle1: TextStyle(
            fontFamily: "MPlusRounded",
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Color(0xff37251b),
          ),
          //한국어 설명
          bodyText1: TextStyle(
            fontFamily: "Cafe24",
            fontSize: 15,
          ),
          bodyText2: TextStyle(
            fontFamily: "MPlusRounded",
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
        ),
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List enTitle = [];
  List jaTitle = [];
  List koTitle = [];
  List cafeImage = [];
  List cafeDescrip = [];
  List cafeType = [];

  String tag = "0";
  bool _toggle = true;
  bool _toggle2 = false;
  bool _toggle3 = false;
  bool _toggle4 = false;
  late ByteData bytes;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callTitle();
    //loadAsset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "韓国 カフェメニュー",
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: Color(0xff37251b)),
        ),
        iconTheme: IconThemeData(color: Color(0xff37251b)),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(height: 10),
            ListTile(
              title: Text(
                "お気に入り",
                style: Theme.of(context).textTheme.subtitle2,
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SavedMenu(),
                  ),
                );
              },
            ),
            Divider(
              indent: 10,
              endIndent: 10,
              color: Colors.black,
            ),
            ListTile(
              title: Text(
                "メニュー説明",
                style: Theme.of(context).textTheme.subtitle2,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenuOrderWay(),
                  ),
                );
              },
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(
              indent: 10,
              endIndent: 10,
              color: Colors.black,
            ),
            ListTile(
              title: Text(
                "参考事項",
                style: Theme.of(context).textTheme.subtitle2,
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Warning(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            //classofCafe(),
            Center(
              child: Text(
                "カフェ カテゴリー",
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontSize: 15,
                    ),
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
              height: MediaQuery.of(context).size.height * 0.05,
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
                        }
                        tag = "0";
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: _toggle != true
                            ? Colors.transparent
                            : Color(0xffece0d1),
                      ),
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Center(
                        child: Text(
                          "全体カフェ",
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 14,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "/",
                      style: TextStyle(
                        fontSize: 25,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        tag = "1";
                        if (_toggle2 != true) {
                          _toggle = false;
                          _toggle2 = true;
                          _toggle3 = false;
                          _toggle4 = false;
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: _toggle2 != true
                            ? Colors.transparent
                            : Color(0xffece0d1),
                      ),
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Center(
                        child: Text(
                          "(一般)フランチャイズ",
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 14,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "/",
                    style: TextStyle(
                      fontSize: 25,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        tag = "2";
                        if (_toggle3 != true) {
                          _toggle = false;
                          _toggle2 = false;
                          _toggle3 = true;
                          _toggle4 = false;
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: _toggle3 != true
                            ? Colors.transparent
                            : Color(0xffece0d1),
                      ),
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Center(
                        child: Text(
                          "(コスパ)フランチャイズ",
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 14,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "/",
                    style: TextStyle(
                      fontSize: 25,
                      //fontWeight: FontWeight.bold,
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
                        }
                        tag = "3";
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
                          "個人カフェ",
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 14,
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
              height: MediaQuery.of(context).size.height * 0.02,
              child: Divider(
                color: Colors.black,
              ),
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.02,
            // ),
            // Text(
            //   "カフェリスト",
            //   style: Theme.of(context).textTheme.subtitle1,
            // ),
            Expanded(
              child: ListView.builder(
                itemCount: jaTitle.isEmpty ? 0 : jaTitle.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CafeExplanation(
                                  cafeImage: cafeImage[index],
                                  enTitle: enTitle[index],
                                  jaTitle: jaTitle[index],
                                  korTitle: koTitle[index],
                                  cafeDes: cafeDescrip[index],
                                  cafeType: cafeType[index],
                                )),
                      );
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        if (tag == "0") cafeMainImage(context, index),
                        if (tag == "1" && cafeType[index] == "ordinal")
                          cafeMainImage(context, index)
                        else
                          Container(),
                        if (tag == "2" && cafeType[index] == "cheap")
                          cafeMainImage(context, index)
                        else
                          Container(),
                        if (tag == "3" && cafeType[index] == "personal")
                          cafeMainImage(context, index)
                        else
                          Container(),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            if (tag == "0")
                              cafeDescriptionColumn(index, context),
                            if (tag == "1" && cafeType[index] == "ordinal")
                              cafeDescriptionColumn(index, context),
                            if (tag == "2" && cafeType[index] == "cheap")
                              cafeDescriptionColumn(index, context),
                            if (tag == "3" && cafeType[index] == "personal")
                              cafeDescriptionColumn(index, context),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Container(
            //     width: MediaQuery.of(context).size.width * 0.7,
            //     child: Text("価格はHot、Ice、サイズなどによって変動できることに注意")),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            AdMob(),
            //SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          ],
        ),
      ),
    );
  }

  Widget cafeMainImage(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            cafeImage[index],
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              cafeImage[index] = "assets/images/cafe/cheap/cafe.png";
              //print(cafeImage);
              return Image.asset("assets/images/cafe/cheap/cafe.png");
            },
          ),
        ),
      ),
    );
  }

  // cafeMainImage(BuildContext context, int index) {
  //   return Image.asset(cafeImage[index], errorBuilder:
  //       (BuildContext context, Object exception, StackTrace stackTrace) {
  //     return Image.asset(
  //       "assets/images/your_sample_image.png",
  //       width: 90,
  //     );
  //   });

  //   // try {
  //   //   return Padding(
  //   //     padding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
  //   //     child: Container(
  //   //       width: MediaQuery.of(context).size.width * 0.25,
  //   //       child: ClipRRect(
  //   //         borderRadius: BorderRadius.circular(8.0),
  //   //         child: Image.asset(cafeImage[index],
  //   //         errorBuilder:
  //   //             (BuildContext context, Object exception,
  //   //                 StackTrace stackTrace) {
  //   //           return Image.asset(
  //   //             "assets/images/your_sample_image.png",
  //   //             width: 90,
  //   //           );
  //   //         }),
  //   //       ),
  //   //     ),
  //   //   );
  //   // } catch (e) {
  //   //   print(e);
  //   //   return Text("No Image");
  //   // }

  //   // return Padding(
  //   //   padding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
  //   //   child: Container(
  //   //     width: MediaQuery.of(context).size.width * 0.25,
  //   //     child: ClipRRect(
  //   //         borderRadius: BorderRadius.circular(8.0),
  //   //         child: Image.asset(cafeImage[index])),
  //   //   ),
  //   // );
  // }

  Column cafeDescriptionColumn(int index, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          jaTitle[index],
          style: Theme.of(context).textTheme.subtitle2,
        ),
        Text(koTitle[index], style: Theme.of(context).textTheme.bodyText1),
        Text(enTitle[index], style: Theme.of(context).textTheme.bodyText1),
      ],
    );
  }

  final firestoreInstance = FirebaseFirestore.instance;
  List typeofCafe = ["ordinal", "cheap"];
  List showTitle = [
    '메가MGC커피',
    '빽다방',
    '더 벤티',
    '투썸플레이스',
    '공차',
    '할리스커피',
    '이디야 커피',
    '파스쿠치',
    '카페 봄봄',
  ];
  Future callTitle() async {
    for (int _j = 0; _j < typeofCafe.length; _j++) {
      await firestoreInstance.collection(typeofCafe[_j]).get().then((value) {
        // ignore: unnecessary_statements
        (value.docs.forEach((element) {
          if (showTitle.contains(element.data()['kotitle'])) {
            setState(() {
              enTitle.add(element.data()['title']);
              jaTitle.add(element.data()['jatitle']);
              koTitle.add(element.data()['kotitle']);
              cafeImage.add(element.data()['image']);
              cafeDescrip.add(element.data()['description']);
              cafeType.add(typeofCafe[_j]);
            });
          } else {}
        }));
      });
    }
  }
}

// class classofCafe extends StatefulWidget {
//   const classofCafe({Key? key}) : super(key: key);

//   @override
//   _classofCafeState createState() => _classofCafeState();
// }

// class _classofCafeState extends State<classofCafe> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Center(
//           child: Text(
//             "カフェの種類",
//             style: Theme.of(context).textTheme.subtitle1,
//           ),
//         ),
//         Container(
//           height: MediaQuery.of(context).size.height * 0.05,
//           width: MediaQuery.of(context).size.width * 0.9,
//           child: ListView(
//             scrollDirection: Axis.horizontal,
//             children: [
//               InkWell(
//                 onTap: () {
//                   setState(() {});
//                 },
//                 child: Container(
//                   width: MediaQuery.of(context).size.width * 0.4,
//                   child: Center(
//                     child: Text(
//                       "カフェ全体",
//                     ),
//                   ),
//                 ),
//               ),
//               Center(
//                 child: Text(
//                   "/",
//                   style: TextStyle(
//                     fontSize: 25,
//                     //fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {},
//                 child: Container(
//                   width: MediaQuery.of(context).size.width * 0.4,
//                   child: Center(
//                     child: Text(
//                       "フランチャイズカフェ（一般）",
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               ),
//               Text(
//                 "/",
//                 style: TextStyle(
//                   fontSize: 25,
//                   //fontWeight: FontWeight.bold,
//                 ),
//               ),
//               InkWell(
//                 onTap: () {},
//                 child: Container(
//                   width: MediaQuery.of(context).size.width * 0.4,
//                   child: Center(
//                     child: Text(
//                       "フランチャイズカフェ（安い）",
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               ),
//               Text(
//                 "/",
//                 style: TextStyle(
//                   fontSize: 25,
//                   //fontWeight: FontWeight.bold,
//                 ),
//               ),
//               InkWell(
//                 onTap: () {},
//                 child: Container(
//                   width: MediaQuery.of(context).size.width * 0.4,
//                   child: Center(
//                     child: Text(
//                       "個人カフェ",
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
