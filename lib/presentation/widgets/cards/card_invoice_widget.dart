import 'package:flutter/material.dart';

class CardInvoiceWidget extends StatelessWidget {
  
  const CardInvoiceWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Factura #${index + 1}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Cell Center',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '· MACBOOK PRO 2021',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                '· IPHONE 12 PRO MAX',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                '· AIRPODS PRO',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \$${index + 1}000',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'fecha: 01/01/2021',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}