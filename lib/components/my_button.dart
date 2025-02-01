import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color buttonColor;
  final String buttonText;
  final Function()? onTap;

  const MyButton({
    super.key,
    required this.buttonColor,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(buttonColor),
            fixedSize: const MaterialStatePropertyAll(Size(800, 50))),
        onPressed: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Center(
            child: Text(
              buttonText,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
