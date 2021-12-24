import 'package:flutter/material.dart';
import 'package:iqraa_m3aya/data.dart';
import 'package:iqraa_m3aya/main.dart';
import 'package:iqraa_m3aya/my_theme.dart';
import 'package:iqraa_m3aya/page_home.dart';

class PageProfile extends StatefulWidget {
  PageProfile({Key? key, required this.books, required this.user})
      : super(key: key);
  final User user;
  final List<Book> books;

  @override
  _PageProfile createState() => _PageProfile();
}

class _PageProfile extends State<PageProfile> {
  bool edit = false;

  void changeEdit(bool b) {
    setState(() {
      edit = b;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      // add this
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Visibility(
              visible: widget.user.id.isNotEmpty,
              child: sectionUser(widget.user),
            ),
            Visibility(
              visible: widget.user.id.isEmpty,
              child: TextButton(
                child: Text('قم بالتسجيل الآن'),
                onPressed: () {},
              ),
            ),
            divider('القراءات السابقة'),
            Visibility(
              visible: widget.books.isNotEmpty,
              child: ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: widget.books.length,
                itemBuilder: (BuildContext context, int position) {
                  Book book = widget.books[position];
                  return itemBook(book, () {}, buttonText: 'حذف');
                },
              ),
            ),
            Visibility(
                visible: widget.books.isEmpty,
                child: Text(
                  'أنت لم تقرأ أي كتب بعد!',
                  style: MyStyles.body,
                ))
          ],
        ),
      ),
    );
  }

  Widget sectionUser(User user) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(user.img),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 10, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    itemEditable(text: user.name, head: true, callback: () {}),
                    itemEditable(text: user.id, callback: () {})
                  ],
                ),
              ),
            ),
            Switch(
              value: edit,
              onChanged: (b) {
                changeEdit(b);
              },
            )
          ],
        ),
        itemEditable(
            text: 'أضف سيرتك الذاتية وتحدث عن نغسك',
            callback: () {
              print('bio');
            }),
        itemContact(Icons.email, text: user.email, callback: () {}),
        itemContact(Icons.facebook, text: user.facebook, callback: () {}),
        itemContact(Icons.link, text: user.website, callback: () {}),
        itemContact(Icons.phone, text: user.phone, callback: () {}),
      ],
    );
  }

  Widget itemContact(IconData icon, {text, callback}) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: MyColors.primaryColor,
          ),
          itemEditable(text: text, callback: callback)
        ],
      ),
    );
  }

  Widget itemEditable({String text: '', callback, head: false}) {
    if (text.isEmpty) text = 'تعديل';
    return GestureDetector(
      onTap: callback,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Text(text,
            style: edit
                ? (head ? MyStyles.header_u : MyStyles.body_u)
                : (head ? MyStyles.header : MyStyles.body)),
      ),
    );
  }
}
