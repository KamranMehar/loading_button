A highly customizable and animated loading button widget for Flutter, perfect for use in your mobile applications. The `LoadingButton` widget allows for extensive customization of its appearance and behavior, ensuring it fits seamlessly into your app's design.

## Features

- **Customizable Appearance:** Adjust height, width, color, text style, border radius, box shadow, and more.
- **Animated State Changes:** Smoothly transition between loading and non-loading states with animations.
- **Gradient Support:** Apply linear gradients to the button background.
- **Custom Loading Indicator:** Use the default or provide a custom loading widget.
- **Ignore Pointer:** Disable button interaction while loading or based on your conditions.

## Installation

Add the following line to your `pubspec.yaml` file:


    dependencies:
      loading_button: ^1.0.0

import package


    import 'package:loading_button_plus/loading_button.dart';

Use in your widget tree.


    LoadingButtonPlus(
                        textColor: Colors.white,
                        isLoading: isLoading,
                        text: "Text",
                        onTap: () {
                          setState(() {
                            isLoading= !isLoading;
                          });
                        })
