import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:find_kajian/shared/theme/theme_config.dart';
import 'package:find_kajian/shared/util/url_launcher/url_launcher.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';

import '../controller/kajian_terdekat_controller.dart';
import '../state/kajian_terdekat_state.dart';

class KajianTerdekatView extends StatefulWidget {
  const KajianTerdekatView({Key? key}) : super(key: key);

  @override
  State<KajianTerdekatView> createState() => _KajianTerdekatViewState();
}

class _KajianTerdekatViewState extends State<KajianTerdekatView> {
  KajianTerdekatController controller = KajianTerdekatController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<KajianTerdekatController>()) {
      GetIt.I.unregister<KajianTerdekatController>();
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
      child: BlocListener<KajianTerdekatController, KajianTerdekatState>(
        listener: (context, state) {},
        child: BlocBuilder<KajianTerdekatController, KajianTerdekatState>(
          builder: (context, state) {
            final bloc = context.read<KajianTerdekatController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    KajianTerdekatController controller,
    KajianTerdekatState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kajian Terdekat',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.98, // Mengatur lebar menjadi 95% dari lebar layar
              // height: MediaQuery.of(context).size.height * 0.12, // Contoh: 10% dari tinggi layar
              height: 98,
              child: Card(
                margin: EdgeInsets.fromLTRB(12, 14, 12, 6),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    state.fullAddress == null || state.fullAddress!.isEmpty
                        ? 'Lokasi saat ini: \nLoading...'
                        : 'Lokasi saat ini: \n${state.fullAddress}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    textAlign: TextAlign.left,
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
                                            color: Colors.grey[
                                                600], // Warna background shimmer
                                            borderRadius:
                                                BorderRadius.circular(8.0))),
                                    const SizedBox(width: 12.0),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              width: double.infinity,
                                              height: 16.0,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[
                                                      600], // Warna background shimmer
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0))),
                                          const SizedBox(height: 4.0),
                                          Container(
                                              width: double.infinity,
                                              height: 14.0,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[
                                                      600], // Warna background shimmer
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0))),
                                          const SizedBox(height: 3.0),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                  child: Container(
                                                      height: 14.0,
                                                      decoration: BoxDecoration(
                                                          color: Colors.grey[
                                                              600], // Warna background shimmer
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0)))),
                                              const SizedBox(width: 12.0),
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 50,
                                                    height: 14.0,
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey[
                                                          600], // Warna background shimmer
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
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
                      : ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          itemCount: state.products.length,
                          itemBuilder: (BuildContext context, int index) {
                            var item = state.products[index];
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(4.0, 0, 4, 0),
                              child: InkWell(
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
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    // Poster Kajian
                                                    Center(
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Colors.grey[300],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
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
                                                        margin: const EdgeInsets
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
                                                              (context, url) =>
                                                                  Center(
                                                            child: Container(
                                                              width: 69,
                                                              height: 69,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                          .grey[
                                                                      300],
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              8.0))),
                                                              child: Center(
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
                                                                  url, error) =>
                                                              Center(
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
                                                              FontWeight.w600),
                                                    ),
                                                    Text(
                                                      item['pemateri'],
                                                      style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    const SizedBox(height: 15),
                                                    Text(
                                                      item['tempat_kajian'],
                                                      style: const TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    Text(
                                                      item['alamat'],
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    const SizedBox(height: 15),
                                                    const Text(
                                                      'Tanggal',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    Text(
                                                      item['tanggal'],
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    const SizedBox(height: 15),
                                                    const Text(
                                                      'Waktu',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    Text(
                                                      item['waktu'] + " WITA",
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400),
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
                                                      color: Color(0xffFFFFFF),
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
                                                        ColorFilter.mode(
                                                            Colors.white,
                                                            BlendMode.srcIn),
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        tertiaryColor,
                                                    minimumSize:
                                                        const Size.fromHeight(
                                                            48),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
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
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8.0),
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
                                                borderRadius: BorderRadius.all(
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
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                8.0))),
                                                child: Center(
                                                  child: Icon(
                                                      Icons.image_not_supported,
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
                                              children: [
                                                Text(
                                                  item["judul_kajian"],
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 4.0,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
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
                                                            style: TextStyle(
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
                                                    const SizedBox(
                                                      width: 12.0,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          item["jarak"]
                                                                  .toString() +
                                                              " Km",
                                                          style: TextStyle(
                                                            fontSize: 13.0,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 2.5,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .location_pin, // Menggunakan ikon dari Icons
                                                          size: 20.0,
                                                          color:
                                                              tertiaryColor, // Ukuran ikon
                                                        ),
                                                      ],
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
                                      margin: EdgeInsets.only(left: 81),
                                      height: 1,
                                      color: Colors.grey[400],
                                    ),
                                  ],
                                ),
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
