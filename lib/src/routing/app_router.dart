import 'package:ai_manager/src/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart' hide PhoneAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
// part 'app_router.g.dart';

enum AppRoutes {
  login('/login'),
  home('/');

  final String path;

  const AppRoutes(this.path);
}

// @riverpod
// GoRouter goRouter(GoRouterRef ref) {
//   return GoRouter(routes: [
//     GoRoute(
//         path: '/login',
//         name: AppRoutes.login.name,
//         pageBuilder: (context, state) =>
//             const NoTransitionPage(child: LoginScreen())),
//   ]);
// }

final goRouterProvider = Provider<GoRouter>((ref) {
  final providers = [PhoneAuthProvider()];
  return GoRouter(
      initialLocation: FirebaseAuth.instance.currentUser == null
          ? AppRoutes.login.path
          : AppRoutes.home.path,
      redirect: (context, state) async {
        // 리다이렉트
      },
      routes: [
        GoRoute(
            path: AppRoutes.login.path,
            name: AppRoutes.login.name,
            builder: (context, state) => const LoginScreen())
      ]);
});
