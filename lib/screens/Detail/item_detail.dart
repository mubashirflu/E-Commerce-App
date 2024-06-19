import 'package:flutter/material.dart';
import 'package:pratice_language_app/models/product_model.dart';
import 'package:pratice_language_app/screens/constant.dart';

class ItemDetail extends StatelessWidget {
  final Product product;
  const ItemDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          product.title,
          style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$${product.price}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 25),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Container(
                      width: 55,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: kprimaryColor,
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            product.rate.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      product.review,
                      style: const TextStyle(color: Colors.grey, fontSize: 15),
                    )
                  ],
                ),
              ],
            ),
            const Spacer(),
            Text.rich(TextSpan(children: [
              const TextSpan(text: "Seller:", style: TextStyle(fontSize: 16.0)),
              TextSpan(
                  text: product.seller,
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold)),
            ]))
          ],
        )
      ],
    );
  }
}
