import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Hero(tag: 'image', child: MainPicture()),
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
            child: ListView.separated(
              itemCount: 6,
              itemBuilder: (context, index) {
                return CategoryItem(categories: 'Animation');
              },
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 5),
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
            child: ListView.separated(
              itemCount: 6,
              itemBuilder: (context, index) {
                return CategoryItem(categories: 'Animation\n300만');
              },
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 5),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            width: 500,
            child: ListView.separated(
              itemCount: 3,
              itemBuilder: (context, index) {
                return MakerItem();
              },
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 2),
            ),
          )
        ],
      ),
    );
  }
}

/// 최상단 영화 포스터
class MainPicture extends StatelessWidget {
  const MainPicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        'https://picsum.photos/seed/picsum/200/300',
        fit: BoxFit.cover,
      ),
    );
  }
}

///제작사 로고(최하단)
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

/// 장르 아이템
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
