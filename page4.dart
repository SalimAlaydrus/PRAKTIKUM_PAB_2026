import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'S.A.PICTURES',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        backgroundColor: const Color(0xFF1E2235),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        onTap: (index) {
          if (index == 0 || index == 1) {
            Navigator.pop(context);
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_creation),
            label: 'Movie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          const Text(
            'Profile',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 16),

          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              'https://i0.wp.com/pokeoneguide.com/wp-content/uploads/2021/08/snorlax.png?fit=979%2C816&ssl=1',
            ),
          ),

          const SizedBox(height: 20),

          // Info profile
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                _ProfileItem(
                  icon: Icons.person_outline,
                  text: 'SALIM ALAYDRUS',
                ),
                const Divider(),
                _ProfileItem(icon: Icons.phone_outlined, text: '1462300043'),
                const Divider(),
                _ProfileItem(
                  icon: Icons.email_outlined,
                  text: 'salim@gmail.com',
                ),
                const Divider(),
                _ProfileItem(
                  icon: Icons.location_on_outlined,
                  text: 'Surabaya',
                ),
                const Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _ProfileItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.black, size: 24),
          const SizedBox(width: 16),
          Text(text, style: const TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}
