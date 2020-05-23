import 'package:Shopping/providers/cart.dart';
import 'package:Shopping/providers/orders.dart';
import 'package:Shopping/widgets/cartItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key key}) : super(key: key);
  static const routeName = '\Cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Your Cart")),
      body: Column(children: [
        Card(
          margin: EdgeInsets.all(15),
          child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total", style: TextStyle(fontSize: 20)),
                  SizedBox(width: 10),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                          color:
                              Theme.of(context).primaryTextTheme.title.color),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                          cart.items.values.toList(), cart.totalAmount);
                      cart.clear();
                    },
                    child: Text(
                      "Order Now",
                    ),
                    textColor: Theme.of(context).primaryColor,
                  )
                ],
              )),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) {
            return CartItem(
              id: cart.items.values.toList()[index].id,
              price: cart.items.values.toList()[index].price,
              title: cart.items.values.toList()[index].title,
              quantity: cart.items.values.toList()[index].quantity,
              productId: cart.items.keys.toList()[index],
            );
          },
          itemCount: cart.items.length,
        )),
      ]),
    );
  }
}
