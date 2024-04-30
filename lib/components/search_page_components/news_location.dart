import 'package:flutter/material.dart';

class NewsLocation extends StatelessWidget {
  const NewsLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: const Icon(
                  Icons.location_on_outlined,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text('Bekasi'),
              const SizedBox(
                width: 10,
              ),
              const Text('64+ News today'),
            ],
          ),
          const Icon(Icons.star_border_outlined),
        ],
      ),
    );
  }
}
