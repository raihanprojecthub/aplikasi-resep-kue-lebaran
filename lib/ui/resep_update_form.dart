import 'package:flutter/material.dart';
import '../model/resep.dart';
import '../service/resep_service.dart';
import 'resep_detail.dart';

class ResepUpdateForm extends StatefulWidget {
  final Resep resep;

  const ResepUpdateForm({Key? key, required this.resep}) : super(key: key);
  _ResepUpdateFormState createState() => _ResepUpdateFormState();
}

class _ResepUpdateFormState extends State<ResepUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _gambarCtrl = TextEditingController();
  final _namaResepCtrl = TextEditingController();
  final _bahanCtrl = TextEditingController();
  final _caraMembuatCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _gambarCtrl.text = widget.resep.gambar;
      _namaResepCtrl.text = widget.resep.namaResep;
      _bahanCtrl.text = widget.resep.bahan;
      _caraMembuatCtrl.text = widget.resep.caraMembuat;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Data Resep")),
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            margin: EdgeInsets.all(10),
            child: Container(
              padding: EdgeInsets.all(15),
              child: Form(
                key: _formKey,
                child: Column(children: [
                  _fieldgambar(),
                  _fieldnamaResep(),
                  _fieldbahan(),
                  _fieldcaraMembuat(),
                  SizedBox(
                    height: 20,
                  ),
                  _tombolSimpan()
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _fieldgambar() {
    return TextField(
      decoration: const InputDecoration(labelText: "URL Gambar"),
      controller: _gambarCtrl,
    );
  }

  _fieldnamaResep() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Resep"),
      controller: _namaResepCtrl,
    );
  }

  _fieldbahan() {
    return TextField(
      decoration: const InputDecoration(labelText: "Bahan"),
      maxLines: null,
      controller: _bahanCtrl,
    );
  }

  _fieldcaraMembuat() {
    return TextField(
      decoration: const InputDecoration(labelText: "Cara Membuat"),
      maxLines: null,
      controller: _caraMembuatCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () async {
          Resep resep = new Resep(
              gambar: _gambarCtrl.text,
              namaResep: _namaResepCtrl.text,
              bahan: _bahanCtrl.text,
              caraMembuat: _caraMembuatCtrl.text);
          String id = widget.resep.id.toString();
          await ResepService().ubah(resep, id).then((value) {
            Navigator.pop(context);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ResepDetail(resep: value)));
          });
        },
        child: const Text("Simpan Perubahan"));
  }
}
