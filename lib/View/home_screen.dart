import 'package:flutter/material.dart';
import 'package:zil_money/Controller/product_controller.dart';
import 'package:zil_money/Model/product_model.dart';
import 'package:zil_money/View/details_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
        future: ProductController().getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<ProductModel> produts = snapshot.data!;

            return Scaffold(
              appBar: AppBar(
                title: const Text('Product Screen'),
                centerTitle: true,
                actions: const [
                  Icon(Icons.badge),
                  SizedBox(width: 20),
                ],
              ),
              body: GridView.builder(
                itemCount: produts.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 30,
                  mainAxisExtent: 200,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  final product = produts[index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(productModel: product),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(product.image.toString()),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            product.title,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(product.price.toString()),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              // floatingActionButton: FloatingActionButton(
              //   onPressed: () {
              //     setState(() {
              //       CartController().cartList.add(product1!);
              //     });
              //   },
              //   child: const Icon(Icons.add),
              // ),
            );
          } else {
            return const Scaffold(
              body: SafeArea(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
        });
  }
}
