import 'package:flutter/material.dart';
import 'package:tests/providers/places_list.dart';
import 'package:tests/widgets/widgets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        const CustomAppBar(),
        const SearchBar(),
        const PopularSlide(places: places),
        const RecentCollectionSlide(),
        SizedBox(height: size.height * 0.1),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color(0xFFdcdfd9),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
            ),
            child: const Icon(Icons.search, color: Colors.black, size: 20),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Find a tourist destination',
              ),
              cursorColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Where to you want to go?',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: GestureDetector(
            onTap: () {},
            child: const Icon(Icons.pets, color: Colors.black),
          ),
        ),
      ],
    );
  }
}

class PopularSlide extends StatelessWidget {
  const PopularSlide({super.key, required this.places});
  final List<Map<String, String>> places;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SlideHeader(title: 'Popular travel'),
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.symmetric(vertical: 20),
          height: 314,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              places.length,
              (index) => _PopularSlideCard(place: places[index]),
            ),
          ),
        ),
      ],
    );
  }
}

class _PopularSlideCard extends StatelessWidget {
  const _PopularSlideCard({required this.place});

  final Map<String, String> place;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.4), spreadRadius: 10),
        ],
      ),
      width: 250.0,
      child: Column(
        children: [
          Image.network(
            place['image']!,
            height: 190,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
            child: Column(
              children: [
                Text(
                  place['title']!,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                _cardDescription(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  RichText _cardDescription() {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Icon(
              Icons.add_location_alt,
              color: Colors.red[800],
              size: 16,
            ),
          ),
          TextSpan(
            text: place['location']!,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          const WidgetSpan(child: SizedBox(width: 16)),
          WidgetSpan(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
              child: Text(
                place['price']!,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RecentCollectionSlide extends StatelessWidget {
  const RecentCollectionSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SlideHeader(title: 'Recent Collection'),
        const SizedBox(
          height: 14,
        ),
        ...List.generate(
          3,
          (index) => _RecentItem(
            recentItem: recentCollectionList[index],
          ),
        ),
      ],
    );
  }
}

class _RecentItem extends StatelessWidget {
  const _RecentItem({required this.recentItem});

  final Map<String, String> recentItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFdae7e3),
            Color(0xFFffffff),
          ],
        ),
      ),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
              width: 70,
              height: 70,
              recentItem['image']!,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recentItem['title']!,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  recentItem['desc']!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: Colors.black,
            ),
            child: Text(
              '\$${recentItem['price']}',
              style: const TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
