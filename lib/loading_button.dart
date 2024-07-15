library loading_button_plus;
import 'package:flutter/material.dart';

class LoadingButtonPlus extends StatefulWidget {
  const LoadingButtonPlus({
    super.key,
    required this.text,
    this.isLoading = false,
    required this.onTap,
    this.height,
    this.width,
    this.color,
    this.textColor,
    this.circularProgressColor,
    this.fontWeight,
    this.gradient,
    this.loadingWidget,
    this.ignorePointer,
    this.padding,
    this.margin,
    this.borderRadius,
    this.stockWidth,
    this.textStyle, this.boxShadow
  });

  final String text;
  final bool isLoading;
  final bool? ignorePointer;
  final VoidCallback onTap;
  final double? height;
  final double? width;
  final Color? color;
  final Color? circularProgressColor;
  final Color? textColor;
  final FontWeight? fontWeight;
  final Gradient? gradient;
  final Widget? loadingWidget;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final double? stockWidth;
  final TextStyle? textStyle;
  final List<BoxShadow>? boxShadow;
  @override
  State<LoadingButtonPlus> createState() => _LoadingButtonPlusState();
}

class _LoadingButtonPlusState extends State<LoadingButtonPlus>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late double scale = 1.0;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 50),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {
        scale = 1 + animationController.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.ignorePointer??false,
      child: GestureDetector(
        onTap: widget.onTap,
        onTapDown: (details) {
          animationController.forward();
        },
        onTapUp: (detail) {
          animationController.reverse();
        },
        onTapCancel: () {
          animationController.reverse();
        },
        child: Transform.scale(
          scale: scale,
          child: AnimatedContainer(
            duration: const Duration(microseconds: 50),
            height: widget.height,
            width: widget.width,
            margin: widget.margin??
                const EdgeInsets.all(8),
            padding: widget.padding??
                const EdgeInsets.symmetric(vertical: 8, horizontal:  15),
            alignment: Alignment.center,
            decoration: BoxDecoration(
             borderRadius: widget.borderRadius??BorderRadius.circular(35),
              gradient: widget.gradient,
              color: widget.color?? const Color(0xff008585),
              boxShadow: widget.boxShadow
            ),
            child: widget.isLoading
                ? widget.loadingWidget??FittedBox(
              child: SizedBox(
                height: widget.height??10,
                width: widget.height??10*3,
                child:  CircularProgressIndicator(
                  color: widget.circularProgressColor??Colors.white,
                  strokeWidth: widget.stockWidth??3,
                ),
              ),
            )
                : Center(
              child: FittedBox(
                child: Text(
                  widget.text,
                  style:widget.textStyle?? TextStyle(
                    color: widget.textColor?? Colors.black,
                    fontWeight: widget.fontWeight?? FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
