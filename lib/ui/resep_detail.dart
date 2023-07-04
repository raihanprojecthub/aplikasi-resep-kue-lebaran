import 'package:flutter/material.dart';
import '../service/resep_service.dart';
import 'resep_page.dart';
import 'resep_update_form.dart';
import '../model/resep.dart';

class ResepDetail extends StatefulWidget {
  final Resep resep;

  const ResepDetail({super.key, required this.resep});
  _ResepDetailState createState() => _ResepDetailState();
}

class _ResepDetailState extends State<ResepDetail> {
  Stream<Resep> getData() async* {
    Resep data = await ResepService().getById(widget.resep.id.toString());
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Resep"),
        actions: [
          Row(
            children: [
              StreamBuilder(
                  stream: getData(),
                  builder: (context, AsyncSnapshot snapshot) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ResepUpdateForm(resep: snapshot.data)));
                      },
                      child: const Icon(Icons.create_rounded))),
              SizedBox(width: 20),
              GestureDetector(
                  onTap: () {
                    AlertDialog alertDialog = AlertDialog(
                      content: const Text("Yakin ingin menghapus data ini?"),
                      actions: [
                        StreamBuilder(
                            stream: getData(),
                            builder: (context, AsyncSnapshot snapshot) =>
                                ElevatedButton(
                                  onPressed: () async {
                                    await ResepService()
                                        .hapus(snapshot.data)
                                        .then((value) {
                                      Navigator.pop(context);
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ResepPage()));
                                    });
                                  },
                                  child: const Text("YA"),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.red),
                                )),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Tidak"),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.green),
                        )
                      ],
                    );
                    showDialog(
                        context: context, builder: (context) => alertDialog);
                  },
                  child: const Icon(Icons.delete)),
              SizedBox(width: 15),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: StreamBuilder(
          stream: getData(),
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
              return Text('Data Tidak Ditemukan');
            }
            return Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      "${widget.resep.namaResep}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: 250,
                      height: 250,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network('${widget.resep.gambar}'),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Bahan :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "${widget.resep.bahan}",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Cara Membuat :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "${widget.resep.caraMembuat}",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
