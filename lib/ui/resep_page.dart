import 'package:flutter/material.dart';
import '../model/resep.dart';
import '../service/resep_service.dart';
import 'resep_detail.dart';
import 'resep_form.dart';
import 'resep_item.dart';
import '../widget/sidebar.dart';

class ResepPage extends StatefulWidget {
  const ResepPage({super.key});
  State<ResepPage> createState() => _ResepPageState();
}

class _ResepPageState extends State<ResepPage> {
  Stream<List<Resep>> getList() async* {
    List<Resep> data = await ResepService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text("Resep Kue"),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResepForm()));
            },
          ),
          SizedBox(width: 15),
        ],
      ),
      body: StreamBuilder(
        stream: getList(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return Text('Data Kosong');
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return ResepItem(resep: snapshot.data[index]);
            },
          );
        },
      ),
    );
  }
}
