import 'package:flutter/material.dart';
import 'package:innova/presentation/widgets/searches/searcher_shop_widget.dart';

class CardShopProductsWidget extends StatelessWidget {
  const CardShopProductsWidget({
    super.key,
    required this.products,
  });

  final List products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        const SearcherShopWidget(),
        
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Wrap(
            children: products.map((product) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                width: MediaQuery.of(context).size.width / 2 - 30,
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      product['image'],
                      width: MediaQuery.of(context).size.width / 2 - 30,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
        
                    
                    Text(
                      'C\$ ${product['price']} - ${product['name']}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
