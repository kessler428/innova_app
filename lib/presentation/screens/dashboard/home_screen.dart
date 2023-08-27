import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:innova/presentation/screens/product/post_screen.dart';
import 'package:innova/presentation/widgets/cards/card_home_widget.dart';

import 'dashboard_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Inicio',
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
            return GestureDetector(
              onTap: () {
                context.go('${DashboardScreen.path}/${PostScreen.path}');
              },
              child: const CardHomeWidget()
            );
          },
        ),
      ),
    );
  }
}
