import 'package:flutter/material.dart';
import 'my_text.dart';
import 'package:get/get.dart';

class MyImage extends StatefulWidget {
  final String imageUrl;
  final String title;
  final Color textColor;
  final VoidCallback? onFavorite;
  final VoidCallback? onDelete;
  final bool isFavorited;

  const MyImage({
    required this.imageUrl,
    required this.title,
    this.textColor = Colors.white,
    this.onFavorite,
    this.onDelete,
    this.isFavorited = false,
    super.key,
  });

  @override
  _MyImageState createState() => _MyImageState();
}

class _MyImageState extends State<MyImage> {
  late bool isFavorited;

  @override
  void initState() {
    super.initState();
    isFavorited = widget.isFavorited;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 150,
      margin: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10), // Melengkungkan sudut gambar
                child: Image.network(
                  widget.imageUrl,
                  height: 160,
                  width: 110,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 120,
                right: 75,
                child: IconButton(
                  icon: isFavorited
                      ? const Icon(Icons.bookmark, color: Colors.yellow)
                      : const Icon(Icons.bookmark_add_outlined, color: Colors.yellow),
                  onPressed: () {
                    setState(() {
                      isFavorited = !isFavorited;
                    });

                    if (isFavorited) {
                      // Menambahkan ke favorit
                      if (widget.onFavorite != null) {
                        widget.onFavorite!();
                      }

                      // Menampilkan snackbar dengan warna kuning
                      Get.snackbar(
                        'Success', 
                        '${widget.title} has been added to favorites.',
                        backgroundColor: Colors.yellow, // Set warna latar belakang snackbar
                        colorText: Colors.black, // Set warna teks snackbar
                      );
                    } else {
                      // Menghapus dari favorit
                      if (widget.onDelete != null) {
                        widget.onDelete!();
                      }

                      // Menampilkan snackbar dengan warna kuning
                      Get.snackbar(
                        'Removed', 
                        '${widget.title} has been removed from favorites.',
                        backgroundColor: Colors.yellow, // Set warna latar belakang snackbar
                        colorText: Colors.black, // Set warna teks snackbar
                      );
                    }
                  },
                ),
              ),
              if (widget.onDelete != null)
                Positioned(
                  right: 0,
                  child: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: widget.onDelete,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 10),
          MyText(
            title: widget.title,
            textColor: widget.textColor,
          ),
        ],
      ),
    );
  }
}
