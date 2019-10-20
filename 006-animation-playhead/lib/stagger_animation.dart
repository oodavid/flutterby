// This animation is taken directly from
//  the Flutter docs, here:
// https://flutter.dev/docs/development/ui/animations/staggered-animations

import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({ Key key, this.controller }) :

    // Each animation defined here transforms its value during the subset
    // of the controller's duration defined by the animation's interval.
    // For example the opacity animation transforms its value during
    // the first 10% of the controller's duration.

    opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0, 0.25,
          curve: Curves.ease,
        ),
      ),
    ),

    width = Tween<double>(
      begin: 50.0,
      end: 150.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.25, 0.5,
          curve: Curves.ease,
        ),
      ),
    ),

    height = Tween<double>(
      begin: 50.0,
      end: 150.0
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.5, 0.75,
          curve: Curves.ease,
        ),
      ),
    ),

    padding = EdgeInsetsTween(
      begin: const EdgeInsets.only(bottom: 16.0),
      end: const EdgeInsets.only(bottom: 75.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.5, 0.75,
          curve: Curves.ease,
        ),
      ),
    ),

    borderRadius = BorderRadiusTween(
      begin: BorderRadius.circular(4.0),
      end: BorderRadius.circular(75.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.75, 1,
          curve: Curves.ease,
        ),
      ),
    ),

    color = ColorTween(
      begin: Colors.blueGrey.shade600,
      end: Colors.deepOrange.shade500,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.500, 0.750,
          curve: Curves.ease,
        ),
      ),
    ),

    super(key: key);

  final Animation<double> controller;
  final Animation<double> opacity;
  final Animation<double> width;
  final Animation<double> height;
  final Animation<EdgeInsets> padding;
  final Animation<BorderRadius> borderRadius;
  final Animation<Color> color;

  // This function is called each time the controller "ticks" a new frame.
  // When it runs, all of the animation's values will have been
  // updated to reflect the controller's current value.
  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      padding: padding.value,
      alignment: Alignment.bottomCenter,
      child: Opacity(
        opacity: opacity.value,
        child: Container(
          width: width.value,
          height: height.value,
          decoration: BoxDecoration(
            color: color.value,
            borderRadius: borderRadius.value,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}
