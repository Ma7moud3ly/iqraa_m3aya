import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:iqraa_m3aya/main.dart';

class ReadingPage extends StatefulWidget {
  ReadingPage({Key? key, required this.book, required this.author})
      : super(key: key);

  final String book;
  final String author;

  @override
  _ReadingPageState createState() => _ReadingPageState();
}

class _ReadingPageState extends State<ReadingPage> {
  late var tint;

  @override
  Widget build(BuildContext context) {
    tint = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            /** Do something */
          },
        ),
        title: Column(
          children: [
            Text(widget.book,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10, fontFamily: 'Cairo'),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
            Text(
              widget.author,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 8, fontFamily: 'Cairo'),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(left: 5, right: 20),
              child: Icon(
                Icons.photo_camera,
                size: 45,
              )),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              children: [
                TitleBubble(
                  'رواية يوتوبيا',
                  img: 'assets/images/novel.png',
                ),
                TitleBubble('للمؤلف أحمد خالد توفيق'),
                ChatBubble(
                  '" تزوجني يا جابر ... سأطون خادمة تحت قدميك " قلت لها إن الناس يجب ألا تتزوج إلا لكي تأتي للعالم بمن هو أفضل.. طفل أجمل منك..'
                  ' أفضل منك.. أغنى منك ماجدوى أن يتزوج الشقاء من التعاسة؟ '
                  '.. الهباب من الطين؟ مالجديد الذي سنقدمه للعالم سوى المزيد من البؤس؟',
                  user: 'asmaa ahmed',
                  img: 'assets/images/logo.png',
                ),
                ChatBubble(
                  'تيجي نقري رواية اماريتا ؟',
                  user: 'Ahmed Ali',
                ),
                ChatBubble(
                  'إيه رأيك فيها دي بقي؟',
                  user: 'بسمة',
                )
              ],
            )
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  ChatBubble(this.text, {this.user = '', this.img = ""});

  final String user;
  final String text;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      // add this
      textDirection: TextDirection.rtl,
      child: Bubble(
        nip: BubbleNip.rightTop,
        alignment: Alignment.topRight,
        padding: BubbleEdges.only(left: 20, right: 20),
        margin: BubbleEdges.only(top: 10),
        color: Theme.of(context).primaryColorLight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Visibility(
                child: Text(
                  user,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Majalla',
                    decoration: TextDecoration.underline,
                  ),
                ),
                visible: user != '',
              ),
            ),
            Visibility(
              child: Image(image: AssetImage(img)),
              visible: img != '',
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 11.0,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWithIcon('أعجبني', Icons.favorite,
                    tint: Colors.blue, callback: () {}),
                ButtonWithIcon('مشاركة', Icons.share,
                    tint: Colors.blueGrey, callback: () {}),
                ButtonWithIcon('مسح', Icons.delete,
                    tint: Colors.red, callback: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TitleBubble extends StatelessWidget {
  TitleBubble(this.text, {this.img = ""});

  final String text;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Bubble(
      stick: false,
      alignment: Alignment.center,
      margin: BubbleEdges.only(top: 10, bottom: 10),
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11.0,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.bold
            ),
          ),
          Visibility(
            child: Image(image: AssetImage(this.img)),
            visible: this.img != '',
          ),
        ],
      ),
    );
  }
}
