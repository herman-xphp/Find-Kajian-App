import 'package:find_kajian/shared/theme/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';

import '../controller/daftar_ustadz_controller.dart';
import '../state/daftar_ustadz_state.dart';
import '../widget/ustadz_item.dart';

class DaftarUstadzView extends StatefulWidget {
  const DaftarUstadzView({Key? key}) : super(key: key);

  @override
  State<DaftarUstadzView> createState() => _DaftarUstadzViewState();
}

class _DaftarUstadzViewState extends State<DaftarUstadzView> {
  final DaftarUstadzController controller = DaftarUstadzController();
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<DaftarUstadzController>()) {
      GetIt.I.unregister<DaftarUstadzController>();
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => controller,
      child: BlocListener<DaftarUstadzController, DaftarUstadzState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage!)),
            );
          }
        },
        child: BlocBuilder<DaftarUstadzController, DaftarUstadzState>(
          builder: (context, state) {
            final bloc = context.read<DaftarUstadzController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    DaftarUstadzController controller,
    DaftarUstadzState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar Ustadz',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Card(
        margin: const EdgeInsets.fromLTRB(12, 12, 12, 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              20.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Cari Ustadz',
                  hintStyle: TextStyle(color: secondaryTextColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: secondaryTextColor,
                  ),
                ),
                onChanged: (value) {
                  context.read<DaftarUstadzController>().search(value);
                },
              ),
              const SizedBox(height: 12),
              Text(
                'Total Ustadz: ${state.ustadzResults.length}',
                style: TextStyle(fontSize: 14, color: secondaryTextColor),
              ),
              const SizedBox(height: 12),
              Expanded(
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
                                          width: double.infinity,
                                          height: 16.0,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[
                                                600], // Warna background shimmer
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        const SizedBox(height: 4.0),
                                        Container(
                                          width: double.infinity,
                                          height: 14.0,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[
                                                600], // Warna background shimmer
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        const SizedBox(height: 3.0),
                                        Container(
                                          width: double.infinity,
                                          height: 14.0,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[
                                                600], // Warna background shimmer
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
                    : state.ustadzResults.isEmpty
                        ? Center(child: Text('Data Tidak Ada!'))
                        : ListView.builder(
                            itemCount: state.ustadzResults.length,
                            itemBuilder: (context, index) {
                              return UstadzItem(
                                  item: state.ustadzResults[index]);
                            },
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
