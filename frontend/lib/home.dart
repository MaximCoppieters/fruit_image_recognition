import 'package:arator/product_detail_page.dart';
import 'package:flutter/material.dart';

import 'buyer_tab.dart';
import 'favorite_tab.dart';
import 'profile_tab.dart';
import 'seller_tab.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  void _nextPage(int page) {
    _tabController.animateTo(page);
    _tabController.index = page;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
                icon: IconButton(
              icon: Icon(Icons.shopping_basket),
              color: _tabController.index == 0 ? Colors.blue : Colors.grey,
              onPressed: () {
                _nextPage(0);
              },
            )),
            Tab(
                icon: IconButton(
              icon: Icon(Icons.favorite),
              color: _tabController.index == 1 ? Colors.red : Colors.grey,
              onPressed: () {
                _nextPage(1);
              },
            )),
            Tab(
                icon: IconButton(
              icon: Icon(Icons.shop_two),
              color: _tabController.index == 2
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
              onPressed: () {
                _nextPage(2);
              },
            )),
            Tab(
                icon: IconButton(
              icon: Icon(Icons.account_circle),
              color: _tabController.index == 3 ? Colors.black : Colors.grey,
              onPressed: () {
                _nextPage(3);
              },
            )),
          ],
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            ProductDetailPage(),
            FavoriteTab(),
            SellerTab(),
            ProfileTab()
          ],
        ));
  }
}
