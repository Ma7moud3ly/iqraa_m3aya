import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iqraa_m3aya/data.dart';
import 'package:iqraa_m3aya/main.dart';
import 'package:iqraa_m3aya/my_theme.dart';
import 'package:iqraa_m3aya/page_profile.dart';

class PageHome extends StatefulWidget {
  PageHome({Key? key, required this.books, required this.requests})
      : super(key: key);
  final List<Reading> requests;
  final List<Book> books;

  @override
  _PageHome createState() => _PageHome();
}

class _PageHome extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      // add this
      textDirection: TextDirection.rtl,
      child: ListView(
        padding: EdgeInsets.all(10),
        children: [
          divider('طلبات القراءة'),
          Visibility(
            visible: widget.books.isNotEmpty,
            child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: widget.requests.length,
              itemBuilder: (BuildContext context, int position) {
                Reading request = widget.requests[position];
                return itemReading(request);
              },
            ),
          ),
          Visibility(
              visible: widget.requests.isEmpty,
              child: Text(
                'لا يوجد طلبات قراءة جديدة!',
                style: MyStyles.body,
              )),
          divider('تقرأ حالياً'),
          Visibility(
            visible: widget.books.isNotEmpty,
            child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: widget.books.length,
              itemBuilder: (BuildContext context, int position) {
                Book book = widget.books[position];
                return itemBook(book, () {});
              },
            ),
          ),
          Visibility(
              visible: widget.books.isEmpty,
              child: Text(
                'لا يوجد كتب قيد القراءة!',
                style: MyStyles.body,
              )),
        ],
      ),
    );
  }
}

Widget itemReading(Reading reading, {double radius: 30}) {
  return Padding(
    padding: EdgeInsets.only(top: 5, bottom: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: radius * 4,
          child: Stack(
            children: [
              Positioned(
                right: radius + 10,
                child: CircleAvatar(
                  radius: radius,
                  backgroundImage: AssetImage(reading.user.img),
                ),
              ),
              CircleAvatar(
                radius: radius,
                backgroundImage: AssetImage(reading.book.img),
              )
            ],
          ),
        ),
        Expanded(
            child: Container(
          padding: EdgeInsets.only(right: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(reading.book.name, style: MyStyles.header),
              Text(reading.user.name, style: MyStyles.body)
            ],
          ),
        )),
        ButtonWithIcon(
          'قبول',
          Icons.book,
          callback: () {},
        ),
        ButtonWithIcon(
          'رفض',
          Icons.close,
          callback: () {},
        ),
      ],
    ),
  );
}

Widget itemBook(Book book, callback, {showButton: true, buttonText = 'انتهي'}) {
  return Container(
    padding: EdgeInsets.only(bottom: 5),
    child: TextButton(
      onPressed: () {
        print(book.author);
      },
      child: Row(children: [
        Image(
          image: AssetImage(book.img),
          height: 80,
          width: 70,
          fit: BoxFit.cover,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(right: 10, left: 10),
            color: Colors.white10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.name,
                  style: MyStyles.header,
                ),
                Text(
                  book.author,
                  style: MyStyles.body,
                )
              ],
            ),
          ),
        ),
        Visibility(
          visible: showButton,
          child: ButtonWithIcon(
            buttonText,
            Icons.close,
            callback: callback,
          ),
        ),
      ]),
    ),
  );
}
