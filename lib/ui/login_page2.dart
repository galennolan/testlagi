import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testlagi/ui/beranda.dart';
import 'package:testlagi/ui/login_page.dart';
import 'package:testlagi/ui/produk_page.dart';
import 'package:testlagi/ui/registrasi_page.dart';

class Login2 extends StatefulWidget {
  @override
  _Login2State createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  String email = "";
  String password = "";

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('flutter shared Preferences')),
      body: ListView(
        children: [
          //text email
          TextField(
              controller: emailController,
              decoration: InputDecoration(
                  labelText: "email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)))),
          TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  labelText: "password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)))),
          RaisedButton(
              child: Text('Ambil Data'),
              onPressed: () {
                setIntoSharedPreferences();
              }),

          RaisedButton(
              child: Text('Tampilkan Data'),
              onPressed: () {
                getIntoSharedPreferences();
              }),
          SizedBox(
            height: 30,
          ),
          _menuRegistrasi(),
          _menuLogin(),

          //Menampilkan text inputan user
          Text(
            "email anda adalah = $email",
          ),
          Text(
            "password anda adalah = $password",
          ),
        ],
      ),
    );
  }

  void setIntoSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString("email", emailController.text);
    await prefs.setString("password", passwordController.text);
  }

  void getIntoSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      email = prefs.getString("email");
      password = prefs.getString("password");
      LoginBloc.login(
              email: emailController.text, password: passwordController.text)
          .then((value) async {
        Navigator.pushReplacement(
            context, new MaterialPageRoute(builder: (context) => ProdukPage()));
      }, onError: (error) {
        print(error);
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => WarningDialog(
                  description: "Login gagal, silahkan coba lagi",
                ));
      });
    });
  }

  // Membuat menu untuk membuka halaman registrasi
  Widget _menuRegistrasi() {
    return Container(
      child: Center(
        child: InkWell(
          child: Text(
            "Registrasi",
            style: TextStyle(color: Colors.blue),
          ),
          onTap: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => Beranda()));
          },
        ),
      ),
    );
  }

  // Membuat menu untuk membuka halaman registrasi
  Widget _menuLogin() {
    return Container(
      child: Center(
        child: InkWell(
          child: Text(
            "Login",
            style: TextStyle(color: Colors.blue),
          ),
          onTap: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => LoginPage()));
          },
        ),
      ),
    );
  }
}
