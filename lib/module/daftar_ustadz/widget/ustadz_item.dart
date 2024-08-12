import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_kajian/module/ustadz_get_kajian/controller/ustadz_get_kajian_controller.dart';
import 'package:find_kajian/module/ustadz_get_kajian/view/ustadz_get_kajian_view.dart';
import 'package:find_kajian/shared/theme/theme_config.dart';
import 'package:find_kajian/shared/util/db_service/db_service.dart';
import 'package:find_kajian/shared/util/url_launcher/url_launcher.dart';
import 'package:find_kajian/state_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../controller/daftar_ustadz_controller.dart';

class UstadzItem extends StatefulWidget {
  final item;

  UstadzItem({Key? key, required this.item}) : super(key: key);

  @override
  State<UstadzItem> createState() => _UstadzItemState();
}

class _UstadzItemState extends State<UstadzItem> {
  DaftarUstadzController controller = DaftarUstadzController();

  void _navigateToUstadzDetail(String id) async {
    // Set ID
    DBService.set('ustadz_id', id);

    await UstadzGetKajianController().getKajianByUstadzId(id);
    final result = await Get.to(UstadzGetKajianView());

    // Tangani hasil dari UpdateProfileView jika diperlukan
    if (result == null) {
      // Misalnya, refresh data atau lakukan sesuatu setelah update berhasil
      controller.search('');
      DBService.clear('ustadz_id');
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      margin:
                          const EdgeInsets.only(top: 20, left: 25, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Poster Kajian
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(10),
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 40),
                              width: 320,
                              height: 320,
                              child: CachedNetworkImage(
                                imageUrl: widget.item['photo'],
                                fit: BoxFit.cover,
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
                                          size: 50, color: Colors.grey),
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) => Center(
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
                            'Nama:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            widget.item['nama_ustadz'],
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Deskripsi:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            widget.item['deskripsi'],
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Alamat:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            widget.item['alamat'],
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 8),

                          Text(
                            'Youtube Channel:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          widget.item['youtube'] == "-"
                              ? Text(
                                  "Belum Punya Channel",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              : InkWell(
                                  onTap: () => UrlLauncher.openYoutube(
                                      widget.item['youtube']),
                                  child: Text(
                                    widget.item['youtube'],
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                        ],
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(
                        bottom: 15,
                        left: 22,
                        right: 22,
                        top: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                _navigateToUstadzDetail(
                                    widget.item["id"].toString());
                              },
                              icon: Icon(
                                Icons.menu_book_rounded,
                                color: tertiaryColor,
                                size: 24,
                              ),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: tertiaryColor),
                                minimumSize: const Size.fromHeight(48),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Flexible(
                            flex: 2,
                            child: ElevatedButton.icon(
                              label: const Text(
                                'Undang Ustadz',
                                style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              onPressed: () {
                                UrlLauncher.invitation(widget.item["phone"]);
                              },
                              icon: SvgPicture.asset(
                                'assets/svg/chat-dots.svg',
                                width: 24,
                                height: 24,
                                colorFilter: ColorFilter.mode(
                                    Colors.white, BlendMode.srcIn),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: tertiaryColor,
                                minimumSize: const Size.fromHeight(48),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: widget.item["photo"],
              width: 69,
              height: 69,
              fit: BoxFit.cover,
              imageBuilder: (context, imageProvider) => Container(
                width: 69,
                height: 69,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
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
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Center(
                    child: Icon(Icons.image_not_supported,
                        size: 30, color: Colors.grey),
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Container(
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
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item["nama_ustadz"],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.item["deskripsi"],
                    style: TextStyle(fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.item["alamat"],
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
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
