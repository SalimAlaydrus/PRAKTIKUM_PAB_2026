import 'package:flutter/material.dart';
import 'page3.dart';
import 'page4.dart';

class Movie {
  final String title;
  final String year;
  final String genre;
  final String director;
  final String imageUrl;

  const Movie({
    required this.title,
    required this.year,
    required this.genre,
    required this.director,
    required this.imageUrl,
  });
}

const List<Movie> movies = [
  Movie(
    title: 'Ghost in the Shell',
    year: '2026',
    genre: 'Horror',
    director: 'JOKO ANWAR',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPMMAJVmS55BTyluKH3mQd-UGrCZecXmPRrA&s',
  ),
  Movie(
    title: 'A Copy of My Mind',
    year: '2006',
    genre: 'Drama',
    director: 'JOKO ANWAR',
    imageUrl: 'https://cf.shopee.co.id/file/047ceef3561bc314ff514fa5952ec072',
  ),
  Movie(
    title: 'Janji Joni',
    year: '2005',
    genre: 'Komedi',
    director: 'JOKO ANWAR',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/id/9/9a/Janjijoni.jpg',
  ),
  Movie(
    title: 'Gundala',
    year: '2019',
    genre: 'Action',
    director: 'JOKO ANWAR',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/id/d/de/Gundala_%282019%29_poster.jpg?_=20200122031058',
  ),
  Movie(
    title: 'KKN Di Desa Penari',
    year: '2020',
    genre: 'Horror',
    director: 'JOKO ANWAR',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/id/b/b7/KKN_di_Desa_Penari.jpg',
  ),
  Movie(
    title: 'Perempuan Tanah Jahanam',
    year: '2023',
    genre: 'Horror',
    director: 'JOKO ANWAR',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/id/thumb/0/0e/PTJ_%282019%29.jpg/500px-PTJ_%282019%29.jpg',
  ),
  Movie(
    title: 'Pabrik Gula',
    year: '2023',
    genre: 'Drama',
    director: 'JOKO ANWAR',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/id/2/2e/Poster_Pabrik_Gula.jpg',
  ),
  Movie(
    title: 'Siksa Kubur',
    year: '2019',
    genre: 'Religion',
    director: 'JOKO ANWAR',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/id/b/bf/Poster_Siksa_Kubur.jpg',
  ),
  Movie(
    title: 'Pengepungan Di Bukit Duri',
    year: '2025',
    genre: 'Drama',
    director: 'JOKO ANWAR',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/id/0/0d/Poster_PDBD.jpg',
  ),
  Movie(
    title: 'Arisan!',
    year: '2003',
    genre: 'Comedy',
    director: 'JOKO ANWAR',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/id/9/99/Arisan.jpg',
  ),
];

class Page2 extends StatelessWidget {
  const Page2({super.key});

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
            Navigator.pop(context); // Home → kembali ke Page1
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Page4()),
            );
          }
          // index == 1 (Movie) → tidak melakukan apa-apa, sudah di Page2
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
          'S.A.PICTURES',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
      body: Column(
        children: [
          // Director info
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Image.network(
                  'https://m.media-amazon.com/images/M/MV5BYjU0MWQ4NWMtODJmZS00NGQ0LTkyZTItNDZhYjdhODcwZjQzXkEyXkFqcGc@._V1_.jpg',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.person, size: 40),
                ),
                const SizedBox(width: 8),
                const Text(
                  'KARYA JOKO ANWAR ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ],
            ),
          ),

          // Grid poster
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.68,
              ),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Page3(selectedMovie: movie),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          movie.imageUrl,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                color: Colors.grey.shade300,
                                child: const Icon(Icons.movie),
                              ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54),
                        ),
                        child: Text(
                          movie.genre,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}