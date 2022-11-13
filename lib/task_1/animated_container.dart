import 'package:flutter/material.dart';
import 'dart:math';
class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerScreen> createState() => _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
   double width = 50;
   double height = 50;
   Color color = Colors.green;
   BorderRadiusGeometry borderRadiusGeometry = BorderRadius.circular(8.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container Task'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            AnimatedContainer(
              curve: Curves.bounceIn,
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: color,
                borderRadius: borderRadiusGeometry,
              ),
              duration: const Duration(seconds: 1),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: onClick,
        label: const Text('Animated Container'),
      ),
    );
  }

  void onClick(){
    Random random = Random();
    width =random.nextInt(300).toDouble()+100;
    height =random.nextInt(300).toDouble()+100;
    color =Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
    borderRadiusGeometry =BorderRadius.circular(random.nextInt(100).toDouble());
    setState((){});
  }
}
