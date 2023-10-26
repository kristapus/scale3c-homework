import 'package:go_router/go_router.dart';
import 'package:scale3c_homework/features/auth/presentation/pages/login_page.dart';
import 'package:scale3c_homework/features/auth/presentation/pages/singup_page.dart';
import 'package:scale3c_homework/features/profile/presentation/pages/profile_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/login',
  routes: <RouteBase>[
    GoRoute(
      path: '/login',
      builder: (context, state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) {
        return const SignupPage();
      },
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) {
        return const ProfilePage();
      },
    ),
  ],
);
