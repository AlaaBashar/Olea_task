import 'package:flutter/material.dart';

class SlidePageRoute extends PageRouteBuilder {
  final Widget child;

  SlidePageRoute(this.child)
      : super(
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation secondAnimation, Widget child) {
            var animations = Tween<Offset>(
                    begin: const Offset(1, 0), end: const Offset(0, 0))
                .animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeIn,
            ));
            return SlideTransition(
              position: animations,
              child: child,
            );
          },
          pageBuilder: (BuildContext context, animation, secondAnimation) {
            return child;
          },

        );
}
