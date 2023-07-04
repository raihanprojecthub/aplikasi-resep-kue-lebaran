import 'package:flutter/material.dart';
import '../widget/sidebar.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 30),
            Icon(
              Icons.restaurant_menu,
            ),
            SizedBox(width: 8),
            Text(
              'Aplikasi Resep Kue',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomCard(
              imagePath: 'images/nastar-keju.jpg',
              text: 'Nastar Keju',
              cardHeight: 220.0,
            ),
            SizedBox(height: 16.0),
            CustomCard(
              imagePath: 'images/putri-salju.jpg',
              text: 'Putri Salju',
              cardHeight: 220.0,
            ),
            SizedBox(height: 16.0),
            CustomCard(
              imagePath: 'images/kastengel.jpeg',
              text: 'Kastengel',
              cardHeight: 220.0,
            ),
            SizedBox(height: 16.0),
            CustomCard(
              imagePath: 'images/kuping-gajah.jpg',
              text: 'Kue Kuping Gajah',
              cardHeight: 220.0,
            ),
            SizedBox(height: 16.0),
            CustomCard(
              imagePath: 'images/kue-sagu.jpeg',
              text: 'Kue Sagu',
              cardHeight: 220.0,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String text;
  final double cardHeight;

  const CustomCard({
    required this.imagePath,
    required this.text,
    this.cardHeight = 200.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: cardHeight,
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.darken,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
