import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innova/bloc/bottom_navigation/bottom_navigation_bloc.dart';

class CustomNavigatorBarWidget extends StatelessWidget {
  const CustomNavigatorBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final currentIndex = context.select((BottomNavigationBloc bloc) => bloc.state.actualPage);

    return BottomAppBar(
      elevation: 0,
      height: 60,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                currentIndex == 0 ? Icons.home : Icons.home_outlined,
                size: 30,
                color: Colors.grey[600],
              ),
              onPressed: () => context.read<BottomNavigationBloc>().add(const OnChangePage(0)),
            ),
            IconButton(
              icon: Icon(
                currentIndex == 1 ? Icons.chat : Icons.chat_outlined,
                size: 30,
                color: Colors.grey[600],
              ),
              onPressed: () => context.read<BottomNavigationBloc>().add(const OnChangePage(1)),
            ),
            IconButton(
              icon: Icon(
                currentIndex == 2 ? Icons.receipt : Icons.receipt_outlined,
                size: 30,
                color: Colors.grey[600],
              ),
              onPressed: () => context.read<BottomNavigationBloc>().add(const OnChangePage(2)),
            ),
            IconButton(
              icon: Icon(
                currentIndex == 3 ? Icons.person : Icons.person_outlined,
                size: 30,
                color: Colors.grey[600],
              ),
              onPressed: () => context.read<BottomNavigationBloc>().add(const OnChangePage(3)),
            ),
          ],
        ),
      ),
    );
  }
}
