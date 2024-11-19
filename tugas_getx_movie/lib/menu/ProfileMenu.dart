import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_getx_movie/widget/my_text.dart';
import 'package:tugas_getx_movie/widget/my_button.dart';
import 'package:tugas_getx_movie/controller/responsif_controller.dart'; // Impor controller Anda

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final ResponsifController responsiveController = Get.put(ResponsifController());

    // Memperbarui lebar layar saat widget dibangun
    WidgetsBinding.instance.addPostFrameCallback((_) {
      responsiveController.updateScreenWidth(MediaQuery.of(context).size.width);
    });

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Your Profile',
          style: TextStyle(
            color: Color.fromARGB(255, 201, 181, 4),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 30, 29, 29),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: responsiveController.isMobile() ? 20 : 130.0, // Responsif pada padding
          vertical: 45.0,
        ),
        child: ListView(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://foto.kontan.co.id/5rJWu7BOedHx8-He3Hbz3-A6wlk=/smart/2023/08/23/906860685p.jpg'),
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.center,
              child: MyText(
                title: 'Hi Attar',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.center,
              child: MyText(
                title: 'AttarHoreg@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 123, 119, 119),
                ),
              ),
            ),
            const SizedBox(height: 20),
            MyButton(
              label: 'Exit',
              onPressed: () {
                Get.offAllNamed('/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
