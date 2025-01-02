import 'package:flutter/material.dart';
import 'burger_page.dart';

class HamburgerList extends StatefulWidget {
  final int row;
  const HamburgerList({super.key, required this.row});

  @override
  State<HamburgerList> createState() => _HamburgerListState();
}

class _HamburgerListState extends State<HamburgerList> {
  @override
  Widget build(BuildContext context) {
    int items = 10;

    Widget burger1 = Container(
      height: 130,
      margin: EdgeInsets.only(left: 50, bottom: 50),
      child: Image.asset("images/burger1.png"),
    );

    Widget burger2 = Container(
      height: 140,
      margin: EdgeInsets.only(left: 50),
      child: Image.asset("images/burger2.png"),
    );

    return SliverToBoxAdapter(
      child: Container(
          height: widget.row == 2 ? 330 : 240,
          margin: EdgeInsets.only(top: 10),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items,
              itemBuilder: (context, index) {
                bool reverse = widget.row == 2 ? index.isEven : index.isOdd;
                return Stack(
                  children: [
                    Container(
                      height: 240,
                      width: 200,
                      margin: EdgeInsets.only(
                          left: 20, right: index == items ? 20 : 0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(BurgerPage.tag);
                        },
                        child: Card(
                          color: Theme.of(context).primaryColor,
                          elevation: 3,
                          margin: EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(45),
                                bottomRight: Radius.circular(15),
                                topLeft: Radius.circular(45),
                                topRight: Radius.circular(45)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                Text(
                                  reverse ? " Chicken Burger" : "Bacon Burger",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Spacer(),
                                    Text(
                                      "15,95 \$ CAN",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Icon(Icons.add),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: reverse ? 75 : 50,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(BurgerPage.tag);
                        },
                        child: reverse ? burger1 : burger2,
                      ),
                    ),
                  ],
                );
              })),
    );
  }
}
