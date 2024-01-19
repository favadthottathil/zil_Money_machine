import 'package:flutter/material.dart';
import 'package:zil_money/Controller/cart_controller.dart';
import 'package:zil_money/Model/product_model.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<ProductModel> cartList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details Screen',
        ),
        actions: [
          Stack(
            children: [
              const Icon(
                Icons.badge,
                size: 30,
              ),
              Positioned(
                  child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 10,
                child: Center(
                  child: Text(
                    cartList.length.toString(),
                  ),
                ),
              ))
            ],
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 300,
              width: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(
                  widget.productModel.image.toString(),
                ),
              )),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  widget.productModel.title,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(child: Text(widget.productModel.price.toString())),
            ],
          ),
          const SizedBox(height: 20),
          Text(widget.productModel.description.toString()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            cartList.add(widget.productModel);
            print(cartList);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
