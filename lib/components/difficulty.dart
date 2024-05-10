import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  const Difficulty({
    super.key,
    required this.difficultyLevel,
  });

  final int difficultyLevel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: difficultyLevel >= 1 ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          color: difficultyLevel >= 2 ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          color: difficultyLevel >= 3 ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          color: difficultyLevel >= 4 ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          color: difficultyLevel == 5 ? Colors.blue : Colors.blue[100],
        ),
      ],
    );
  }
}