import 'package:flutter/material.dart';
import 'header.dart';
import 'categories.dart';
import 'hamburgers_list.dart';
import 'burger_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.teal,
          cardColor: Colors.white,
          appBarTheme: AppBarTheme(
            color: Colors.teal,
            centerTitle: true,
          ),
          bottomAppBarTheme: BottomAppBarTheme(color: Colors.teal),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.orange, shape: CircleBorder())),
      home: Hamberger(),
      routes: {BurgerPage.tag: (_) => BurgerPage()},
      debugShowCheckedModeBanner: false,
    );
  }
}

// ignore: use_key_in_widget_constructors
class Hamberger extends StatefulWidget {
  @override
  State<Hamberger> createState() => _HambergerState();
}

class _HambergerState extends State<Hamberger> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          pinned: true,
          title: Text("Deliver Me", style: TextStyle(color: Colors.white)),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
            color: Colors.white,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart),
              color: Colors.white,
            )
          ],
        ),
        Header(),
        Categories(),
        HamburgerList(
          row: 1,
        ),
        HamburgerList(row: 2),
      ]),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.home,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(45),
        ),
        child: Container(
          color: Colors.black38,
          child: BottomAppBar(
              shape: CircularNotchedRectangle(),
              child: Row(
                children: [
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add_alert),
                    color: Colors.white,
                  ),
                  Spacer(),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.turned_in),
                      color: Colors.white),
                  Spacer(),
                ],
              )),
        ),
      ),
    );
  }
}
