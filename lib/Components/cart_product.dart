import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cart_prod extends StatefulWidget {
  const cart_prod({Key? key}) : super(key: key);

  @override
  _cart_prodState createState() => _cart_prodState();
}

class _cart_prodState extends State<cart_prod> {
  var prod_on_cart = [
    {
      "name": "Blazzer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 100,
      "price": 85,
      "size": "M",
      "color": "Black",
      "quantity": 2,
    },
    {
      "name": "Red dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 200,
      "price": 100,
      "size": "xxl",
      "color": "Red", 
      "quantity": 2,
    },
    // {
    //   "name": "Blazzer",
    //   "picture": "images/products/blazer2.jpeg",
    //   "old_price": 100,
    //   "price": 85,
    //   "size": "M",
    //   "color": "Black",
    //   "quantity": 2,
    // },
    // {
    //   "name": "Red dress",
    //   "picture": "images/products/dress2.jpeg",
    //   "old_price": 200,
    //   "price": 100,
    //   "size": "xl",
    //   "color": "Red",
    //   "quantity": 2,
    // },
    // {
    //   "name": "Blazzer",
    //   "picture": "images/products/hills1.jpeg",
    //   "old_price": 100,
    //   "price": 85,
    //   "size": "9",
    //   "color": "Black2",
    //   "quantity": 2,
    // },
    // {
    //   "name": "Red dress",
    //   "picture": "images/products/hills2.jpeg",
    //   "old_price": 200,
    //   "price": 100,
    //   "size": "10",
    //   "color": "Red",
    //   "quantity": 2,
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: prod_on_cart.length,
        itemBuilder: (context, index) => single_cart_product(
              cart_prod_name: prod_on_cart[index]["name"],
              cart_prod_color: prod_on_cart[index]["color"],
              cart_prod_size: prod_on_cart[index]["size"],
              cart_prod_qty: prod_on_cart[index]["quantity"],
              cart_prod_price: prod_on_cart[index]["price"],
              cart_prod_picture: prod_on_cart[index]["picture"],
            ));
  }
}

class single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_price;
  final cart_prod_picture;
  final cart_prod_qty;
  final cart_prod_color;
  final cart_prod_size;

  const single_cart_product(
      {this.cart_prod_name,
      this.cart_prod_price,
      this.cart_prod_picture,
      this.cart_prod_qty,
      this.cart_prod_color,
      this.cart_prod_size});

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.all(5),
      child: ListTile(
          leading: Image.asset(
            cart_prod_picture,
            height: 100,
            width: 60,
          ),
          title: Text(cart_prod_name),
          subtitle: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                      child: Text("Size:")),
                  Padding(
                      padding: EdgeInsets.all(8), child: Text(cart_prod_size)),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 8, 8, 8),
                    child: Text("Color:"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      cart_prod_color,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.fromLTRB(20, 8, 8, 8),
                  //   child: Text("Price:"),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.all(4),
                  //   child: Text(
                  //     "${cart_prod_price}",
                  //     style: TextStyle(color: Colors.grey),
                  //   ),
                  // ),
                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "\$${cart_prod_price}",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              )
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: Icon(Icons.arrow_drop_up))),
              Expanded(child: Text("1")),
              Expanded(
                  child: IconButton(
                // padding: EdgeInsets.zero,
                icon: Icon(Icons.arrow_drop_down),
                onPressed: () {},
              ))
            ],
          )),
    );
  }
}
