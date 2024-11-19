import 'package:flutter/material.dart';
import 'package:tugas_getx_movie/pages/responsif_widget/comingsooncard.dart';

class GridtableComing extends StatefulWidget {
  const GridtableComing({super.key});

  @override
  State<GridtableComing> createState() => _ComingSoonPageState();
}

class _ComingSoonPageState extends State<GridtableComing> {
  // Daftar film statis untuk contoh
  List<Map<String, dynamic>> comingSoonMovies = [
    {
      'title': 'Joker',
      'imageUrl': 'https://asset.tix.id/wp-content/uploads/2024/09/aecd8480-67db-49cb-863e-d4b1c0d82929-600x885.webp',
      'releaseDate': '2025-12-20',
    },
    {
      'title': 'White Bird',
      'imageUrl': 'https://static1.moviewebimages.com/wordpress/wp-content/uploads/2024/06/white-bird-movie-2024.jpg',
      'releaseDate': '2023-05-05',
    },
     {
      'title': 'Terrifier',
      'imageUrl': 'https://static.promediateknologi.id/crop/0x0:0x0/x/photo/p3/107/2024/07/26/GTRBGnJWQAAAv8L-303427078.jpeg',
      'releaseDate': '2023-05-05',
    },
    {
      'title': 'Smile 2',
      'imageUrl': 'https://dx35vtwkllhj9.cloudfront.net/paramountpictures/smile-2/images/regions/us/updates2/header.jpg',
      'releaseDate': '2023-05-05',
    },
     {
      'title': 'Aftermath',
      'imageUrl':   'https://m.media-amazon.com/images/M/MV5BOWM2ZmE2Y2QtMTBiNS00ZDE0LWI2YmMtYzQ5MjUwYjJlMzQwXkEyXkFqcGc@._V1_.jpg',
      'releaseDate': '2023-05-05',
    },
     {
      'title': 'Red One',
      'imageUrl': 'https://m.media-amazon.com/images/M/MV5BZmFkMjE4NjQtZTVmZS00MDZjLWE2ZmEtZTkzODljNjhlNWUxXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
      'releaseDate': '2023-05-05',
    },
     {
      'title': 'Bad Genius',
      'imageUrl': 'https://image.tmdb.org/t/p/original/iPs5OlKJsFVFW9XyskRVvQBmHC2.jpg',
      'releaseDate': '2023-05-05',
    },
     {
      'title': 'Gladiator 2',
      'imageUrl': 'https://cdn.teater.co/imgs/gladiator-2-2024-2_600_880.webp',
      'releaseDate': '2023-05-05',
    },
   
  ];
  
  List<Map<String, dynamic>> filteredMovies = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    _filterMovies();
  }

  void _filterMovies() {
    setState(() {
      if (searchQuery.isEmpty) {
        filteredMovies = comingSoonMovies;
      } else {
        filteredMovies = comingSoonMovies
            .where((movie) =>
                movie['title']
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()))
            .toList();
      }
    });
  }

  void _onSearchChanged(String query) {
    setState(() {
      searchQuery = query;
      _filterMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Coming Soon', style: TextStyle( color: Color.fromARGB(255, 201, 181, 4),)),
        backgroundColor:  Color.fromARGB(255, 30, 29, 29),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: isLandscape ? _buildLandscapeGrid() : _buildPortraitList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLandscapeGrid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.7,
      ),
      itemCount: filteredMovies.length,
      itemBuilder: (context, index) {
        final movie = filteredMovies[index];
        return ComingSoonCard(movie: movie);
      },
    );
  }

  Widget _buildPortraitList() {
    return ListView.builder(
      itemCount: filteredMovies.length,
      itemBuilder: (context, index) {
        final movie = filteredMovies[index];
        return ComingSoonCard(movie: movie);
      },
    );
  }
}
