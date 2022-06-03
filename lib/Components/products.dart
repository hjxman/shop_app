import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop_app_mobb/pages/prod_details.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var prod_list = [
    {
      "name": "Blazzer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 100,
      "price": 85,
    },
    {
      "name": "Red dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 200,
      "price": 100,
    },
    {
      "name": "Blazzer",
      "picture": "images/products/blazer2.jpeg",
      "old_price": 100,
      "price": 85,
    },
    {
      "name": "Red dress",
      "picture": "images/products/dress2.jpeg",
      "old_price": 200,
      "price": 100,
    },
    {
      "name": "Blazzer",
      "picture": "images/products/hills1.jpeg",
      "old_price": 100,
      "price": 85,
    },
    {
      "name": "Red dress",
      "picture": "images/products/hills2.jpeg",
      "old_price": 200,
      "price": 100,
    },
    {
      "name": "Red dress",
      "picture": "images/products/hills2.jpeg",
      "old_price": 200,
      "price": 100,
    },
    {
      "name": "Red dress",
      "picture": "images/products/hills2.jpeg",
      "old_price": 200,
      "price": 100,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: prod_list.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: singleprod(
            prod_name: prod_list[index]['name'],
            prod_picture: prod_list[index]['picture'],
            prod_old_price: prod_list[index]['old_price'],
            prod_price: prod_list[index]['price'],
          ),
        );
      },
    );
  }
}

class singleprod extends StatelessWidget {
  final prod_name;
  final prod_price;
  final prod_picture;
  final prod_old_price;

  const singleprod(
      {this.prod_name,
      this.prod_price,
      this.prod_picture,
      this.prod_old_price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: Text("jai shivaji"),
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => productdetails(
                      prod_detail_name: prod_name,
                      prod_detail_new_price: prod_price,
                      prod_detail_old_price: prod_old_price,
                      prod_detail_picture: prod_picture,
                    ))),
            child: GridTile(
              footer: Container(
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      prod_name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                    Text(
                      "\$${prod_price}",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              child: Image.asset(
                prod_picture,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
