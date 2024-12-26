import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          const Text('가장 인기 있는'),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/detail_page');
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(200)),
                  height: 500,
                  width: double.infinity,
                  child: Image.network(
                    'https://picsum.photos/seed/picsum/200/300',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          // ListView(
          //   scrollDirection: Axis.horizontal,
          // ),
        ],
      ),
    );
  }
}
