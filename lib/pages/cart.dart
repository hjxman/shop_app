import 'package:flutter/material.dart';
import 'package:shop_app_mobb/Components/cart_product.dart';
class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        title: Text('Cart'),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
              )),
          // IconButton(
          //     onPressed: () {},
          //     icon: Icon(
          //       Icons.shopping_cart,
          //       color: Colors.white,
          //     )),
        ],
      ),
      body: cart_prod(),
      bottomNavigationBar: Container(
        child: Row(
          children: <Widget>[
            Expanded(
                child: ListTile(
              title: Text("Total :"),
              subtitle: Text("\$250"),
            )),
            Expanded(
                child: MaterialButton(
              onPressed: () {},
              child: Text(
                "Check out",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
            ))
          ],
        ),
      ),
    );
  }
}
