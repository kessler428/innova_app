import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innova/bloc/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:innova/presentation/screens/dashboard/chat_screen.dart';
import 'package:innova/presentation/screens/dashboard/home_screen.dart';
import 'package:innova/presentation/screens/dashboard/invoices_screen.dart';
import 'package:innova/presentation/screens/dashboard/profile_screen.dart';
import 'package:innova/presentation/widgets/bottom_navigation_bar_widget.dart';

class DashboardScreen extends StatelessWidget {

  static const path = '/dashboard';
  static const pathName = 'dashboard';

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationBloc(),
      child: const Scaffold(
        body: _Screens(),
        bottomNavigationBar: CustomNavigatorBarWidget(),
      ),
    );
  }
}

class _Screens extends StatelessWidget {
  const _Screens({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return PageView(
          controller: state.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const HomeScreen(),
            const ChatScreen(),
            const InvoicesScreen(),
            ProfileScreen(),
          ],
        );
      },
    );
  }
}