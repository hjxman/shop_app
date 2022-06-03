import 'package:flutter/material.dart';

class horizonatallist extends StatelessWidget {
  const horizonatallist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          category(
              image_caption: 'Tshirts',
              image_location: 'images/cats/tshirt.png'),
          category(
              image_caption: 'Shoes', image_location: 'images/cats/shoe.png'),
          category(
              image_caption: 'Jeans', image_location: 'images/cats/jeans.png'),
          category(
              image_caption: 'Informal',
              image_location: 'images/cats/informal.png'),
          category(
              image_caption: 'Formal',
              image_location: 'images/cats/formal.png'),
          category(
              image_caption: 'Dress', image_location: 'images/cats/dress.png'),
          category(
              image_caption: 'Accesories',
              image_location: 'images/cats/accessories.png')
        ],
      ),
    );
  }
}

class category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  category({required this.image_caption, required this.image_location});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100,
          child: ListTile(
            title: Image.asset(
              image_location,
              // width: 100.0,
              // height: 80.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(
                image_caption,
                style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 12.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
