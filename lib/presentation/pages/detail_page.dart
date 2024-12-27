import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              'https://picsum.photos/seed/picsum/200/300',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Moana 2',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Spacer(),
              Text('2024-11-27'),
            ],
          ),
          const SizedBox(height: 10),
          Text("The cean is calling them back."),
          const SizedBox(height: 5),
          Text("100분"),
          const SizedBox(height: 5),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey,
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CategoryItem(categories: 'Animation'),
                CategoryItem(categories: 'Adventure'),
                CategoryItem(categories: 'Family'),
                CategoryItem(categories: 'Comedy'),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey,
          ),
          const SizedBox(height: 10),
          Flexible(child: Text('after' * 50)),
          const SizedBox(height: 5),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey,
          ),
          const SizedBox(height: 10),
          Text('흥행정보'),
          const SizedBox(height: 10),
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CategoryItem(categories: '6.949 \n 평점'),
                CategoryItem(categories: '331\n평점투표수'),
                CategoryItem(categories: '5466.535\n인기점수'),
                CategoryItem(categories: '150000000\n예산'),
                CategoryItem(categories: '150000000\n수익'),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            width: 500,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                MakerItem(),
                MakerItem(),
                MakerItem(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MakerItem extends StatelessWidget {
  const MakerItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      width: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          'https://picsum.photos/seed/picsum/200/300',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  CategoryItem({
    super.key,
    required this.categories,
  });
  String categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(child: Text(categories)),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
      ),
    );
  }
}
