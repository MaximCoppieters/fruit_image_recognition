import 'package:arator/components/PageBodyContainer.dart';
import 'package:flutter/material.dart';

import 'data/Produce.dart';

class SellerTab extends StatefulWidget {
  @override
  _SellerTabState createState() => _SellerTabState();
}

class _SellerTabState extends State<SellerTab> {
  List<Produce> produce = [
    Produce("Apples", "assets/images/apples.jpg"),
    Produce("Lettuce", "assets/images/lettuce.jpg"),
    Produce("Pears", "assets/images/pears.jpg"),
    Produce("Tomatoes", "assets/images/tomatoes.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(
              "My Products",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
            floating: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/produce.jpg",
                fit: BoxFit.cover,
              ),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                        text:
                            "10 products Sold\n 4 Products for sale\n€100 earnings this month\n€2100 total earnings",
                        style: Theme.of(context).tabBarTheme.labelStyle),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200.0,
                    mainAxisSpacing: 30.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 1.5),
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Card(
                      child: Column(
                    children: <Widget>[
                      Text(
                        produce[index].name,
                        style: TextStyle(fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          produce[index].imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ));
                }, childCount: produce.length)),
            padding: EdgeInsets.all(2),
          ),
          // Place sliver widgets here
        ],
      ),
    );
  }
}
