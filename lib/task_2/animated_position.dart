import 'package:flutter/material.dart';
import 'dart:math';
class AnimatedPositionScreen extends StatefulWidget {
  const AnimatedPositionScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedPositionScreen> createState() => _AnimatedPositionScreenState();
}

class _AnimatedPositionScreenState extends State<AnimatedPositionScreen> {
   double width = 50;
   double height = 50;
   bool visible =true;
   Color color = Colors.green;
   BorderRadiusGeometry borderRadiusGeometry = BorderRadius.circular(8.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Position Task'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children:  [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
            ),
            const Center(child: Text('My Text',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w700),)),
            AnimatedPositioned(
              duration: const Duration(seconds: 2),
              bottom:  visible == true ? 250:350,
              right: 100,
              child: Container(
                width: 200,
                height: 100,
                decoration:  BoxDecoration(
                  color: Colors.blue,
                  borderRadius: borderRadiusGeometry,
                ),
              ),



            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: onClick,
        label: const Text('Position Container'),
      ),
    );
  }

  void onClick(){
    Random random = Random();
    visible =!visible;
    borderRadiusGeometry=BorderRadius.circular(random.nextInt(100).toDouble());
    color =Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
    setState((){});
  }
}
