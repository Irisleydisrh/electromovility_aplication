import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      child: const Center(
        child: Text(
          'Home',
          style: TextStyle(color: Color.fromRGBO(53, 184, 134, 1),
          ),
        ),
      ),
    );
  }
}
//