import 'package:flutter/material.dart';
import '../../app_colors.dart';

class FillButton extends StatefulWidget {
  Key? key;
  String? text;
  double? width;
  double? height;
  double? fontSize;
  String? fontStyle;
  Color? backgroundColor;
  Color? fontColor;
  VoidCallback? onClicked;
  bool enableAnimation;
  double? borderRadius;
  EdgeInsets? padding;
  EdgeInsets? margin;

  FillButton(
      {this.key,
      required this.text,
      this.width,
      this.height,
      this.fontSize,
      this.fontStyle,
      this.backgroundColor,
      this.onClicked,
      this.enableAnimation = true,
      this.fontColor,
      this.borderRadius,
      this.padding,this.margin})
      : super(key: key);

  @override
  _FillButtonState createState() => _FillButtonState();
}

class _FillButtonState extends State<FillButton>
    with SingleTickerProviderStateMixin {
  late double _scale;
  AnimationController? _controller;

  @override
  void initState() {
    if (widget.enableAnimation) {
      _controller = AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 50,
        ),
        lowerBound: 0.0,
        upperBound: 0.1,
      )..addListener(() {
          setState(() {});
        });
    } else {
      _controller = null;
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller != null) {
      _scale = 1 - _controller!.value;
    } else {
      _scale = 0.0;
    }
    return widget.enableAnimation
        ? GestureDetector(
            onTapDown: _tapDown,
            onTapUp: _tapUp,
            onTap: widget.onClicked,
            onTapCancel: _tapCancel,
            child: Transform.scale(
              scale: _scale,
              child: _buttonWidget(),
            ),
          )
        : InkWell(
            onTap: widget.onClicked,
            child: _buttonWidget(),
          );
  }

  void _tapDown(TapDownDetails details) {
    _controller?.forward();
  }

  void _tapUp(TapUpDetails details) {
    _controller?.reverse();
  }

  void _tapCancel() {
    _controller?.reverse();
  }

  _buttonWidget() {
    return Container(
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: widget.height ?? 50,
      padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 5),
      margin: widget.margin,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
          color: widget.backgroundColor ?? AppColors.primaryColor),
      child: Center(
        child: Text(
          widget.text != null ? widget.text! : "",
          style: TextStyle(
              fontSize: widget.fontSize ?? 18,
              color: widget.fontColor ?? AppColors.whiteColor,
              letterSpacing: 1,
              fontWeight: FontWeight.w600,
              fontFamily: widget.fontStyle ?? ""),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
