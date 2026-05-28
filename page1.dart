import 'package:flutter/material.dart';
import 'page2.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: const Text('Page 1')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Welcome Text
            Text(
              'Welcome to',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            // Nama Praktikum
            Text('PRAKTIKUM PAB 2026', style: TextStyle(fontSize: 18)),

            SizedBox(height: 30),

            // NIM
            Text(
              '1462300043',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            // FOTO / GAMBAR
            Image.network(
              'https://i0.wp.com/pokeoneguide.com/wp-content/uploads/2021/08/snorlax.png?fit=979%2C816&ssl=1',
              width: 300,
              height: 300,
            ),

            // Nama
            Text(
              'SALIM ALAYDRUS',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 40),

            // Tombol
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Page2()),
                );
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade200,
                minimumSize: Size(220, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),

              child: Text(
                'Masuk',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
