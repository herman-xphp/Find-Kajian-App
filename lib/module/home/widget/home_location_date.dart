import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:find_kajian/shared/theme/theme_config.dart';
import 'package:find_kajian/theme_cubit.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:hijri/hijri_calendar.dart';
import '../controller/home_controller.dart';

class HomeLocationDate extends StatelessWidget {
  const HomeLocationDate({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeController>().state;
    final controller = context.read<HomeController>();

    // Atur locale ke bahasa Indonesia
    initializeDateFormatting('id_ID', null);

    // Dapatkan tanggal Gregorian hari ini
    DateTime now = DateTime.now();

    // Format tanggal Gregorian dalam bahasa Indonesia
    String formattedDate =
        DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(now);

    // Dapatkan tanggal Hijriyah
    HijriCalendar.setLocal("en");
    HijriCalendar hijriDate = HijriCalendar.now();
    String formattedHijriDate =
        '${hijriDate.hDay} ${hijriDate.longMonthName} ${hijriDate.hYear}H';

    return Padding(
      padding: EdgeInsets.only(top: 25, left: 8, right: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 4,
                fit: FlexFit.tight,
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      // fit: FlexFit.loose,
                      child: IconButton(
                        onPressed: () => controller.refreshLocation(),
                        icon: Icon(
                          Icons.refresh_rounded,
                          size: 24.0,
                          color: tertiaryColor,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 6,
                      fit: FlexFit.tight,
                      child: Text(
                        state.address == null || state.address!.isEmpty
                            ? 'Loading...'
                            : state.address!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    context.read<ThemeCubit>().toggleTheme();
                  },
                  child: BlocBuilder<ThemeCubit, ThemeState>(
                    builder: (context, themeState) {
                      return Container(
                        // margin: EdgeInsets.only(right: 10),
                        margin: EdgeInsets.all(0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: themeState.isDarkMode
                              ? Color(0xff121B22)
                              : cardColor,
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              size: 14,
                              themeState.isDarkMode
                                  ? Icons.nightlight_round
                                  : Icons.wb_sunny,
                              color: themeState.isDarkMode
                                  ? Colors.white
                                  : tertiaryColor,
                            ),
                            SizedBox(width: 4.0),
                            Center(
                              child: Text(
                                themeState.isDarkMode ? 'Gelap' : 'Terang',
                                style: TextStyle(
                                    color: themeState.isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formattedDate,
                    style: TextStyle(
                      color:
                          themeState.isDarkMode ? Color(0xffE7EAF1) : textColor,
                      fontSize: 13.5,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    formattedHijriDate,
                    style: TextStyle(
                      color:
                          themeState.isDarkMode ? Color(0xffE7EAF1) : textColor,
                      fontSize: 13.5,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              );
            },
          ),
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       formattedDate,
          //       style: TextStyle(
          //         color: secondaryTextColor,
          //         fontSize: 13.5,
          //         fontWeight: FontWeight.w400,
          //       ),
          //     ),
          //     Text(
          //       formattedHijriDate,
          //       style: TextStyle(
          //         color: secondaryTextColor,
          //         fontSize: 13.5,
          //         fontWeight: FontWeight.w400,
          //       ),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
