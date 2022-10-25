import 'package:flutter/material.dart';

Route createFadeInRoute({required RoutePageBuilder routePageBuilder}) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 600),
    reverseTransitionDuration: const Duration(milliseconds: 600),
    pageBuilder: routePageBuilder,
    transitionsBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
    ) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
