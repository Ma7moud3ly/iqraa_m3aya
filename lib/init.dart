import 'package:flutter/material.dart';
import 'package:iqraa_m3aya/main.dart';
import 'package:iqraa_m3aya/my_theme.dart';

class InitPage extends StatefulWidget {
  InitPage({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  TextEditingController bookName = TextEditingController();
  TextEditingController bookAuthor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      // add this
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.primaryColor,
          centerTitle: true,
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("قراءة جديدة"),
            Image.asset(
              'assets/images/logo.png',
              height: 50,
            )
          ]),
        ),
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ReadingInput('اسم الكتاب أو الرواية', bookName),
            ReadingInput('اسم المؤلف', bookAuthor),
            OutlinedButton(
                onPressed: () {
                  if (bookName.text.isEmpty)
                    snack(context, "ادخل اسم الكتاب من فضلك!");
                },
                child: Text('بدأ القراءة'))
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
            ),
      ),
    );
  }
}

class ReadingInput extends StatelessWidget {
  ReadingInput(this.text, this.controller);

  final String text;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: text,
        ),
      ),
    );
  }
}
