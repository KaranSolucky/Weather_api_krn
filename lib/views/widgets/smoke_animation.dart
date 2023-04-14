import 'package:flutter/material.dart';

class SmokeAnimationWidget extends StatefulWidget {
  const SmokeAnimationWidget({super.key});

  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<SmokeAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  double rotationAngle = 0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    animationController.repeat(reverse: true);

    animationController.addListener(() {
      setState(() {
        rotationAngle = animationController.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black26,
      child: GestureDetector(
        child: SizedBox(
            height: 250,
            width: 250,
            child: Transform.rotate(
              angle: rotationAngle,
              child: const Icon(
                Icons.cloud,
                size: 124.0,
                color: Colors.grey,
              ),
            )),
      ),
    );
  }
}
