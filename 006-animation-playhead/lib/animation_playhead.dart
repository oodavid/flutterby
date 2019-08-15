import 'package:flutter/material.dart';

class AnimationPlayhead extends StatefulWidget {
  const AnimationPlayhead({
    Key key,
    @required AnimationController controller,
  }) : _controller = controller, super(key: key);

  final AnimationController _controller;

  @override
  _AnimationPlayheadState createState() => _AnimationPlayheadState();
}

class _AnimationPlayheadState extends State<AnimationPlayhead> {

  // When the animation controller changes value, or state
  // ...we must run `setState` to make sure the Widget re-builds
  @override
  void initState() {
    widget._controller.addListener(onValueChange);
    widget._controller.addStatusListener(onStatusChange);
    super.initState();
  }

  @override
  void dispose() {
    widget._controller.removeListener(onValueChange);
    widget._controller.removeStatusListener(onStatusChange);
    super.dispose();
  }

  void onValueChange() {
    setState(() {});
  }

  void onStatusChange(AnimationStatus status) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    bool isAnimatingForward = widget._controller.isAnimating && widget._controller.status == AnimationStatus.forward;
    bool isAnimatingReverse = widget._controller.isAnimating && widget._controller.status == AnimationStatus.reverse;
    Icon _forwardIcon = Icon(isAnimatingForward ? Icons.pause : Icons.play_arrow);
    Icon _reverseIcon = Icon(isAnimatingReverse ? Icons.pause : Icons.play_arrow);
    return Row(
      children: <Widget>[
        IconButton(
          icon: _forwardIcon,
          onPressed: () {
            if(!isAnimatingForward){
              widget._controller.forward();
            } else {
              widget._controller.stop();
              setState(() {}); // Stopping an animation doesn't emit events
            }
          },
        ),
        Expanded(
          child: Slider(
            min: 0,
            max: 1,
            value: widget._controller.value,
            label: '${widget._controller.value.toStringAsPrecision(3)}',
            onChanged: (double value) {
              widget._controller.value = value;
            },
          ),
        ),
        RotatedBox(
          quarterTurns: 2,
          child: IconButton(
            icon: _reverseIcon,
            onPressed: () {
              if(!isAnimatingReverse){
                widget._controller.reverse();
              } else {
                widget._controller.stop();
                setState(() {}); // Stopping an animation doesn't emit events
              }
            },
          ),
        ),
      ],
    );
  }
}
