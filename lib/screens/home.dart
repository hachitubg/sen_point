import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: CustomSliverDelegate(expandedHeight: 150),
            pinned: true,
            floating: false,
          ),
          SliverList(delegate: SliverChildListDelegate(_buildList(50)))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              title: Text('1'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.pause_circle_outline,
                color: Colors.black54,
              ),
              title: Text('2'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_balance_wallet,
                color: Colors.black54,
              ),
              title: Text('3'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.adjust,
                color: Colors.black54,
              ),
              title: Text('4'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.airline_seat_recline_extra,
                color: Colors.black54,
              ),
              title: Text('5'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.supervised_user_circle,
                color: Colors.black54,
              ),
              title: Text('6'),
            )
          ]),
    );
  }
}

List _buildList(int count) {
  List<Widget> listItems = List();

  for (int i = 0; i < count; i++) {
    listItems.add(Padding(
        padding: EdgeInsets.all(20.0),
        child: Text('List view ${i.toString()}',
            style: TextStyle(fontSize: 25.0))));
  }

  return listItems;
}

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;

  CustomSliverDelegate({
    @required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = expandedHeight / 2 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;

    return SizedBox(
      height: expandedHeight + expandedHeight / 2,
      child: Stack(
        children: [
          SizedBox(
            height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
            child: Container(
              child: Opacity(
                opacity: percent,
                child: AppBar(
                    title: Container(
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                            color: Colors.blue[300],
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.search),
                            Text("   Tìm kiếm", style: TextStyle(fontSize: 14))
                          ],
                        )),
                    actions: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.notifications,
                              size: 26.0,
                            ),
                          ))
                    ]),
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
          ),
          Center(
            child: Opacity(
              opacity: (shrinkOffset / expandedHeight) > 1.0
                  ? 1.0
                  : shrinkOffset / expandedHeight,
              child: Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.only(top: 18.0, left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.ac_unit,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.attach_money,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.account_balance_wallet,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.beach_access,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.notifications,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: cardTopPosition > 0 ? cardTopPosition : 0,
            bottom: 0.0,
            child: Opacity(
              opacity: percent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30 * percent),
                child: Card(
                  elevation: 10.0,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              "  Tham gia Sen Point ngay!",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Divider(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Icon(Icons.accessible_forward),
                                Text("Tích điểm",
                                    style: TextStyle(fontSize: 12.0)),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Icon(Icons.accessibility_new),
                                Text("Dùng điểm",
                                    style: TextStyle(fontSize: 12.0))
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Icon(Icons.queue),
                                Text("Quét QR",
                                    style: TextStyle(fontSize: 12.0))
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Icon(Icons.monetization_on),
                                Text("Hoàn tiền",
                                    style: TextStyle(fontSize: 12.0))
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight / 2;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
