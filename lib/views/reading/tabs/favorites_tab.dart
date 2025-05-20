import 'package:bird_discovery/controllers/bird_reading_controller.dart';

import 'package:bird_discovery/views/reading/widgets/article_card.dart';
import 'package:bird_discovery/views/reading/widgets/reading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FavoritesTab extends StatefulWidget {
  const FavoritesTab({super.key});

  @override
  State<FavoritesTab> createState() => _FavoritesTabState();
}

class _FavoritesTabState extends State<FavoritesTab> {
  final BirdReadingController ctrl =
      Get.isRegistered<BirdReadingController>()
          ? Get.find<BirdReadingController>()
          : Get.put(BirdReadingController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>
          ctrl.favorites.isEmpty
              ? Center(child: Text('No Favorite Articles'))
              : Expanded(
                child: ListView.builder(
                  itemCount: ctrl.favorites.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: ArticleCard(
                        article: ctrl.favorites[index],
                        onPress: () {
                          Get.to(
                            () => ReadingScreen(
                              article: ctrl.articles[index],
                              onSave: () {
                                if (ctrl.favorites
                                    .where(
                                      (val) =>
                                          val.userName ==
                                          ctrl.articles[index].userName,
                                    )
                                    .isEmpty) {
                                  ctrl.favorites.add(ctrl.articles[index]);
                                } else {
                                  ctrl.favorites.removeWhere(
                                    (val) =>
                                        val.userName ==
                                        ctrl.articles[index].userName,
                                  );
                                }
                              },
                            ),
                          );
                          print('Index of article ${index}');
                        },
                      ),
                    );
                  },
                ),
              ),
    );
  }
}
