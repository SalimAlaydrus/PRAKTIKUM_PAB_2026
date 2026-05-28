import 'package:flutter/material.dart';
import 'page2.dart';
import 'page4.dart';

class Page3 extends StatelessWidget {
  final Movie selectedMovie;

  const Page3({super.key, required this.selectedMovie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        backgroundColor: const Color(0xFF1E2235),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        onTap: (index) {
          if (index == 0) {
            // Home → kembali sampai Page1
            Navigator.popUntil(context, (route) => route.isFirst);
          }
          if (index == 1) {
            // Movie → kembali ke Page2
            Navigator.pop(context);
          }
          if (index == 2) {
            // Profile → ke Page4
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Page4()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.movie_creation), label: 'Movie'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'CINEFRAME',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hero image
          Image.network(
            selectedMovie.imageUrl,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 200,
              color: Colors.grey.shade300,
              child: const Icon(Icons.movie, size: 64),
            ),
          ),

          const SizedBox(height: 8),

          // Daftar judul film
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: movies.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final movie = movies[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    '${movie.title} (${movie.year})',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: selectedMovie.title == movie.title
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                );
              },
            ),
          ),

          // Tombol Watch Trailer
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Trailer: ${selectedMovie.title}')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: const Text(
                  'WATCH TRAILER',
                  style: TextStyle(color: Colors.white, letterSpacing: 1),
                ),
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Tombol More Details
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(selectedMovie.title),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Genre: ${selectedMovie.genre}'),
                          Text('Year: ${selectedMovie.year}'),
                          Text('Director: ${selectedMovie.director}'),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Tutup'),
                        ),
                      ],
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  side: const BorderSide(color: Colors.black),
                ),
                child: const Text(
                  'MORE DETAILS',
                  style: TextStyle(color: Colors.black, letterSpacing: 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}