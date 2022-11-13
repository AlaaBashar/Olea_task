import 'package:flutter/material.dart';

import '../utils/animations/login_page_animations.dart';
import '../utils/page_routes/slide_page_route.dart';

import './login_page.dart';

class AnimatedHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedHomePageState();
  }
}

class _AnimatedHomePageState extends State<AnimatedHomePage> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HomePage(controller);
  }
}

class HomePage extends StatelessWidget {
  double? deviceHeight;
  double? deviceWidth;
  AnimationController controller;
  EnterAnimation? animation;
  final Color _primaryColor = const Color.fromRGBO(169, 224, 241, 1.0);

  HomePage(this.controller, {Key? key}) : super(key: key) {
    animation = EnterAnimation(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
     deviceHeight = MediaQuery.of(context).size.height;
     deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: deviceHeight! * 0.60,
          width: deviceWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _avatarWidget(),
              SizedBox(
                height: deviceHeight! * 0.03,
              ),
              _nameWidget(),
              SizedBox(
                height: deviceHeight! * 0.20,
              ),
              _logoutButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _avatarWidget() {
    double circleD = deviceHeight! * 0.25;
    return AnimatedBuilder(
      animation: animation!.controller!,
      builder: (context,widget) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.diagonal3Values(
              animation!.circleSize!.value, animation!.circleSize!.value, 1),
          child: Container(
            height: circleD,
            width: circleD,
            decoration: BoxDecoration(
              color: _primaryColor,
              borderRadius: BorderRadius.circular(500),
              image: const DecorationImage(
                image: AssetImage('assets/animations/main_avatar.png'),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _nameWidget() {
    return Text(
      "John Doe",
      style: TextStyle(
          color: _primaryColor, fontSize: 35, fontWeight: FontWeight.w400),
    );
  }

  Widget _logoutButton(BuildContext context) {
    return MaterialButton(
        minWidth: deviceWidth! * 0.38,
        height: deviceHeight! * 0.055,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(color: _primaryColor, width: 3),
        ),
        onPressed: () {
          Navigator.push(
            context,
            SlidePageRoute(
              AnimatedLoginPage(),
            ),
          );
        },
        child: Text(
          "LOG OUT",
          style: TextStyle(
              fontSize: 16, color: _primaryColor, fontWeight: FontWeight.bold),
        ));
  }
}
