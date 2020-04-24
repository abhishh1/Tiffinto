import 'package:app4/MessTypes/Veg.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' show radians;
import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TrigoMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SizedBox.expand(child: RadialMenu()),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

class RadialMenu extends StatefulWidget {
  @override
  _RadialMenuState createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return RadialAnimation(controller: controller);
  }
}

class RadialAnimation extends StatelessWidget {
  RadialAnimation({Key key, this.controller})
      : scale = Tween<double>(
          begin: 0.5,
          end: 0.0,
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn),
        ),
        translation = Tween<double>(
          begin: 0.0,
          end: 100.0,
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.elasticOut),
        ),
        super(key: key);
  final AnimationController controller;
  final Animation<double> scale;
  final Animation<double> translation;

  build(context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, builder) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _buildButton(0,
                color: Colors.yellowAccent, icon: FontAwesomeIcons.solidFile,),
            _buildButton(-45,
                color: Colors.blue, icon: FontAwesomeIcons.baseballBall),
            _buildButton(-90,
                color: Colors.yellow, icon: FontAwesomeIcons.batteryFull),
            
            Transform.scale(
              scale: scale.value - 1.5,
              child: FloatingActionButton(
                  child: Icon(FontAwesomeIcons.timesCircle), onPressed: _close),
            ),
            Transform.scale(
              scale: scale.value,
              child: FloatingActionButton(
                  child: Icon(FontAwesomeIcons.solidDotCircle),
                  onPressed: _open),
            ),
          ],
        );
      },
    );
  }

  _open() {
    controller.forward();
  }
  //_cat(){Navigator.push( context, MaterialPageRoute(builder: (context)=> new CatList()  ));}

  _close() {
    controller.reverse();
  }

  _buildButton(double angle, {Color color, IconData icon,OnInvokeCallback callback}) {
    final double rad = radians(angle);

    return Transform(
      transform: Matrix4.identity()
        ..translate(
          (translation.value) * cos(rad),
          (translation.value) * sin(rad),
        ),
      child: FloatingActionButton(
        onPressed: () => Veg(),
        child: Icon(icon),
      ),
    );
  }
}
