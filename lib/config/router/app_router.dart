import 'package:go_router/go_router.dart';
import 'package:innova/presentation/screens/auth/login_screen.dart';
import 'package:innova/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:innova/presentation/screens/product/post_screen.dart';

class AppRouter {

  static final appRouter = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: LoginScreen.path,
        name: LoginScreen.pathName,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: DashboardScreen.path,
        name: DashboardScreen.pathName,
        builder: (context, state) => const DashboardScreen(),
        routes: [
          GoRoute(
            path: PostScreen.path,
            name: PostScreen.pathName,
            builder: (context, state) => const PostScreen(),
          ),
        ],
      ),

    ]
  );

}