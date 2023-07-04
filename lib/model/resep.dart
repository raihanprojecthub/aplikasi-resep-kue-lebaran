class Resep {
  String? id;
  String gambar;
  String namaResep;
  String bahan;
  String caraMembuat;

  Resep(
      {this.id,
      required this.gambar,
      required this.namaResep,
      required this.bahan,
      required this.caraMembuat});

  factory Resep.fromJson(Map<String, dynamic> json) => Resep(
      id: json["id"],
      gambar: json["gambar"],
      namaResep: json["nama_resep"],
      bahan: json["bahan"],
      caraMembuat: json["cara_membuat"]);

  Map<String, dynamic> toJson() => {
        "gambar": gambar,
        "nama_resep": namaResep,
        "bahan": bahan,
        "cara_membuat": caraMembuat
      };
}
