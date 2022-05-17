import 'package:flutter/material.dart';
import 'package:testlagi/produk_form.dart';
import 'package:testlagi/produk_detail.dart';

class ProdukPage extends StatefulWidget {
  @override
  _ProdukPageState createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Produk"),
        actions: [
          GestureDetector(
            //menampilkan icon+
            child: Icon(Icons.access_alarm),
            //pada saat icon + ditap
            onTap: () async {
              //berpindah ke halaman ProdukForm
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => ProdukForm()));
            },
          )
        ],
      ),
      body: ListView(
        children: [
          //List 1
          ItemProduk(
            kodeProduk: "A001",
            namaProduk: "Kulkas",
            harga: 2500000,
          ),

          //List 2
          ItemProduk(
            kodeProduk: "A002",
            namaProduk: "TV",
            harga: 5000000,
          ),

          //List 3
          ItemProduk(
            kodeProduk: "A003",
            namaProduk: "Mesin Cuci",
            harga: 3000000,
          ),
        ],
      ),
    );
  }
}

class ItemProduk extends StatelessWidget {
  final String kodeProduk;
  final String namaProduk;
  final int harga;
  //membuat constructor
  ItemProduk(
      {required this.kodeProduk,
      required this.namaProduk,
      required this.harga});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(namaProduk),
          subtitle: Text(harga.toString()), //parsing dari int ke String
        ),
      ),
      onTap: () {
        //Pindah ke halaman produk detail dan mengirim data
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (context) => ProdukDetail(
                  kodeProduk: kodeProduk,
                  namaProduk: namaProduk,
                  harga: harga,
                )));
      },
    );
  }
}
