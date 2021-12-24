import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:iqraa_m3aya/data.dart';
import 'package:iqraa_m3aya/my_theme.dart';
import 'package:iqraa_m3aya/page_friends.dart';
import 'package:iqraa_m3aya/page_home.dart';
import 'package:iqraa_m3aya/page_profile.dart';

void main() {
  runApp(MyApp());
}

void snack(context, msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'أقرأ معايا',
      theme: ThemeData(
        fontFamily: 'Cairo',
        primarySwatch: MyColors.primarySwatch,
        primaryColor: MyColors.primaryColor,
        primaryColorDark: MyColors.primaryColorDark,
      ),
      home: HomePage(title: 'أقرا معايا'),
      //home: InitPage(title: 'أقرا معايا')
      //home: ReadingPage(
      //    book: 'رواية ما وراء العالم سسسسسسسسسسسسسسسسسئ',
      //    author: 'أحمد خالد توفيق'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  static const List<String> titles = [
    "Read With Me - أقرا معايا",
    'الملف الشخصي',
    'الأصدقاء'
  ];
  String title = titles[0];

  void updateTile(index) {
    setState(() {
      title = titles[index];
    });
  }

  late TabController tabController;
  final PageController pageController = PageController();
  final GlobalKey bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    final List<Book> books = [
      Book('يوتوبيا', 'أحمد خالد توفيق', MyImages.novel),
      Book('شآبيب', 'أحمد خالد توفيق', MyImages.novel),
      Book('يوتوبيا', 'أحمد خالد توفيق', MyImages.novel),
    ];
    final User user = User(
        id: '1234458275', name: 'Ahmed Aly', email: 'zepo@yahoo.com', img: MyImages.appLogo);

    final List<Reading> requests = [
      Reading(
        Book(
            'يوتوبيا',
            'أحمد خالد توفيقأحمد خالد توفيقأحمد خالد توفيقأحمد خالد توفيق',
            MyImages.novel),
        User(
            name: 'Sayed Hasan', email: 'ahmed@yahoo.com', img: MyImages.appLogo),
      ),
      Reading(
        Book(
            'يوتوبيا',
            'أحمد خالد توفيقأحمد خالد توفيقأحمد خالد توفيقأحمد خالد توفيق',
            MyImages.novel),
        User(
            name: 'Sayed Hasan', email: 'ahmed@yahoo.com', img: MyImages.appLogo),
      )
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(title, style: MyStyles.appBar),
          ]),
          /*
          bottom: TabBar(
            onTap: (i) {
              pageController.jumpToPage(i);
            },
            controller: tabController,
            tabs: [
              Tab(),
              Tab(icon: Icon(Icons.history, size: 0)),
              Tab(icon: Icon(Icons.emoji_people, size: 0)),
            ],
          ),*/
          actions: [Image.asset('assets/images/logo.png', height: 45)],
        ),
        body: PageView(
          controller: pageController,
          onPageChanged: (i) {
            tabController.index = i;
            updateTile(i);
            final FancyBottomNavigationState fState =
                bottomNavigationKey.currentState as FancyBottomNavigationState;
            fState.setPage(i);
          },
          pageSnapping: true,
          children: [
            PageHome(books: books, requests: requests),
            PageProfile(books: books, user: user),
            sectionFriends(),
          ],
        ),
        bottomNavigationBar: FancyBottomNavigation(
            initialSelection: 0,
            key: bottomNavigationKey,
            tabs: [
              TabData(iconData: Icons.home, title: ''),
              TabData(iconData: Icons.person, title: ""),
              TabData(iconData: Icons.emoji_people, title: "")
            ],
            onTabChangedListener: (i) {
              setState(() {
                pageController.jumpToPage(i);
                updateTile(i);
              });
            }),
      ),
    );
  }
}

class ButtonWithIcon extends StatelessWidget {
  ButtonWithIcon(this.text, this.icon,
      {this.callback, this.tint = MyColors.primaryColor});

  final String text;
  final IconData icon;
  final Color tint;
  final callback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: TextButton(
        onPressed: this.callback,
        child: Row(
          children: [
            Icon(
              icon,
              size: 15,
              color: tint,
            ),
            Padding(
              padding: EdgeInsets.only(right: 5, bottom: 2),
              child: Text(
                text,
                style: TextStyle(color: tint, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget divider(text) {
  return Row(children: <Widget>[
    Expanded(child: Divider()),
    Padding(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
      child: Text("   $text     "),
    ),
    Expanded(child: Divider()),
  ]);
}
