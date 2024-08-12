import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_kajian/shared/theme/theme_config.dart';
import 'package:find_kajian/shared/util/url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import '../controller/masjid_get_kajian_controller.dart';
import '../state/masjid_get_kajian_state.dart';
import 'package:get_it/get_it.dart';

class MasjidGetKajianView extends StatefulWidget {
  const MasjidGetKajianView({Key? key}) : super(key: key);

  @override
  State<MasjidGetKajianView> createState() => _MasjidGetKajianViewState();
}

class _MasjidGetKajianViewState extends State<MasjidGetKajianView> {
  MasjidGetKajianController controller = MasjidGetKajianController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<MasjidGetKajianController>()) {
      GetIt.I.unregister<MasjidGetKajianController>();
    }
    GetIt.I.registerSingleton(controller);
    controller.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => controller.ready(),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _refresh() async {
    await controller.refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => controller,
      child: BlocListener<MasjidGetKajianController, MasjidGetKajianState>(
        listener: (context, state) {},
        child: BlocBuilder<MasjidGetKajianController, MasjidGetKajianState>(
          builder: (context, state) {
            final bloc = context.read<MasjidGetKajianController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    MasjidGetKajianController controller,
    MasjidGetKajianState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar Kajian',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.98,
              height: MediaQuery.of(context).size.height * 0.16,
              child: Card(
                margin: EdgeInsets.fromLTRB(12, 14, 12, 6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                child: state.isLoading
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[600]!,
                          highlightColor: Colors.grey[400]!,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 90,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[600],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                const SizedBox(width: 12.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 50,
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
                                        height: 16.0,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[600],
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      const SizedBox(height: 10.0),
                                      Container(
                                        width: 50,
                                        height: 14.0,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[600],
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      const SizedBox(height: 3.0),
                                      Container(
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
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: state.masjidData["gambar"] ==
                                                null ||
                                            state.masjidData["gambar"].isEmpty
                                        ? 'assets/splash_image.png'
                                        : state.masjidData['gambar'],
                                    width: 90,
                                    height: 90,
                                    fit: BoxFit.cover,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      width: 90,
                                      height: 90,
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
                                        width: 90,
                                        height: 90,
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
                                      width: 90,
                                      height: 90,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            8.0,
                                          ),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 0),
                                          child: Text(
                                            "Nama:",
                                            style: TextStyle(
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          state.masjidData["nama"] == null ||
                                                  state.masjidData["nama"]
                                                      .isEmpty
                                              ? 'Loading...'
                                              : state.masjidData['nama'],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          "Alamat:",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 0),
                                          child: Text(
                                            state.masjidData["alamat"] ==
                                                        null ||
                                                    state.masjidData["alamat"]
                                                        .isEmpty
                                                ? 'Loading...'
                                                : state.masjidData['alamat'],
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
            Expanded(
              child: Card(
                margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(
                  20.0,
                ))),
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 12),
                  child: state.isLoading
                      ? ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          itemCount: 10, // Jumlah item shimmer
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey[600]!,
                              highlightColor: Colors.grey[400]!,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 69,
                                      height: 69,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[600],
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    const SizedBox(width: 12.0),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 50,
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
                                            height: 16.0,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[600],
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          const SizedBox(height: 10.0),
                                          Container(
                                            width: 50,
                                            height: 14.0,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[600],
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          const SizedBox(height: 3.0),
                                          Container(
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
                        )
                      : state.kajianData.isEmpty
                          ? Center(child: Text('Belum Ada Kajian.'))
                          : ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              itemCount: state.kajianData.length,
                              itemBuilder: (BuildContext context, int index) {
                                final item = state.kajianData[index];
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
                                                  margin: const EdgeInsets.only(
                                                      top: 15),
                                                  child: Container(
                                                    width: 70,
                                                    height: 4,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Color(0xffB1B1B1),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(50),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 20,
                                                      left: 25,
                                                      right: 20),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      // Poster Kajian
                                                      Center(
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .grey[300],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.2),
                                                                blurRadius: 5,
                                                                offset:
                                                                    const Offset(
                                                                        0, 3),
                                                              ),
                                                            ],
                                                          ),
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                                  top: 10,
                                                                  bottom: 40),
                                                          width: 320,
                                                          height: 320,
                                                          child:
                                                              CachedNetworkImage(
                                                            imageUrl:
                                                                item['photo'],
                                                            fit: BoxFit.cover,
                                                            placeholder:
                                                                (context,
                                                                        url) =>
                                                                    Center(
                                                              child: Container(
                                                                width: 69,
                                                                height: 69,
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                            .grey[
                                                                        300],
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .all(
                                                                            Radius.circular(8.0))),
                                                                child:
                                                                    const Center(
                                                                  child: Icon(
                                                                      Icons
                                                                          .image_not_supported,
                                                                      size: 50,
                                                                      color: Colors
                                                                          .grey),
                                                                ),
                                                              ),
                                                            ),
                                                            errorWidget: (context,
                                                                    url,
                                                                    error) =>
                                                                const Center(
                                                              child: Icon(
                                                                Icons
                                                                    .image_not_supported,
                                                                size: 50,
                                                                color:
                                                                    Colors.grey,
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
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      Text(
                                                        item['pemateri'],
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                      const SizedBox(
                                                          height: 15),
                                                      Text(
                                                        item['tempat_kajian'],
                                                        style: const TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Text(
                                                        item['alamat'],
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                      const SizedBox(
                                                          height: 15),
                                                      const Text(
                                                        'Tanggal',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Text(
                                                        item['tanggal'],
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                      const SizedBox(
                                                          height: 15),
                                                      const Text(
                                                        'Waktu',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Text(
                                                        item['waktu'] + " WITA",
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
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
                                                  child: ElevatedButton.icon(
                                                    label: const Text(
                                                      'Petunjuk Arah',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xffFFFFFF),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      UrlLauncher.openMap(
                                                        double.parse(
                                                            item['latitude']),
                                                        double.parse(
                                                            item['longitude']),
                                                      );
                                                    },
                                                    icon: SvgPicture.asset(
                                                      'assets/svg/cursor.svg',
                                                      width: 24,
                                                      height: 24,
                                                      colorFilter:
                                                          const ColorFilter
                                                              .mode(
                                                              Colors.white,
                                                              BlendMode.srcIn),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          tertiaryColor,
                                                      minimumSize:
                                                          const Size.fromHeight(
                                                              48),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    ),
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
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CachedNetworkImage(
                                              imageUrl: item["photo"],
                                              width: 69,
                                              height: 69,
                                              fit: BoxFit.cover,
                                              imageBuilder:
                                                  (context, imageProvider) =>
                                                      Container(
                                                width: 69,
                                                height: 69,
                                                decoration: BoxDecoration(
                                                  color: tertiaryColor,
                                                  image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(
                                                      8.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              placeholder: (context, url) =>
                                                  Center(
                                                child: Container(
                                                  width: 69,
                                                  height: 69,
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey[300],
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                              Radius.circular(
                                                                  8.0))),
                                                  child: const Center(
                                                    child: Icon(
                                                        Icons
                                                            .image_not_supported,
                                                        size: 30,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Container(
                                                width: 69,
                                                height: 69,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[300],
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(
                                                      8.0,
                                                    ),
                                                  ),
                                                ),
                                                child: const Center(
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
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 4.0,
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              item[
                                                                  "tempat_kajian"],
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 3.0,
                                                            ),
                                                            Text(
                                                              item["alamat"],
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                fontSize: 14.0,
                                                                color: Colors
                                                                    .grey[600],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 81),
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
            ),
          ],
        ),
      ),
    );
  }
}
