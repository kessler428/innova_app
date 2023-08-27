import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {

  static const path = 'post';
  static const pathName = 'post';

  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final List<String> images = [
    'https://hips.hearstapps.com/hmg-prod/images/nissan-gtr-2022-japon-portada-1631625941.jpg',
    'https://carwow-uk-wp-3.imgix.net/Midnight-front-GTR.png?auto=format&cs=tinysrgb&fit=clip&ixlib=rb-1.1.0&q=60&w=750',
    'https://wieck-nissanao-production.s3.amazonaws.com/photos/0f1f7c57cbc0c093ecd008d5c8f973bd2c9c8bb5/thumbnail-364x204.jpg',
    'https://img.remediosdigitales.com/50967d/captura-de-pantalla-2022-08-26-a-las-17.38.32/1366_2000.jpeg',
    'https://cdn.topgear.es/sites/navi.axelspringer.es/public/media/image/2023/01/nissan-gt-r-r35-2024-2927374.jpg?tf=3840x',
    'https://cdn.motor1.com/images/mgl/1ZpX7w/s1/2024-nissan-gt-r-nismo-special-edition.webp'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: images.map((image) {
                return Image.network(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                );
              }).toList(),
              options: CarouselOptions(
                height: 350,
                autoPlay: false,
                enlargeCenterPage: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Nissan GT-R 2024',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Descripcion:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Todos los mod\elos GT-R 2024 presentan una aerodinámica mejorada con nuevas fascias delantera y trasera para aumentar la carga aerodinámica sin aumentar la resistencia. Vuelve el T-spec®, con colores icónicos, un interior a medida y un distintivo especial. Y para ofrecer el máximo desempeño, el GT-R NISMO® 2024 incorpora ahora un diferencial delantero de deslizamiento limitado que ayuda a domar su impresionante motor de 600 caballos de fuerza.',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Precio',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$141,990',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Vendedor',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Ver mas...',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 34,
                        backgroundImage: NetworkImage(
                          'https://www.feedbackexpress.com/wp-content/uploads/2017/03/amazon-best-seller.jpg',
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Alfredo cara de perro',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Innova Virtual',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.yellow[700]),
                                    Icon(Icons.star, color: Colors.yellow[700]),
                                    Icon(Icons.star, color: Colors.yellow[700]),
                                    Icon(Icons.star, color: Colors.yellow[700]),
                                    Icon(Icons.star, color: Colors.grey[400]),
                                    const Text(
                                      '4.0',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}