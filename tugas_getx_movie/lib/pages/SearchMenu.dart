import 'package:flutter/material.dart';
import 'package:tugas_getx_movie/widget/my_textfield.dart';

class SearchMenu extends StatefulWidget {
  @override
  _SearchMenuState createState() => _SearchMenuState();
}

class _SearchMenuState extends State<SearchMenu> {
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
 
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            MyTextField(
              hintText: "Search...",
              prefixicon: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                  Icons.search,
                  ),
                ),
                hintStyle: TextStyle(
                color: Colors.grey, 
                fontSize: 16,      
              ),
            ),
          ],       
        ),
      ),
    );
  }
}