import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const Text('가장 인기 있는'),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/detail_page');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: 500,
                  width: double.infinity,
                  child: Image.network(
                    'https://picsum.photos/seed/picsum/200/300',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text('현재 상영중'),
            const SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  Item(),
                  Item(),
                  Item(),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text('인기순'),
            const SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  StackedItem(num: '1'),
                  StackedItem(num: '2'),
                  StackedItem(num: '3'),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text('평점 높은 순'),
            const SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  Item(),
                  Item(),
                  Item(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StackedItem extends StatelessWidget {
  StackedItem({super.key, required this.num});
  String num;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail_page');
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 25),
            child: AspectRatio(
              aspectRatio: 1 / 1.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://picsum.photos/seed/picsum/200/300',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              num,
              style: TextStyle(fontSize: 100, color: Colors.grey[300]),
            ),
          ),
        ],
      ),
    );
  }
}

class Item extends StatelessWidget {
  const Item({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/detail_page');
        },
        child: AspectRatio(
          aspectRatio: 1 / 1.5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              'https://picsum.photos/seed/picsum/200/300',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
