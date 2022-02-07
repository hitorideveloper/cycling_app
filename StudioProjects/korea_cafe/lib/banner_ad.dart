import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMob extends StatefulWidget {
  @override
  _AdMobState createState() => _AdMobState();
}

class _AdMobState extends State<AdMob> {
  AdWidget? adWidget;
  Container? adContainer;

  final BannerAd myBanner = BannerAd(
    adUnitId: Platform.isIOS
        ? 'ca-app-pub-8425497784520862/1618358604'
        //? 'ca-app-pub-3940256099942544/2934735716' //테스트아이디
        : 'ca-app-pub-3940256099942544/8865242552', //테스트 아이디
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );

  @override
  void initState() {
    // TODO: implement initState
    Future(() async => await myBanner.load()).then((_) {
      if (!mounted) return;
      setState(() {
        adWidget = AdWidget(
          ad: myBanner,
        );
        adContainer = Container(
          alignment: Alignment.center,
          child: adWidget,
          width: myBanner.size.width.toDouble(),
          height: myBanner.size.height.toDouble(),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: adContainer);
  }
}
