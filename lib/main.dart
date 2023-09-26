// ignore_for_file: depend_on_referenced_packages

import 'package:deeplink_cookbook/core/models/models.dart';
import 'package:deeplink_cookbook/presentation/web_page/main_responsive/web_responsive_confirm.dart';
import 'package:deeplink_cookbook/presentation/web_page/main_responsive/web_responsive_success.dart';
import 'package:deeplink_cookbook/presentation/web_page/main_responsive/web_responsive_with_otp.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  usePathUrlStrategy();
  return runApp(MaterialApp.router(
    debugShowCheckedModeBanner: false,
    routerConfig: router,
    theme: ThemeData(fontFamily: 'RobotoMedium'),
  ));
}

/// This handles '/' and '/details'.
/// FOR MOBILE
// final router = GoRouter(
//   routes: [
//     GoRoute(
//       path: '/',
//       builder: (_, __) {
//         return Scaffold(
//         appBar: AppBar(title: const Text('Home Screen')),
//       );
//       },
//       routes: [
//         GoRoute(
//           path: 'checkout/:id',
//           builder: (_, state) {
//             final id = state.pathParameters["id"];
//             return const MobileConfirmScreen();
//           },
//         ),
//       ],
//     ),
//   ],
// );

/// FOR WEB
///
final router = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        builder: (_, __) => Scaffold(
              appBar: AppBar(
                backgroundColor: CONST.white,
                centerTitle: true,
                title: const Text("Not Found"),
              )
        ,
              body: const Center(
                child: Text(
                  "Page Not Found",
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
        routes: [
          GoRoute(
              path: 'checkout/:id',
              builder: (_, state) {
                //final id = state.pathParameters['id'];
                return WebResponsive();
              }),
          GoRoute(
              name: 'confirm',
              path: 'confirm',
              builder: (_, __) => WebResponsiveWithOTP()),
          GoRoute(
              name: 'success',
              path: 'success',
              builder: (_, __) => WebResponsiveSuccess()),
        ]),
  ],
);
