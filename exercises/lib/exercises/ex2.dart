import 'package:flutter/material.dart';

class CustomButtons extends StatelessWidget {
  const CustomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom buttons'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              CustomButton(icon: Icons.check, label: "Submit", ),
              SizedBox(height: 10,),
              CustomButton(icon: Icons.timer, label: "Time", buttontype: ButtonType.Secondary, iconPosition: "right",),
              SizedBox(height: 10,),
              CustomButton(icon: Icons.account_balance, label: "Account", buttontype: ButtonType.Disabled, iconPosition: "right",),
            ],
          ),
        ),
      ),
    );
  }
} 

enum ButtonType {Primary, Secondary, Disabled}
// Colors mapping
const Map<ButtonType, Color> buttonColors = {
  ButtonType.Primary : Colors.blue,
  ButtonType.Secondary: Colors.green,
  ButtonType.Disabled: Colors.grey,
};

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final String iconPosition;
  final ButtonType buttontype;

  const CustomButton({
    super.key,
    required this.icon,
    required this.label,
    this.buttontype  = ButtonType.Primary,
    this.iconPosition = "left"
  });

  @override
  Widget build(BuildContext context) {
    // Get color based on ButtonType
    Color buttonColor = buttonColors[buttontype] ?? Colors.blue;
    bool isDisabled = buttontype == ButtonType.Disabled;

    // Create Row with icon and label
    List<Widget> children = [];
    if (iconPosition == 'left') {
      children = [Icon(icon), SizedBox(width: 8,), Text(label) ];
    } else {
      children = [Text(label), SizedBox(width: 8), Icon(icon)];
    }
    return ElevatedButton(
      onPressed: isDisabled ? null: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        disabledBackgroundColor: buttonColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }
}