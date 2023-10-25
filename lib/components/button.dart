import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  dynamic buttonName, iconName;
  MyButton({
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
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[300],
        shape: StadiumBorder(),
        fixedSize: Size(200, 50),
        alignment: Alignment.center,
      ),
    );
  }
}
