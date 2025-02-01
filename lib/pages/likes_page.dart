import 'package:flutter/material.dart';

class LikesPage extends StatelessWidget {
  const LikesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text(
          'Likes',
          style: TextStyle(color: Color.fromRGBO(53, 184, 134, 1)),
        ),
      ),
    );
  }
}
