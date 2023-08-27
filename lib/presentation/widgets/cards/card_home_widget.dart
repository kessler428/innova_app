import 'package:flutter/material.dart';

class CardHomeWidget extends StatelessWidget {
  const CardHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  'https://picsum.photos/200/300',
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Innova Virtual Enterprise',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Hace 2 horas',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Se venden sistemas, sistemas, sistemas, Lleve sus sistemaaaassss, aproveche aproveche, estan a 3 por 10....',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 20),
          
          // Add images with the height of 200
          Image.network(
            'https://cdn.motor1.com/images/mgl/rMjOr/s1/2022-nissan-gt-r-nismo-special-edition.webp',
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.thumb_up),
                  SizedBox(width: 5),
                  Text('0'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.comment),
                  SizedBox(width: 5),
                  Text('0'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.share),
                  SizedBox(width: 5),
                  Text('0'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}