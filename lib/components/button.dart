import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final buttonName, iconName;
  const MyButton({
    super.key,
    required this.buttonName,
    required this.iconName,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            buttonName,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          Icon(
            iconName,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
