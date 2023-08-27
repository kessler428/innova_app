import 'package:flutter/material.dart';
import 'package:innova/presentation/widgets/cards/card_invoice_widget.dart';

class InvoicesScreen extends StatelessWidget {
  const InvoicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mis Compras',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return CardInvoiceWidget(index: index);
          },
        )
      ),
    );
  }
}
