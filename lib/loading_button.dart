library loading_button;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton({
    super.key,
    required this.text,
    this.isLoading = false,
    required this.onTap,
    this.height,
    this.width,
    this.color,
    this.paddingHorizontal,
    this.paddingVertical,
    this.textColor,
    this.circularProgressColor,
    this.fontWeight,
    this.gradient,
    this.loadingWidget
  });

  final String text;
  final bool isLoading;
  final VoidCallback onTap;
  final double? height;
  final double? width;
  final Color? color;
  final Color? circularProgressColor;
  final double? paddingVertical;
  final double? paddingHorizontal;
  final Color? textColor;
  final FontWeight? fontWeight;
  final Gradient? gradient;
  final Widget? loadingWidget;
  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late RxDouble scale = 1.0.obs; // Rx variable to store the scale value

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
        scale.value = 1 + animationController.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.isLoading,
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
        child: Obx(() => Transform.scale(
          scale: scale.value,
          child: AnimatedContainer(
            duration: const Duration(microseconds: 50),
            height: widget.height,
            width: widget.width,
            margin: const EdgeInsets.all(8),
            padding: EdgeInsets.symmetric(vertical: widget.paddingVertical??5,
                horizontal:  widget.paddingHorizontal??10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              gradient: widget.gradient,
              color: widget.color?? const Color(0xff008585),
            ),
            child: widget.isLoading
                ? FittedBox(
              child: SizedBox(
                height: widget.height??10,
                width: widget.height??10*3,
                child: widget.loadingWidget?? CircularProgressIndicator(
                  color: widget.circularProgressColor??Colors.white,
                  strokeWidth: 8,
                ),
              ),
            )
                : Center(
              child: FittedBox(
                child: Text(
                  widget.text,
                  style: TextStyle(
                    color: widget.textColor?? Colors.black,
                    fontWeight: widget.fontWeight?? FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
