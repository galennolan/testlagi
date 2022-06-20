import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testlagi/bloc/logout_bloc.dart';
import 'package:testlagi/bloc/produk_bloc.dart';
import 'package:testlagi/model/produk.dart';
import 'package:testlagi/ui/produk_detail.dart';
import 'package:testlagi/ui/produk_form.dart';
import 'package:testlagi/ui/produk_list.dart';

import 'login_page.dart';

class ProdukPage extends StatefulWidget {
  @override
  _ProdukPageState createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Produk'),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                child: Icon(Icons.add, size: 26.0),
                onTap: () async {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => ProdukForm()));
                },
              ))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Logout'),
              trailing: Icon(Icons.logout),
              onTap: () async {
                LogoutBloc.logout().then((value) {
                  Navigator.pushReplacement(context,
                      new MaterialPageRoute(builder: (context) => LoginPage()));
                });
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder<List>(
        future: ProdukBloc.getProduks(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.hasError);
          return snapshot.hasData
              ? ListProduk(
                  list: snapshot.data,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ListProduk extends StatelessWidget {
  final List? list;
  ListProduk({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list!.length,
      itemBuilder: (context, i) {
        return ItemProduk(
          produk: list![i],
        );
      },
    );
  }
}

class ItemProduk extends StatelessWidget {
  final Produk produk;

  ItemProduk({Key? key, required this.produk}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => ProdukDetail(
                        produk: produk,
                      )));
        },
        child: Card(
          child: ListTile(
            title: Text(produk.namaProduk.toString()),
            subtitle: Text(produk.hargaProduk.toString()),
          ),
        ),
      ),
    );
  }
}
