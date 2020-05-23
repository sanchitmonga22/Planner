import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/EditProducts';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
            child: SingleChildScrollView(
          child: Column(
            children: [
              ListView(children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Title'),
                  textInputAction: TextInputAction.next,
                )
              ]),
            ],
          ),
        )),
      ),
    );
  }
}
