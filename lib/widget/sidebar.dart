import 'package:flutter/material.dart';
import '../ui/resep_page.dart';
import '../ui/beranda.dart';
import '../ui/login.dart';
import '../ui/resep_page.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: Text("Admin"),
              accountEmail: Text("admin@admin.com")),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Beranda"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Beranda()));
            },
          ),
          ListTile(
            leading: Icon(Icons.food_bank_outlined),
            title: Text("Resep Kue Lebaran"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResepPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout_rounded),
            title: Text("Keluar"),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                  (Route<dynamic> route) => false);
            },
          )
        ],
      ),
    );
  }
}
