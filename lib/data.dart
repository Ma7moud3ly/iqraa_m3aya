class Book {
  Book(this.name, this.author, this.img);

  final String name;
  final String author;
  final String img;
}

class User {
  User(
      {this.name = '',
      this.email = '',
      this.id = '',
      this.img = '',
      this.website = '',
      this.facebook = '',
      this.phone = ''});

  String name;
  String email;
  String facebook;
  String phone;
  String website;
  String id;
  String img;
}

class Reading {
  Reading(this.book, this.user);

  final Book book;
  final User user;
}
