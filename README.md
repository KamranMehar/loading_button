loading_button
A customizable and animated loading button for Flutter applications.

Features
Customizable Appearance: Easily adjust the button's height, width, color, text color, font weight, border radius, padding, margin, gradient, and shadow.
Loading State: Indicate loading state with a circular progress indicator. Customize the loading widget, circular progress color, and stroke width.
Animations: Includes a smooth scaling animation for button press interactions.
Ignore Pointer: Optionally disable pointer events while the button is in the loading state.
Responsive Design: Utilizes AnimatedContainer and Transform.scale for smooth and responsive UI changes.
Parameters
text (required): The text displayed on the button.
isLoading (optional): Boolean to indicate the loading state. Default is false.
onTap (required): Callback function to handle button tap events.
height (optional): The height of the button.
width (optional): The width of the button.
color (optional): The background color of the button.
circularProgressColor (optional): The color of the circular progress indicator.
textColor (optional): The color of the button text.
fontWeight (optional): The font weight of the button text.
gradient (optional): The gradient of the button's background.
loadingWidget (optional): Custom widget displayed during the loading state.
ignorePointer (optional): Boolean to disable pointer events while loading. Default is false.
padding (optional): The padding inside the button.
margin (optional): The margin outside the button.
borderRadius (optional): The border radius of the button.
stockWidth (optional): The stroke width of the circular progress indicator.
textStyle (optional): Custom text style for the button text.
boxShadow (optional): List of box shadows for the button.