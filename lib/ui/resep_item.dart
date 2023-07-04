import 'package:flutter/material.dart';
import '../model/resep.dart';
import 'resep_detail.dart';

class ResepItem extends StatelessWidget {
  final Resep resep;

  const ResepItem({super.key, required this.resep});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 8.0),
          leading: Image.network(
            '${resep.gambar}',
          ),
          title: Text(
            "${resep.namaResep}",
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ResepDetail(resep: resep)));
      },
    );
  }
}
