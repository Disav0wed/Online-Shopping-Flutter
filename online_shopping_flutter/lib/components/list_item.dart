import 'package:flutter/material.dart';
import 'package:online_shopping_flutter/model/item_detail.dart';

class ListItem extends StatelessWidget {
  final ItemDetail itemDetail;

  ListItem(this.itemDetail);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 15,
      color: Colors.white70,
      child: Column(
        children: [
          Image.network(
            'https://mcdn01.gittigidiyor.net/67813/tn50/678134228_tn50_0.jpg',
            alignment: Alignment.topCenter,
          ),
          Text(
            itemDetail.name,
          ),
          Text(
            itemDetail.description,
          ),
          Text(
            itemDetail.price,
          )
        ],
      ),
    );
  }
}
