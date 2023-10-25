import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:scale3c_homework/features/auth/presentation/pages/login_page.dart';
import 'package:scale3c_homework/features/auth/presentation/pages/singup_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
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
        ],
      ),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
