import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innova/bloc/profile/profile_bloc.dart';
import 'package:innova/presentation/widgets/cards/card_home_widget.dart';
import 'package:innova/presentation/widgets/cards/card_shop_products_widget.dart';

class ProfileScreen extends StatelessWidget {

  ProfileScreen({super.key});

  // Podrias crear una lista de productos y mostrarlos en la tienda
  final List products = [
    {
      'name': 'Mobil Super Synthetic 10W-30',
      'price': 1200,
      'image': 'https://www.mobil.com/lubricants/-/media/project/wep/mobil/mobil-row-us-1/for-personal-vehicles/products-images/mobil-super-synthetic-10w-30/mobil-super-synthetic-10w-30fs-product.jpg?sc_lang=en&hash=EE4592C01678441275D3D6934179C758'
    },
    {
      'name': 'Havoline 10W-30',
      'price': 500,
      'image': 'https://alianzaautomotriz.com/wp-content/uploads/2021/04/HAVOLINE-2.jpg'
    },
    {
      'name': 'Castrol GTX 20W-50',
      'price': 1400,
      'image': 'https://www.corbeta.com.co/media/catalog/product/g/t/gtx_20w50_gl.jpg'
    },
    {
      'name': 'Motul 7100 20W-50',
      'price': 600,
      'image': 'https://f.fcdn.app/imgs/4db632/bikeup.uy/bikeuy/ab67/original/catalogo/ACEITEMOT710020W50_ACEITEMOT710020W50_1/2000-2000/aceite-motul-7100-20w50-aceite-motul-7100-20w50.jpg'
    },
    {
      'name': 'Mobil Super Synthetic 10W-30',
      'price': 1200,
      'image': 'https://www.mobil.com/lubricants/-/media/project/wep/mobil/mobil-row-us-1/for-personal-vehicles/products-images/mobil-super-synthetic-10w-30/mobil-super-synthetic-10w-30fs-product.jpg?sc_lang=en&hash=EE4592C01678441275D3D6934179C758'
    },
    {
      'name': 'Havoline 10W-30',
      'price': 500,
      'image': 'https://alianzaautomotriz.com/wp-content/uploads/2021/04/HAVOLINE-2.jpg'
    },
    {
      'name': 'Castrol GTX 20W-50',
      'price': 1400,
      'image': 'https://www.corbeta.com.co/media/catalog/product/g/t/gtx_20w50_gl.jpg'
    },
    {
      'name': 'Motul 7100 20W-50',
      'price': 600,
      'image': 'https://f.fcdn.app/imgs/4db632/bikeup.uy/bikeuy/ab67/original/catalogo/ACEITEMOT710020W50_ACEITEMOT710020W50_1/2000-2000/aceite-motul-7100-20w50-aceite-motul-7100-20w50.jpg'
    },
  ];
  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: ProfileView(products: products),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({
    super.key,
    required this.products,
  });

  final List products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Perfil',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              const SizedBox(
                height: 20,
              ),

              SizedBox(
                width: double.infinity,
                child: CircleAvatar(
                  radius: 70,
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    child: Image.asset('lib/assets/images/logo.png')
                  ),
                ),
              ),
  
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text(
                  'Lubricentro 2 hermanos',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
  
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color: Colors.grey[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        context.read<ProfileBloc>().add(const ProfileEventChangeIndexSelected(indexSelected: 1));
                      },
                      child: BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (context, state) {
                          return Text(
                            'Posts',
                            style: TextStyle(
                              fontSize: 16,
                              decoration: state.indexSelected == 1
                                ? TextDecoration.underline
                                : TextDecoration.none,
                              decorationColor: Colors.grey[400],
                              decorationThickness: 2.0, // Ajusta el grosor de la línea
                            ),
                          );
                        }
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        context.read<ProfileBloc>().add(const ProfileEventChangeIndexSelected(indexSelected: 2));
                      },
                      child: BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (context, state) {
                          return Text(
                            'Tienda',
                            style: TextStyle(
                              fontSize: 16,
                              decoration: state.indexSelected == 2
                                ? TextDecoration.underline
                                : TextDecoration.none,
                              decorationColor: Colors.grey[400],
                              decorationThickness: 2.0,
                            ),
                          );
                        }
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        context.read<ProfileBloc>().add(const ProfileEventChangeIndexSelected(indexSelected: 3));
                      },
                      child: BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (context, state) {
                          return Text(
                            'Información',
                            style: TextStyle(
                              fontSize: 16,
                              decoration: state.indexSelected == 3
                                ? TextDecoration.underline
                                : TextDecoration.none,
                              decorationColor: Colors.grey[400],
                              decorationThickness: 2.0,
                            ),
                          );
                        }
                      ),
                    ),
                  ],
                ),
              ),
  

              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state.indexSelected == 1) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return const CardHomeWidget();
                      },
                    );
                  } else if (state.indexSelected == 2) {
                    return CardShopProductsWidget(products: products);
                  } else {
                    return const Information();
                  }
                }
              ),
  
              /// Crear un widget buscador que muestre los productos de la tienda
            ],
          )
        ),
      )
    );
  }
}

class Information extends StatelessWidget {
  const Information({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: MediaQuery.of(context).size.width - 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Reseñas:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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

              const SizedBox(width: 10),

              Text(
                'Ver comentarios',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue[400]
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          const Text(
            'Ubicación:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),

          const Text(
            'De los semaforos del mayoreo 200 mts al sur, Managua Nicaragua',
            style: TextStyle(
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Horario:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),

          const Text(
            'Lunes a Viernes de 8:00 am a 5:00 pm',
            style: TextStyle(
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Teléfono:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),

          const Text(
            '2222-2222',
            style: TextStyle(
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Correo:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),

          const Text(
            'admin@example.com',
            style: TextStyle(
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Redes sociales:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),

          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.facebook),
              ),

              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.facebook),
              ),

              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.facebook),
              ),
            ],
          ),

          const SizedBox(height: 20),

          const Text(
            'Descripción:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),

          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget ultricies ultrices, nunc nisl aliquam nunc, vitae aliquam ni',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        

        ]
      ),
    );
  }
}
