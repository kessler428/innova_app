import 'package:flutter/material.dart';

class SearcherShopWidget extends StatelessWidget {
  const SearcherShopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Buscar productos',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          suffixIcon: const Icon(Icons.search)
        ),
      ),
    );
  }
}