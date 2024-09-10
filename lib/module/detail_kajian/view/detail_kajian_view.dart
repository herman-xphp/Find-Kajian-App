import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_kajian/shared/theme/theme_config.dart';
import 'package:find_kajian/shared/util/dialog/show_awesome_dialog.dart';
import 'package:find_kajian/shared/util/validator/validator.dart';
import 'package:find_kajian/shared/widget/form/button/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';

import '../controller/detail_kajian_controller.dart';
import '../state/detail_kajian_state.dart';

class DetailKajianView extends StatefulWidget {
  const DetailKajianView({Key? key}) : super(key: key);

  @override
  State<DetailKajianView> createState() => _DetailKajianViewState();
}

class _DetailKajianViewState extends State<DetailKajianView> {
  DetailKajianController controller = DetailKajianController();
  final TextEditingController contentController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (GetIt.I.isRegistered<DetailKajianController>()) {
      GetIt.I.unregister<DetailKajianController>();
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
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => controller,
      child: BlocListener<DetailKajianController, DetailKajianState>(
        listener: (context, state) {},
        child: BlocBuilder<DetailKajianController, DetailKajianState>(
          builder: (context, state) {
            final bloc = context.read<DetailKajianController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    DetailKajianController controller,
    DetailKajianState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ulasan Kajian',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: state.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 90,
                                        height: 90,
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
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl: state.kajianData[
                                                          "poster_kajian"] ==
                                                      null ||
                                                  state
                                                      .kajianData[
                                                          "poster_kajian"]
                                                      .isEmpty
                                              ? 'assets/splash_image.png'
                                              : state
                                                  .kajianData['poster_kajian'],
                                          width: 90,
                                          height: 90,
                                          fit: BoxFit.cover,
                                          imageBuilder:
                                              (context, imageProvider) =>
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
                                                padding: const EdgeInsets.only(
                                                    right: 8),
                                                child: Text(
                                                  state.kajianData[
                                                                  "judul_kajian"] ==
                                                              null ||
                                                          state
                                                              .kajianData[
                                                                  "judul_kajian"]
                                                              .isEmpty
                                                      ? 'Loading...'
                                                      : state.kajianData[
                                                          'judul_kajian'],
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8),
                                                child: Text(
                                                  state.kajianData[
                                                                  "pemateri"] ==
                                                              null ||
                                                          state
                                                              .kajianData[
                                                                  "pemateri"]
                                                              .isEmpty
                                                      ? 'Loading...'
                                                      : state.kajianData[
                                                          'pemateri'],
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5.0,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8),
                                                child: Text(
                                                  state.kajianData[
                                                                  "tempat_kajian"] ==
                                                              null ||
                                                          state
                                                              .kajianData[
                                                                  "tempat_kajian"]
                                                              .isEmpty
                                                      ? 'Loading...'
                                                      : state.kajianData[
                                                          'tempat_kajian'],
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8),
                                                child: Text(
                                                  state.kajianData["alamat"] ==
                                                              null ||
                                                          state
                                                              .kajianData[
                                                                  "alamat"]
                                                              .isEmpty
                                                      ? 'Loading...'
                                                      : state
                                                          .kajianData['alamat'],
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: secondaryTextColor,
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
                  Card(
                    margin: EdgeInsets.fromLTRB(16, 10, 16, 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Post Ulasan Kamu',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              QButton(
                                label: "Post",
                                width: 85,
                                height: 30,
                                color: tertiaryColor,
                                onPressed: () {
                                  bool isValid =
                                      formKey.currentState!.validate();
                                  if (!isValid) {
                                    print('test');
                                    return;
                                  }

                                  controller.saveUlasan(
                                    onSuccess: () {
                                      showAwesomeDialog(
                                        desc: 'Ulasan berhasil di post.',
                                        onOkPressed: () {
                                          controller.getReviewByKajianId(state
                                              .kajianData["kajian_id"]
                                              .toString());
                                          contentController.clear();
                                        },
                                      );
                                    },
                                    onFailure: () {
                                      showAwesomeDialog(
                                        type: DialogType.error,
                                        title: 'Oops!',
                                        desc:
                                            'Terjadi kesalahan saat post ulasan. Silakan coba lagi.',
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                          child: Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  initialValue: state.userData["name"],
                                  decoration: InputDecoration(
                                    labelText: 'Nama',
                                    border: OutlineInputBorder(),
                                  ),
                                  readOnly: true,
                                  // enabled: false, // Membuat TextFormField menjadi disabled
                                ),
                                const SizedBox(height: 18.0),
                                TextFormField(
                                  controller: contentController,
                                  // autofocus: true,
                                  validator: Validator.required,
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    hintText:
                                        'Silahkan berikan ulasan kepada kami.',
                                  ),
                                  onChanged: (value) {
                                    state.content = value;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Ulasan Kajian (${state.reviews.length})',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              // const SizedBox(width: 2.0),
                              // Spacer(),
                              // if (state.reviews.length > 5)
                              //   Padding(
                              //     padding: const EdgeInsets.all(8.0),
                              //     child: InkWell(
                              //         onTap: () => Get.to(ReviewKajianView()),
                              //         child: Text('Lihat Semua >')),
                              //   )
                              // else
                              //   Container()
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.38,
                          child: state.reviews.isEmpty
                              ? Center(child: Text('Belum ada ulasan.'))
                              : Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: ListView.builder(
                                    itemCount: state.reviews.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var item = state.reviews[index];
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.account_circle,
                                                size: 40,
                                                color: tertiaryColor,
                                              ),
                                              const SizedBox(width: 8.0),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    item["user_name"] == null ||
                                                            item["user_name"]
                                                                .isEmpty
                                                        ? ''
                                                        : item["user_name"],
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    item["user_job"] == null ||
                                                            item["user_job"]
                                                                .isEmpty
                                                        ? 'Wirasuasta'
                                                        : item["user_job"],
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 0, 0, 0),
                                                child: Text(
                                                  '1 hari yang lalu.',
                                                  style: TextStyle(
                                                    color: secondaryTextColor,
                                                  ),
                                                ),
                                              ),
                                              Spacer(),
                                              item["user_id"] ==
                                                      state.userData["id"]
                                                  ? IconButton(
                                                      icon:
                                                          Icon(Icons.more_vert),
                                                      color: tertiaryColor,
                                                      onPressed: () {
                                                        showModalBottomSheet(
                                                          context: context,
                                                          builder: (context) {
                                                            return Container(
                                                              child: Wrap(
                                                                children: <Widget>[
                                                                  ListTile(
                                                                    leading: Icon(
                                                                        Icons
                                                                            .edit),
                                                                    title: Text(
                                                                        'Edit'),
                                                                    onTap: () {
                                                                      print(
                                                                          'edit action');
                                                                    },
                                                                    // onTap: () {
                                                                    //   // Tambahkan aksi untuk mengedit di sini
                                                                    //   print(
                                                                    //       'edit action');
                                                                    //   controller
                                                                    //       .editUlasan(
                                                                    //     reviewId:
                                                                    //         item["id"],
                                                                    //     onSuccess:
                                                                    //         () {
                                                                    //       showAwesomeDialog(
                                                                    //         desc:
                                                                    //             'Ulasan berhasil di hapus.',
                                                                    //         onOkPressed:
                                                                    //             () {
                                                                    //           controller.getReviewByKajianId(item['kajian_id'].toString());
                                                                    //           Navigator.of(context).pop();
                                                                    //           contentController.clear();
                                                                    //         },
                                                                    //       );
                                                                    //     },
                                                                    //     onFailure:
                                                                    //         () {
                                                                    //       showAwesomeDialog(
                                                                    //         type:
                                                                    //             DialogType.error,
                                                                    //         title:
                                                                    //             'Oops!',
                                                                    //         desc:
                                                                    //             'Terjadi kesalahan saat hapus ulasan. Silakan coba lagi.',
                                                                    //       );
                                                                    //     },
                                                                    //   );
                                                                    //   // Menutup BottomSheet
                                                                    // },
                                                                  ),
                                                                  ListTile(
                                                                    leading:
                                                                        Icon(
                                                                      Icons
                                                                          .delete,
                                                                      color:
                                                                          dangerColor,
                                                                    ),
                                                                    title: Text(
                                                                      'Hapus',
                                                                      style:
                                                                          TextStyle(
                                                                        color:
                                                                            dangerColor,
                                                                      ),
                                                                    ),
                                                                    onTap: () {
                                                                      // Tambahkan aksi untuk menghapus di sini
                                                                      controller
                                                                          .deleteReview(
                                                                        reviewId:
                                                                            item["id"],
                                                                        onSuccess:
                                                                            () {
                                                                          showAwesomeDialog(
                                                                            desc:
                                                                                'Ulasan berhasil di hapus.',
                                                                            onOkPressed:
                                                                                () {
                                                                              controller.getReviewByKajianId(item['kajian_id'].toString());
                                                                              Navigator.of(context).pop();
                                                                            },
                                                                          );
                                                                        },
                                                                        onFailure:
                                                                            () {
                                                                          showAwesomeDialog(
                                                                            type:
                                                                                DialogType.error,
                                                                            title:
                                                                                'Oops!',
                                                                            desc:
                                                                                'Terjadi kesalahan saat hapus ulasan. Silakan coba lagi.',
                                                                          );
                                                                        },
                                                                      );

                                                                      // Menutup BottomSheet
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                        // Tindakan yang ingin dilakukan saat ikon diklik
                                                      },
                                                    )
                                                  : Container()
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                4, 4, 4, 16),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.81,
                                            child: Text(
                                              item["content"] == null ||
                                                      item["content"].isEmpty
                                                  ? ''
                                                  : item["content"],
                                              textAlign: TextAlign.justify,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 5,
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
