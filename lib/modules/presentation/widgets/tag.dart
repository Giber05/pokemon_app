import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  const Tag({
    Key? key,
    required this.title,
    this.titleTextStyle,
     this.tagColor,
  }) : super(key: key);
  final String title;
  final TextStyle? titleTextStyle;
  final Color? tagColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        color: tagColor?? Colors.white.withOpacity(.3),
      ),
      child: Text(
        title,
        style:titleTextStyle??
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
