import 'package:flutter/material.dart';
import 'package:iqraa_m3aya/data.dart';
import 'package:iqraa_m3aya/main.dart';
import 'package:iqraa_m3aya/my_theme.dart';

Widget sectionFriends() {
  final List<User> friends = [
    User(name: 'Ahmed Aly', email: 'ahmed@yahoo.com', img: MyImages.appLogo),
    User(name: 'Sayed Hasan', email: 'ahmed@yahoo.com', img: MyImages.appLogo)
  ];
  final List<User> friendRequests = [
    User(name: 'Ahmed Aly', email: 'ahmed@yahoo.com', img: MyImages.appLogo),
    User(name: 'Sayed Hasan', email: 'ahmed@yahoo.com', img: MyImages.appLogo)
  ];
  return Directionality(
    // add this
    textDirection: TextDirection.rtl,
    child: Padding(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: [
          Visibility(
            visible: friendRequests.isNotEmpty,
            child: Column(
              children: [
                divider('الطلبات الجديدة'),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: friendRequests.length,
                  itemBuilder: (BuildContext context, int position) {
                    User user = friends[position];
                    return itemFriend(user,accept: true);
                  },
                ),
                divider('أصدقائي')
              ],
            ),
          ),
          Visibility(
            visible: friends.isNotEmpty,
            child: Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: friends.length,
                itemBuilder: (BuildContext context, int position) {
                  User user = friends[position];
                  return itemFriend(user);
                },
              ),
            ),
          ),
          Visibility(
            visible: friends.isEmpty,
            child: Text(
              'لا يوجد لديك أصدقاء يقرأون حتي الآن!',
              style: MyStyles.body,
            ),
          )
        ],
      ),
    ),
  );
}

Widget itemFriend(User user, {accept: false}) {
  return Padding(
    padding: EdgeInsets.only(top: 5, bottom: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(user.img),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.name, style: MyStyles.header),
              Text(user.email, style: MyStyles.body)
            ],
          ),
        ),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Visibility(
                visible: accept,
                child: ButtonWithIcon(
                  'قبول',
                  Icons.app_blocking,
                  callback: () {},
                )),
            ButtonWithIcon(
              'حذف',
              Icons.delete,
              callback: () {},
            ),
          ],
        ))
      ],
    ),
  );
}
