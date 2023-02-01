import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tests/providers/places_list.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CustomAppBar(),
        SearchBar(),
        PopularSlide(places: places),
        PopularSlide(places: places),
        PopularSlide(places: places),
        PopularSlide(places: places),
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
          'Where to you want\nto go?',
          style: TextStyle(fontSize: 20),
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
        _PopularSlideHeader(),
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.symmetric(vertical: 20),
          height: 275,
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
      width: 200.0,
      child: Column(
        children: [
          Image.network(
            place['image']!,
            height: 150,
            width: 200,
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

class _PopularSlideHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Popular travel',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        RichText(
          text: TextSpan(
            text: 'View all',
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = () => {},
          ),
        ),
      ],
    );
  }
}
