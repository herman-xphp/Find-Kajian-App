import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:find_kajian/shared/theme/theme_config.dart';
import 'package:find_kajian/module/search_kajian/widget/search_bar_listdata.dart';

import '../controller/search_kajian_controller.dart';
import '../state/search_kajian_state.dart';

class SearchKajianView extends StatefulWidget {
  const SearchKajianView({Key? key}) : super(key: key);

  @override
  State<SearchKajianView> createState() => _SearchKajianViewState();
}

class _SearchKajianViewState extends State<SearchKajianView> {
  SearchKajianController controller = SearchKajianController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<SearchKajianController>()) {
      GetIt.I.unregister<SearchKajianController>();
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
    // searchController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => GetIt.I<SearchKajianController>(),
      child: BlocListener<SearchKajianController, SearchKajianState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage!)),
            );
          }
        },
        child: BlocBuilder<SearchKajianController, SearchKajianState>(
          builder: (context, state) {
            final bloc = context.read<SearchKajianController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    SearchKajianController controller,
    SearchKajianState state,
  ) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Mengatur agar konten tidak naik
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 50, 8, 20),
              child: Center(
                child: Text(
                  "Pencarian",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                ),
              ),
            ),

            // Option Kajian || Tempat Kajian
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Option Kajian
                  GestureDetector(
                    onTap: () => controller.selectKajian(),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      width: MediaQuery.of(context).size.width * 0.43,
                      // height: MediaQuery.of(context).size.height * 0.04,
                      height: 35,
                      decoration: BoxDecoration(
                        color:
                            state.isKajianSelected ? tertiaryColor : cardColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Kajian',
                          style: TextStyle(
                            color: state.isKajianSelected
                                ? primaryColor
                                : textColor,
                            // color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),

                  // Option Tempat Kajian
                  GestureDetector(
                    onTap: () => controller.selectTempatKajian(),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      width: MediaQuery.of(context).size.width * 0.43,
                      // height: MediaQuery.of(context).size.height * 0.04,
                      height: 35,
                      decoration: BoxDecoration(
                        color:
                            !state.isKajianSelected ? tertiaryColor : cardColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Tempat Kajian',
                          style: TextStyle(
                            // color: Colors.white,
                            color: state.isKajianSelected
                                ? textColor
                                : primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Search bar dan list data
            SearchBarListdata(),
          ],
        ),
      ),
    );
  }
}
