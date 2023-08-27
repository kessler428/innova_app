import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innova/bloc/auth/auth_bloc.dart';
import 'package:innova/config/router/app_router.dart';
import 'package:innova/config/theme/app_theme.dart';

void main() {
  
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc()),
      ],
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.appRouter,
      title: 'Flutter Demo',
      theme: AppTheme().getLightTheme(),
    );
  }
}
