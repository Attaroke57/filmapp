import 'package:flutter/material.dart';

class ComingSoonCard extends StatelessWidget {
  final Map<String, dynamic> movie;

  const ComingSoonCard({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.1, 
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(8), 
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                movie['imageUrl'],
                height: screenWidth * 0.3, 
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Release Date: ${movie['releaseDate'] ?? 'Unknown'}',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.yellowAccent,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
