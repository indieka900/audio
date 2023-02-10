import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Tabs extends StatelessWidget {
  final String imagelocation;
  final String title;
  final String text;
  final String rating;

  const Tabs({
    super.key,
    required this.imagelocation,
    required this.title,
    required this.text,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Animate(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            //color: const Color.fromARGB(255, 58, 58, 58),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.secondary,
                blurRadius: 2,
                offset: const Offset(0, 0),
              )
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  width: 90,
                  height: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        imagelocation,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 23,
                        ),
                        Text(
                          rating,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 247, 67, 67),
                          ),
                        )
                      ],
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      text,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 135, 136, 135),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 90,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.purpleAccent,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text('Love'),
                          Icon(
                            Icons.favorite,
                            size: 18,
                            color: Color.fromARGB(255, 255, 22, 5),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      )
          .fadeIn(
            duration: const Duration(seconds: 1),
          )
          .then()
          .scaleX(
            begin: 5,
            duration: const Duration(milliseconds: 350),
          ),
    );
  }
}
