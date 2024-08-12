// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:find_kajian/module/daftar_ustadz/view/daftar_ustadz_view.dart';
import 'package:find_kajian/module/kajian_terdekat/view/kajian_terdekat_view.dart';
import 'package:find_kajian/module/masjid_terdekat/view/masjid_terdekat_view.dart';
import 'package:find_kajian/shared/theme/theme_config.dart';
import 'package:find_kajian/state_util.dart';

class HomeMenu extends StatelessWidget {
  HomeMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        // color: Color(0xff121B22),
        borderRadius: BorderRadius.all(
          Radius.circular(
            18.0,
          ),
        ),
      ),
      margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
      padding: EdgeInsets.fromLTRB(12, 12, 12, 18),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => Get.to(KajianTerdekatView()),
                child: Column(
                  children: [
                    Card(
                      color: tertiaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(16), // Mengatur border radius
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Icon(
                          Icons.menu_book_outlined,
                          size: 40.0,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      'Kajian Terdekat',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        // color: secondaryTextColor,
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Get.to(MasjidTerdekatView()),
                child: Column(
                  children: [
                    Card(
                      color: tertiaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(16), // Mengatur border radius
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.home_work_rounded,
                          size: 40.0,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      'Masjid Terdekat',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        // color: secondaryTextColor,
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Get.to(DaftarUstadzView()),
                child: Column(
                  children: [
                    Card(
                      color: tertiaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(16), // Mengatur border radius
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.person,
                          size: 42.0,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      'Daftar Ustadz',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        // color: secondaryTextColor,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
