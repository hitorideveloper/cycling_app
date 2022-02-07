class Memo {
  //final String? id;

  final String? cafeName;
  final String? jpTitle;
  final String? korTitle;
  final String? enTitle;
  final String? yomi;
  final String? type;
  final String? price;
  final String? explanation;
  final String? imageUrl;
  final String? tag;
  final int? tagNum;
  // final String? imText;
  // final String? imYomi;
  // final String? imMean;

  //Memo({this.id, this.title, this.text, this.createTime, this.editTime});
  Memo({
    // this.imText,
    // this.imYomi,
    // this.imMean,
    this.tag,
    this.tagNum,
    this.cafeName,
    this.jpTitle,
    this.korTitle,
    this.enTitle,
    this.yomi,
    this.type,
    this.price,
    this.explanation,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'tag': tag,
      "tagNum": tagNum,
      'cafeName': cafeName,
      'jpTitle': jpTitle,
      'korTitle': korTitle,
      'enTitle': enTitle,
      'yomi': yomi,
      'type': type,
      'price': price,
      'explanation': explanation,
      'imageUrl': imageUrl,
    };
  }

  // 각 memo 정보를 보기 쉽도록 print 문을 사용하여 toString을 구현하세요
  @override
  String toString() {
    return 'Memo{text: $tag, $cafeName, $korTitle, $enTitle, $jpTitle, $yomi, $price, $explanation}';

    //return 'Memo{id: $id, title: $title, text: $text, createTime: $createTime, editTime: $editTime}';
  }
}
