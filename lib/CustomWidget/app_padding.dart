import 'package:flutter/material.dart';

import '../Utils/app_color.dart';


class AppPadding extends StatelessWidget {
  final double? top;
  final double? right;
  final double? bottom;
  final double? left;
  final Widget child;

  const AppPadding.test(
      {Key? key,
        this.top = 10,
        this.right = 20,
        this.bottom = 10,
        this.left = 20,
        required this.child})
      : super(key: key);
  const AppPadding.a20(
      {Key? key,
        this.top = 20,
        this.right = 20,
        this.bottom = 20,
        this.left = 20,
        required this.child})
      : super(key: key);
  const AppPadding.a2r(
      {Key? key,
        this.top = 20,
        this.right = 0,
        this.bottom = 20,
        this.left = 20,
        required this.child})
      : super(key: key);
  const AppPadding.a2b(
      {Key? key,
        this.top = 20,
        this.right = 20,
        this.bottom = 0,
        this.left = 20,
        required this.child})
      : super(key: key);
  const AppPadding.a2t(
      {Key? key,
        this.top = 0,
        this.right = 20,
        this.bottom = 20,
        this.left = 20,
        required this.child})
      : super(key: key);
  const AppPadding.a21t(
      {Key? key,
        this.top = 16,
        this.right = 20,
        this.bottom = 0,
        this.left = 20,
        required this.child})
      : super(key: key);

  const AppPadding(
      {Key? key,
        this.top,
        this.right,
        this.bottom,
        this.left,
        required this.child})
      : super(key: key);

  const AppPadding.a(
      {Key? key,
        this.top = defaultPadding,
        this.right = defaultPadding,
        this.bottom = defaultPadding,
        this.left = defaultPadding,
        required this.child})
      : super(key: key);

  const AppPadding.t(
      {Key? key,
        this.top = defaultPadding,
        this.right = 0,
        this.bottom = 0,
        this.left = 0,
        required this.child})
      : super(key: key);

  const AppPadding.r(
      {Key? key,
        this.top = 0,
        this.right = defaultPadding,
        this.bottom = 0,
        this.left = 0,
        required this.child})
      : super(key: key);

  const AppPadding.l(
      {Key? key,
        this.top = 0,
        this.right = 0,
        this.bottom = 0,
        this.left = defaultPadding,
        required this.child})
      : super(key: key);

  const AppPadding.b(
      {Key? key,
        this.top = 0,
        this.right = 0,
        this.bottom = defaultPadding,
        this.left = 0,
        required this.child})
      : super(key: key);

  const AppPadding.x(
      {Key? key,
        this.top = 0,
        this.right = defaultPadding,
        this.bottom = 0,
        this.left = defaultPadding,
        required this.child})
      : super(key: key);

  const AppPadding.y(
      {Key? key,
        this.top = defaultPadding,
        this.right = 0,
        this.bottom = defaultPadding,
        this.left = 0,
        required this.child})
      : super(key: key);

  const AppPadding.a2(
      {Key? key,
        this.top = defaultPadding * 2,
        this.right = defaultPadding * 2,
        this.bottom = defaultPadding * 2,
        this.left = defaultPadding * 2,
        required this.child})
      : super(key: key);

  const AppPadding.t2(
      {Key? key,
        this.top = defaultPadding * 2,
        this.right = 0,
        this.bottom = 0,
        this.left = 0,
        required this.child})
      : super(key: key);

  const AppPadding.r2(
      {Key? key,
        this.top = 0,
        this.right = defaultPadding * 2,
        this.bottom = 0,
        this.left = 0,
        required this.child})
      : super(key: key);

  const AppPadding.l2(
      {Key? key,
        this.top = 0,
        this.right = 0,
        this.bottom = 0,
        this.left = defaultPadding * 2,
        required this.child})
      : super(key: key);

  const AppPadding.b2(
      {Key? key,
        this.top = 0,
        this.right = 0,
        this.bottom = defaultPadding * 2,
        this.left = 0,
        required this.child})
      : super(key: key);

  const AppPadding.x2(
      {Key? key,
        this.top = 0,
        this.right = defaultPadding * 2,
        this.bottom = 0,
        this.left = defaultPadding * 2,
        required this.child})
      : super(key: key);

  const AppPadding.y2(
      {Key? key,
        this.top = defaultPadding * 2,
        this.right = 0,
        this.bottom = defaultPadding * 2,
        this.left = 0,
        required this.child})
      : super(key: key);
  const AppPadding.y3(
      {Key? key,
        this.top = defaultPadding * 3,
        this.right = 0,
        this.bottom = defaultPadding * 3,
        this.left = 0,
        required this.child})
      : super(key: key);

  const AppPadding.x3(
      {Key? key,
        this.top = 0,
        this.right = defaultPadding * 3,
        this.bottom = 0,
        this.left = defaultPadding * 3,
        required this.child})
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: left ?? 0,
        top: top ?? 0,
        right: right ?? 0,
        bottom: bottom ?? 0,
      ),
      child: child,
    );
  }
}
