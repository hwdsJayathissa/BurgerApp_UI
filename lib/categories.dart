import "package:flutter/material.dart";

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int currentSelectedItem = 0;
  @override
  Widget build(BuildContext context) {
    int items = 10;
    return SliverToBoxAdapter(
      child: Container(
        height: 100,
        margin: EdgeInsets.only(top: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items,
          itemBuilder: (context, index) => Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    margin:
                        EdgeInsets.only(left: index == 0 ? 20 : 0, right: 20),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentSelectedItem = index;
                        });
                      },
                      child: Card(
                        color: index == currentSelectedItem
                            ? Colors.black
                            : Colors.white,
                        elevation: 3,
                        margin: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: Icon(Icons.fastfood,
                            color: index == currentSelectedItem
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  margin: EdgeInsets.only(left: index == 0 ? 20 : 0, right: 20),
                  width: 90,
                  child: Row(
                    children: [
                      Spacer(),
                      Text("Burger"),
                      Spacer(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
