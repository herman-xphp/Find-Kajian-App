import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:find_kajian/module/masjid_get_kajian/controller/masjid_get_kajian_controller.dart';
import 'package:find_kajian/module/masjid_get_kajian/view/masjid_get_kajian_view.dart';
import 'package:find_kajian/shared/util/db_service/db_service.dart';
import 'package:find_kajian/shared/util/url_launcher/url_launcher.dart';
import 'package:find_kajian/state_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:find_kajian/module/home/controller/home_controller.dart';
import 'package:find_kajian/shared/theme/theme_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class HomeRekomendasi extends StatefulWidget {
  const HomeRekomendasi({Key? key}) : super(key: key);

  @override
  State<HomeRekomendasi> createState() => _HomeRekomendasiState();
}

class _HomeRekomendasiState extends State<HomeRekomendasi> {
  HomeController controller = HomeController();

  void _navigateToMasjidDetail(String id) async {
    DBService.set('masjid_id', id);

    await MasjidGetKajianController().getKajianByMasjidId(id);
    final result = await Get.to(MasjidGetKajianView());
    print('masuk di navigationToMasjidDetail');
    // print(cont);

    // Tangani hasil dari UpdateProfileView jika diperlukan
    if (result == null) {
      // Misalnya, refresh data atau lakukan sesuatu setelah update berhasil
      controller.refreshData();
      DBService.clear('masjid_id');
    }
  }

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
      child: Column(
        children: [
          if (state.isLoading)
            // Tampilkan loading jika data kosong
            Shimmer.fromColors(
              baseColor: Colors.grey[600]!,
              highlightColor: Colors.grey[400]!,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.22,
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: tertiaryColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(14.0),
                  ),
                ),
              ),
            )
          else if (state.topTempatKajian.isNotEmpty)
            CarouselSlider(
              carouselController: controller.carouselController,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.22,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.87,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                onPageChanged: (index, reason) {
                  setState(() {
                    state.currentIndex = index;
                  });
                },
              ),
              items: state.topTempatKajian.map((tempatKajian) {
                return GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(22),
                        ),
                      ),
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return Wrap(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                // strip modal
                                Container(
                                  margin: const EdgeInsets.only(top: 15),
                                  child: Container(
                                    width: 70,
                                    height: 4,
                                    decoration: const BoxDecoration(
                                      color: Color(0xffB1B1B1),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50),
                                      ),
                                    ),
                                  ),
                                ),

                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 20, left: 25, right: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // Poster Kajian
                                      Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                                blurRadius: 5,
                                                offset: const Offset(0, 3),
                                              ),
                                            ],
                                          ),
                                          padding: const EdgeInsets.all(10),
                                          margin: const EdgeInsets.only(
                                              top: 10, bottom: 40),
                                          width: 320,
                                          height: 320,
                                          child: CachedNetworkImage(
                                            imageUrl: tempatKajian['photo'],
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) =>
                                                Center(
                                              child: Container(
                                                width: 69,
                                                height: 69,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[300],
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                8.0))),
                                                child: Center(
                                                  child: Icon(
                                                      Icons.image_not_supported,
                                                      size: 50,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) => Center(
                                              child: Icon(
                                                Icons.image_not_supported,
                                                size: 50,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      Text(
                                        'Nama:',
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      // judul kajian
                                      Text(
                                        tempatKajian['nama'],
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      // const SizedBox(height: 15),

                                      const SizedBox(height: 10),
                                      Text(
                                        "Alamat: ",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      Text(
                                        tempatKajian['alamat'],
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      // const SizedBox(height: 15),
                                    ],
                                  ),
                                ),

                                Container(
                                  margin: const EdgeInsets.only(
                                    bottom: 20,
                                    left: 22,
                                    right: 22,
                                    top: 30,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        flex: 2,
                                        child: OutlinedButton.icon(
                                          label: Text(
                                            'Daftar Kajian',
                                            style: TextStyle(
                                              color: tertiaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          onPressed: () {
                                            _navigateToMasjidDetail(
                                                tempatKajian["id"].toString());
                                          },
                                          icon: Icon(
                                            Icons.menu_book_rounded,
                                            color: tertiaryColor,
                                            size: 24,
                                          ),
                                          style: OutlinedButton.styleFrom(
                                            side: BorderSide(
                                                color: tertiaryColor),
                                            minimumSize:
                                                const Size.fromHeight(48),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10.0),
                                      Flexible(
                                        flex: 2,
                                        child: ElevatedButton.icon(
                                          label: const Text(
                                            'Petunjuk Arah',
                                            style: TextStyle(
                                              color: Color(0xffFFFFFF),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          onPressed: () {
                                            UrlLauncher.openMap(
                                              tempatKajian['latitude'],
                                              tempatKajian['longitude'],
                                            );
                                          },
                                          icon: SvgPicture.asset(
                                            'assets/svg/cursor.svg',
                                            width: 24,
                                            height: 24,
                                            colorFilter: ColorFilter.mode(
                                                Colors.white, BlendMode.srcIn),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: tertiaryColor,
                                            minimumSize:
                                                const Size.fromHeight(48),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Builder(
                    builder: (BuildContext context) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: tertiaryColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(14.0),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                              tempatKajian["photo"]!,
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
                                  tempatKajian["nama"]!,
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
                  ),
                );
              }).toList(),
            )
          else
            Center(
              child: Text(
                "No data available",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),

          // Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: state.topTempatKajian.asMap().entries.map((entry) {
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
      ),
    );
  }
}
