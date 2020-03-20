import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/Widgets/orderitem.dart';


class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {



  final List<OrderItem> _items = <OrderItem>[
    new OrderItem(1, 'steak', 'Platter', 1, 30.0, 'assets/images/plaid1.jpg'),
    new OrderItem(
        2, 'salmon', 'Sandwich', 2, 10.0, 'assets/images/plaid2.jpg'),
    new OrderItem(3, 'Burger', 'Drink', 3, 8.0, 'assets/images/plaid3.jpg'),
    new OrderItem(4, 'Burrito', 'Drink', 1, 8.0, 'assets/images/plaid4.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          iconSize: 30.0,
          onPressed: (){},
          color: Color.fromRGBO(250, 98, 97,1),
          
        ),
        
          title: Image.asset('assets/images/titleLogo.png', fit: BoxFit.scaleDown, height: 60.0),
        
        
        ),


      body: new CustomScrollView(
        scrollDirection: Axis.vertical, 
        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: 600.0,
            pinned: true,  
            flexibleSpace: new FlexibleSpaceBar( 
              title: const Text("Results"), 
              background: new Image.asset("assets/images/sample.jpg",
                  fit: BoxFit.cover),
            ),
          ),
          new SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              sliver: new SliverFixedExtentList(
                itemExtent: 172.0,
                delegate: new SliverChildBuilderDelegate(




                    (builder, index) => _buildListItem(_items[index]),
                    childCount: _items.length),



              )),
          new SliverToBoxAdapter(
              child: new Container(
            height: 50.0,
            child: new InkWell(
              onTap: () {},
            ),
          ))
        ],




      ),


      // body: Column (children: <Widget>[

      //   Stack(children: <Widget>[

      //   Container(
      //     width: MediaQuery.of(context).size.width,
      //     height: 300,
      //     decoration: BoxDecoration(
      //       image: DecorationImage(
      //         fit: BoxFit.cover,
      //         image: AssetImage('assets/images/sample.jpg'),
      //       ),

      //     ),
      //   ),
      //   ],
      //   ),          
      //   ], 
      // ),


      
    );
  }



  Widget _buildListItem(OrderItem itm) {
    return new Card(
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Flexible(
            child: _buildColumn1(itm),
            flex: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildColumn1(OrderItem itm) {
    return new Column(
      children: <Widget>[
        new Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 15.0, top: 5.0),
            child: new InkWell(
              child: new Hero(
                child: new Image.asset(
                  '${itm.icon}',
                  width: 100.0,
                  height: 100.0,
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                ),
                tag: itm.id,
              ),
              onTap: () {
                Navigator.of(context).push(new PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (BuildContext context, _, __) {
                      return new Material(
                          color: Colors.black38,
                          child: new Container(
                            padding: const EdgeInsets.all(30.0),
                            child: new InkWell(
                              child: new Hero(
                                child: new Image.asset(
                                  '${itm.icon}',
                                  width: 300.0,
                                  height: 300.0,
                                  alignment: Alignment.center,
                                  fit: BoxFit.contain,
                                ),
                                tag: itm.id,
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ));
                    }));
              },
            ))
      ],
    );
  }


  Widget _buildBottomRow(double itemPrice, int qty) {
    return new Container(
        margin: const EdgeInsets.only(bottom: 10.0, right: 10.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Flexible(
              flex: 1,
              child: new Text(
                "Item Price",
              ),
            ),
            //  new SizedBox(width: 5.0,),
            new Flexible(
                flex: 1,
                child: new Text(
                  itemPrice.toStringAsPrecision(2),
                )),
            // new SizedBox(width: 10.0,),
            new Flexible(
              flex: 1,
              child: new Text(
                "Total",
              ),
            ),
            new SizedBox(
              width: 5.0,
            ),
            new Flexible(
                flex: 1,
                child: new Text(
                  (qty * itemPrice).toString(),
                ))
          ],
        ));
  }










}

