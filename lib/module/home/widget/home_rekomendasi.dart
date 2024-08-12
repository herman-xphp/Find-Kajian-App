import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:find_kajian/module/home/controller/home_controller.dart';
import 'package:find_kajian/shared/theme/theme_config.dart';

class HomeRekomendasi extends StatefulWidget {
  const HomeRekomendasi({Key? key}) : super(key: key);

  @override
  State<HomeRekomendasi> createState() => _HomeRekomendasiState();
}

class _HomeRekomendasiState extends State<HomeRekomendasi> {
  HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeController>().state;
    return Container(
      margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(18.0),
        ),
      ),
      child: Builder(builder: (context) {
        List<Map<String, String>> images = [
          {
            "url":
                "https://www.findkajian.elayanan.info/storage/photo/tempat_kajian/no-photo.jpg",
            "title": "Masjid Nurul Jannah",
          },
          {
            "url":
                "https://www.findkajian.elayanan.info/storage/poster/kajian/no-photo.jpg",
            "title": "Masjid Agung 45",
          },
          {
            "url":
                "https://www.findkajian.elayanan.info/storage/poster/kajian/no-photo.jpg",
            "title": "Masjid Al-Haqq",
          },
        ];

        return Column(
          children: [
            CarouselSlider(
              carouselController: controller.carouselController,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.22,
                autoPlay: true,
                enlargeCenterPage: true, // Membuat item tengah lebih besar
                viewportFraction:
                    0.87, // Membuat gambar berikutnya terlihat sedikit
                enlargeStrategy: CenterPageEnlargeStrategy
                    .height, // Enlarge berdasarkan tinggi
                onPageChanged: (index, reason) {
                  state.currentIndex = index;
                  setState(() {});
                },
              ),
              items: images.map((imageData) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10.0), // Margin di sebelah kanan dan kiri
                      decoration: BoxDecoration(
                        color: tertiaryColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(14.0),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            imageData["url"]!,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.55),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(14.0),
                                  bottomRight: Radius.circular(14.0),
                                ),
                              ),
                              child: Text(
                                imageData["title"]!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.asMap().entries.map((entry) {
                bool isSelected = state.currentIndex == entry.key;
                return GestureDetector(
                  onTap: () =>
                      controller.carouselController.animateToPage(entry.key),
                  child: Container(
                    width: isSelected ? 40 : 6.0,
                    height: 6.0,
                    margin: const EdgeInsets.only(
                      right: 6.0,
                      top: 12.0,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? tertiaryColor
                          : tertiaryColor.withOpacity(0.6),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      }),
    );
  }
}
