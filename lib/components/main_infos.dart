import 'package:flutter/material.dart';

class MainInfos extends StatelessWidget {
  const MainInfos({super.key});

  @override
  Widget build(BuildContext context) {
    Color mainColor = Colors.white;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: mainColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Journal name',
                      style: TextStyle(color: mainColor),
                    ),
                  ),
                  const Icon(
                    Icons.circle_outlined,
                    color: Colors.black,
                    size: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'News theme',
                      style: TextStyle(color: mainColor),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.90,
                    child: Text(
                      'The Secret to Healthy Skin Without Harmful Chemicals',
                      style: TextStyle(
                        color: mainColor,
                        fontSize: 24,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () => print(''),
                    child: Container(
                      height: 40,
                      width: 150,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(
                            22), // Define a borda transparente
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Read More',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 20,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
