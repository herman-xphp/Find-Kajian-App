import 'package:find_kajian/module/detail_kajian/controller/detail_kajian_controller.dart';
import 'package:find_kajian/module/detail_kajian/view/detail_kajian_view.dart';
import 'package:find_kajian/shared/util/db_service/db_service.dart';
import 'package:find_kajian/state_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:find_kajian/shared/theme/theme_config.dart';
import 'package:shimmer/shimmer.dart';
import '../controller/home_controller.dart';
import 'package:find_kajian/shared/util/url_launcher/url_launcher.dart';

class HomeKajianTerbaru extends StatefulWidget {
  const HomeKajianTerbaru({Key? key}) : super(key: key);

  @override
  State<HomeKajianTerbaru> createState() => _HomeKajianTerbaruState();
}

class _HomeKajianTerbaruState extends State<HomeKajianTerbaru> {
  HomeController controller = HomeController();

  void _navigateToKajianDetail(String id) async {
    DBService.set('kajian_id', id);

    // Menunggu kedua Future (getKajian dan getKajianReviewByKajianId) selesai
    await Future.wait([
      DetailKajianController().fetchUserData(),
      DetailKajianController().getKajian(id),
      DetailKajianController().getReviewByKajianId(id),
    ]);

    final result = await Get.to(DetailKajianView());
    print('masuk di navigationToKajianDetail');
    // print(cont);

    // Tangani hasil dari UpdateProfileView jika diperlukan
    if (result == null) {
      // Misalnya, refresh data atau lakukan sesuatu setelah update berhasil
      controller.init();
      DBService.clear('kajian_id');
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeController>().state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          margin: EdgeInsets.fromLTRB(16, 20, 16, 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: state.isLoading
              ? Container(
                  padding: EdgeInsets.fromLTRB(12, 18, 12, 8),
                  height: MediaQuery.of(context).size.height * 0.51,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    itemCount: 5, // Jumlah item shimmer
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[600]!,
                        highlightColor: Colors.grey[400]!,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 69,
                                height: 69,
                                decoration: BoxDecoration(
                                  color: Colors.grey[600],
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              const SizedBox(width: 12.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 16.0,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[600],
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    const SizedBox(height: 4.0),
                                    Container(
                                      width: double.infinity,
                                      height: 14.0,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[600],
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    const SizedBox(height: 3.0),
                                    Container(
                                      width: double.infinity,
                                      height: 14.0,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[600],
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Container(
                  padding: EdgeInsets.fromLTRB(12, 12, 12, 8),
                  height: MediaQuery.of(context).size.height * 0.535,
                  child: ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount: state.latestKajian.length,
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      var item = state.latestKajian[index];
                      return InkWell(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                                      offset:
                                                          const Offset(0, 3),
                                                    ),
                                                  ],
                                                ),
                                                padding:
                                                    const EdgeInsets.all(10),
                                                margin: const EdgeInsets.only(
                                                    top: 10, bottom: 40),
                                                width: 320,
                                                height: 320,
                                                child: CachedNetworkImage(
                                                  imageUrl: item['photo'],
                                                  fit: BoxFit.cover,
                                                  placeholder: (context, url) =>
                                                      Center(
                                                    child: Container(
                                                      width: 69,
                                                      height: 69,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Colors.grey[300],
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          8.0))),
                                                      child: Center(
                                                        child: Icon(
                                                            Icons
                                                                .image_not_supported,
                                                            size: 50,
                                                            color: Colors.grey),
                                                      ),
                                                    ),
                                                  ),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Center(
                                                    child: Icon(
                                                      Icons.image_not_supported,
                                                      size: 50,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),

                                            // judul kajian
                                            Text(
                                              item['judul_kajian'],
                                              style: const TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              item['pemateri'],
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            const SizedBox(height: 15),
                                            Text(
                                              item['tempat_kajian'],
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              item['alamat'],
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            const SizedBox(height: 15),
                                            const Text(
                                              'Tanggal',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              item['tanggal'],
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            const SizedBox(height: 15),
                                            const Text(
                                              'Waktu',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              item['waktu'] + " WITA",
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
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
                                                  'Lihat Ulasan',
                                                  style: TextStyle(
                                                    color: tertiaryColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  _navigateToKajianDetail(
                                                      item["kajian_id"]
                                                          .toString());
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
                                                        BorderRadius.circular(
                                                            8),
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
                                                    item['latitude'].toString(),
                                                    item['longitude']
                                                        .toString(),
                                                  );
                                                },
                                                icon: SvgPicture.asset(
                                                  'assets/svg/cursor.svg',
                                                  width: 24,
                                                  height: 24,
                                                  colorFilter: ColorFilter.mode(
                                                      Colors.white,
                                                      BlendMode.srcIn),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      tertiaryColor,
                                                  minimumSize:
                                                      const Size.fromHeight(48),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 6.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: item["photo"],
                                    width: 69,
                                    height: 69,
                                    fit: BoxFit.cover,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      width: 69,
                                      height: 69,
                                      decoration: BoxDecoration(
                                        color: tertiaryColor,
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            8.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) => Center(
                                      child: Container(
                                        width: 69,
                                        height: 69,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.0))),
                                        child: Center(
                                          child: Icon(Icons.image_not_supported,
                                              size: 30, color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Container(
                                      width: 69,
                                      height: 69,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8.0),
                                        ),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.image_not_supported,
                                          size: 30,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item["judul_kajian"],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4.0,
                                        ),
                                        Text(
                                          item["tempat_kajian"],
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            // color: Colors.grey[600],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 3.0,
                                        ),
                                        Text(
                                          item["alamat"],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 81),
                              height: 1,
                              color: Colors.grey[400],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
        ),
      ],
    );
  }
}
