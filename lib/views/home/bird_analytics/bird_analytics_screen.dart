import 'package:bird_discovery/controllers/bird_analytics_controller.dart';
import 'package:bird_discovery/utils/app_colors.dart';
import 'package:bird_discovery/utils/app_images.dart';
import 'package:bird_discovery/views/home/bird_analytics/share_my_find_screen.dart';
import 'package:bird_discovery/views/home/bird_analytics/widgets/bird_info.dart';
import 'package:bird_discovery/views/identifyBird/widgets/sound_card_overview.dart';
import 'package:bird_discovery/widgets/custom_elevated_button.dart';
import 'package:bird_discovery/widgets/custom_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../identifyBird/widgets/behavioural_traits_features.dart';
import '../../identifyBird/widgets/bird_details_section.dart';
import '../../identifyBird/widgets/characteristics_card_features.dart';
import '../../identifyBird/widgets/classificiation_item_more.dart';
import '../../identifyBird/widgets/conservation_reminder_more_widget.dart';
import '../../identifyBird/widgets/description_card_overview.dart';
import '../../identifyBird/widgets/did_you_know_more.dart';
import '../../identifyBird/widgets/distribution_area_overview.dart';
import '../../identifyBird/widgets/food_habits_card_overview.dart';
import '../../identifyBird/widgets/identificiation_marker_features.dart';
import '../../identifyBird/widgets/nesting_reproduction_card_features.dart';
import '../../identifyBird/widgets/overall_rarity_overview.dart';
import '../../identifyBird/widgets/quick_facts_overview.dart';
import '../../identifyBird/widgets/range_map_overview.dart';
import '../../identifyBird/widgets/rarity_card_overview.dart';
import '../../identifyBird/widgets/similar_species_more.dart';

class BirdAnalyticsScreen extends StatefulWidget {
  const BirdAnalyticsScreen({super.key});
  @override
  State<BirdAnalyticsScreen> createState() => _BirdAnalyticsScreenState();
}

class _BirdAnalyticsScreenState extends State<BirdAnalyticsScreen>
    with TickerProviderStateMixin {

  void _showMoreMenu() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(top: 12.h, bottom: MediaQuery.of(ctx).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // drag indicator
            Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.darkGreyColor,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            SizedBox(height: 36.h),

            // Menu items
            _menuTile(
              asset: AppImages.heartIcon,
              title: 'I Like this Content',
              subtitle: null,
              onTap: () => Navigator.pop(ctx),
              arrow: false
            ),
            SizedBox(height: 12.h),
            _menuTile(
              asset: AppImages.errorIcon,
              title: 'Error in Content',
              subtitle: 'Incorrect content, poor, errors, etc.',
              onTap: () {
                Navigator.pop(ctx);
                _showErrorSheet();
              },
              arrow: true
            ),
            SizedBox(height: 12.h),
            _menuTile(
              asset: AppImages.crossIcon,
              title: 'Incorrect Identification',
              subtitle: null,
              onTap: () {
                Navigator.pop(ctx);
                // you could show another sheet here if desired
              },
              arrow: false
            ),
            SizedBox(height: 12.h),
            _menuTile(
              asset: AppImages.suggestionIcon1,
              title: 'Suggestions',
              subtitle: 'Help us make it more useful & better experience',
              onTap: () {
                Navigator.pop(ctx);
                _showSuggestionsSheet();
              },
              arrow: true
            ),
            SizedBox(height: 36.h),

          ],
        ),
      ),
    );
  }


  Widget _menuTile({
    required String asset,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
    bool arrow = false,
  }) {
    return ListTile(
      leading: Image.asset(asset, width: 24.w, height: 24.h),
      title: Text(
        title,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
      ),
      subtitle: subtitle == null
          ? null
          : Text(
        subtitle,
        style: TextStyle(fontSize: 14.sp, color: AppColors.textGreyColor),
      ),
      trailing: arrow
          ? Icon(Icons.arrow_forward_ios, size: 16.w, color: AppColors.darkGreyColor)
          : null,
      onTap: onTap,
    );
  }


  void _showSuggestionsSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          top: 12.h,
          left: 16.w,
          right: 16.w,
          bottom: MediaQuery.of(ctx).viewInsets.bottom + 20.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // drag indicator
            Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.darkGreyColor,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            SizedBox(height: 12.h),

            // back row
            Row(
              children: [
                CupertinoNavigationBarBackButton(
                  color: AppColors.blackColor,
                  onPressed: () => Navigator.maybePop(context),
                ),
                Spacer(),
                Text(
                  'Suggestions',
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                ),
                Spacer(flex: 2),
              ],
            ),
            SizedBox(height: 16.h),

            // input box
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: AppColors.lightGreyColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: TextField(
                minLines: 3,
                maxLines: 6,
                decoration: InputDecoration.collapsed(
                  hintText: 'Type here…',
                  hintStyle: TextStyle(fontSize: 14.sp, color: AppColors.textGreyColor),
                ),
              ),
            ),
            SizedBox(height: 20.h),

            // submit
            CustomElevatedButton(
              isGradient: true,
              child: Text('Submit', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: AppColors.whiteColor)),
              onclick: () => Navigator.pop(ctx),
            ),
          ],
        ),
      ),
    );
  }

  void _showErrorSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          top: 12.h,
          left: 16.w,
          right: 16.w,
          bottom: MediaQuery.of(ctx).viewInsets.bottom + 20.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // drag indicator
            Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.darkGreyColor,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            SizedBox(height: 12.h),

            // back row
            Row(
              children: [
                CupertinoNavigationBarBackButton(
                  color: AppColors.blackColor,
                  onPressed: () => Navigator.maybePop(context),
                ),
                Spacer(),
                Text(
                  'Error in Content',
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                ),
                Spacer(flex: 2),
              ],
            ),
            SizedBox(height: 16.h),

            // input box
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: AppColors.lightGreyColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: TextField(
                minLines: 3,
                maxLines: 6,
                decoration: InputDecoration.collapsed(
                  hintText: 'Please describe the errors…',
                  hintStyle: TextStyle(fontSize: 14.sp, color: AppColors.textGreyColor),
                ),
              ),
            ),
            SizedBox(height: 20.h),

            // submit
            CustomElevatedButton(
              isGradient: true,
              child: Text('Submit', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600,color: AppColors.whiteColor)),
              onclick: () => Navigator.pop(ctx),
            ),
          ],
        ),
      ),
    );
  }

  final BirdAnalyticsController ctrl =
      Get.isRegistered<BirdAnalyticsController>()
          ? Get.find<BirdAnalyticsController>()
          : Get.put(BirdAnalyticsController());
  int _currentPage = 0;
  final RxInt _selectedTab = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h),
              Row(
                children: [
                  CustomIconButton(
                    onPressed: () => Get.back(),
                    child: Image.asset(AppImages.arrowLeft, height: 16.h),
                  ),
                  Spacer(),
                  CustomElevatedButton(
                    isGradient: false,
                    width: 147.w,
                    height: 48.h,
                    radius: 50.r,
                    bgColor: AppColors.secondaryColor,
                    onclick:
                        () => Get.off(
                          () => ShareMyFindScreen(),
                        ), // GetX navigation

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Share My Find',
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Image.asset(
                          AppImages.shareIcon2,
                          height: 16.h,
                          color: AppColors.whiteColor,)
                      ],
                    ),
                  ),
                  SizedBox(width: 8.w),
                  CustomIconButton(
                    onPressed:  _showMoreMenu,
                    child: Image.asset(AppImages.moreHorzIcon, height: 24.h),
                  ),
                ],
              ),
              SizedBox(height: 18.h),
              Container(
                height: 264.h,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    PageView.builder(
                      itemCount: 3,
                      onPageChanged:
                          (page) => setState(() => _currentPage = page),
                      itemBuilder: (context, index) {
                        final asset =
                            index == 0
                                ? AppImages.bird1
                                : index == 1
                                ? AppImages.bird2
                                : AppImages.bird3;

                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14.r),
                            child: Image.asset(
                              asset,
                              width: double.infinity,
                              height: 264.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 7.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: List.generate(
                              3,
                              (index) => AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                margin: EdgeInsets.symmetric(horizontal: 4.w),
                                height: 15.h,
                                width: 15.w,
                                decoration: BoxDecoration(
                                  color:
                                      _currentPage == index
                                          ? AppColors.whiteColor
                                          : Colors.transparent,
                                  border: Border.all(
                                    color: AppColors.whiteColor,
                                    width: 0.5.w,
                                  ),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  '${index + 1}',
                                  style: TextStyle(
                                    fontSize: 9.sp,
                                    color:
                                        _currentPage == index
                                            ? AppColors.primaryColor
                                            : AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              BirdInfo(),
              SizedBox(height: 20.h),
              BirdDetailsSection(),
              SizedBox(height: 20.h),
              // ── Tab Buttons ───────────────────────────────
              Obx(
                () => Row(
                  children: [
                    // Overview
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _selectedTab.value = 0,
                        child: Container(
                          height: 40.h,
                          decoration: BoxDecoration(
                            color:
                                _selectedTab.value == 0
                                    ? AppColors.primaryColor
                                    : Colors.transparent,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Overview',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color:
                                  _selectedTab.value == 0
                                      ? Colors.white
                                      : AppColors.blackColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),

                    // Features
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _selectedTab.value = 1,
                        child: Container(
                          height: 40.h,
                          decoration: BoxDecoration(
                            color:
                                _selectedTab.value == 1
                                    ? AppColors.primaryColor
                                    : Colors.transparent,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Features',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color:
                                  _selectedTab.value == 1
                                      ? Colors.white
                                      : AppColors.blackColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),

                    // More
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _selectedTab.value = 2,
                        child: Container(
                          height: 40.h,
                          decoration: BoxDecoration(
                            color:
                                _selectedTab.value == 2
                                    ? AppColors.primaryColor
                                    : Colors.transparent,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'More',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color:
                                  _selectedTab.value == 2
                                      ? Colors.white
                                      : AppColors.blackColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              // ── Tab Content ───────────────────────────────
              Obx(() {
                switch (_selectedTab.value) {
                  case 1:
                    return FeaturesTab();
                  case 2:
                    return MoreTab();
                  default:
                    return OverviewTab();
                }
              }),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

class OverviewTab extends StatelessWidget {
  const OverviewTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RarityOverviewCard(
          grade: RarityGrade.B,
          description:
          'A legendary collector’s item with exceptional investment potential & cultural significance.',
        ),
        QuickFactsCard(),
        DescriptionCard(
          description:
          'The Eastern Bluebird is a small thrush with a big, rounded head, large eye, '
              'plump body, and short, straight bill. The wings are long, but the tail and '
              'legs are fairly short. Males are vivid, deep blue above and rusty or brick-red '
              'on the throat and breast with a white belly. Females are grayish above with '
              'bluish wings and tail, and a subdued orange-brown breast.',
        ),
        OverallRarityCard(),
        SoundSection(),
        FoodHabitsSection(),
        RangeMapsSection(),
        DistributionAreaSection(
          description: 'The lesser violetear is roughly medium-sized by hummingbird standards. '
              'It averages around 9.7 to 12 cm (3.8 to 4.7 in) in total length. '
              'Its bill is black and mostly straight with only a slight downward.',
        ),
        SizedBox(height: 20.h),
        Row(
          children: [
            CustomElevatedButton(
              isGradient: false,
              bgColor: Colors.white,
              textColor: AppColors.blackColor,
              borderColor: AppColors.greyColor,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              radius: 15.r,
              height: 50.h,
              width: 120.w,
              onclick: () => print('Fix Results tapped'),
              child: Text('Fix Results',
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: CustomElevatedButton(
                isGradient: false,
                bgColor: AppColors.secondaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                radius: 15.r,

                height: 50.h,
                onclick: () => print('Save To Collection tapped'),
                child: Text('Save To Collection',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FeaturesTab extends StatelessWidget {
  const FeaturesTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IdentificationMarkersCard(
          markers: [
            IdentificationMarker(index: 1, text: 'Bright red plumage (male)'),
            IdentificationMarker(index: 2, text: 'Distinctive crest'),
            IdentificationMarker(index: 3, text: 'Black face mask'),
            IdentificationMarker(index: 4, text: 'Heavy, cone-shaped bill'),
          ],
        ),
        PhysicalCharacteristicsCard(
          characteristics: {
            'Length':   '21–23 cm',
            'Wingspan': '25–31 cm',
            'Weight':   '42–48 g',
          },
        ),
        BehavioralTraitsCard(
          traits: [
            'Often perches on wires, posts, and low branches',
            'Hovers before dropping to the ground catch insects',
            'Nests in tree cavities or nest boxes',
          ],
          seasonalAppearance:
          'Males maintain their bright coloration year-round, though',
          diet: 'Seeds, fruits, insects',
        ),
        NestingReproductionCard(
          items: [
            NestingReproductionItem(
              bulletColor: AppColors.greenColor,
              text: 'Breeding season: April to August',
            ),
            NestingReproductionItem(
              bulletColor: AppColors.lightPurpleIcon,
              text: 'Nest: Cup-shaped in shrubs or trees',
            ),
            NestingReproductionItem(
              bulletColor: AppColors.lightBlueIcon,
              text: 'Eggs: 2–5, incubation 11–13 days',
            ),
            NestingReproductionItem(
              bulletColor: AppColors.lightYellowIcon,
              text: 'Fledging: Young leave nest after 7–13 days',
            ),
          ],
        ),

        SizedBox(height: 20.h),
        Row(
          children: [
            CustomElevatedButton(
              isGradient: false,
              bgColor: Colors.white,
              textColor: AppColors.blackColor,
              borderColor: AppColors.greyColor,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              radius: 15.r,
              height: 50.h,
              width: 120.w,
              onclick: () => print('Fix Results tapped'),
              child: Text('Fix Results',
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: CustomElevatedButton(
                isGradient: false,
                bgColor: AppColors.secondaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                radius: 15.r,

                height: 50.h,
                onclick: () => print('Save To Collection tapped'),
                child: Text('Save To Collection',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class MoreTab extends StatelessWidget {
  const MoreTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConservationRemindersCard(
          reminders: [
            ConservationReminder(
              title: 'Sensitive Area:',
              body: 'Blue Jay nests likely present (April–June). Please avoid this area.',
            ),
            ConservationReminder(
              title: 'Ethics Reminder:',
              body: 'Blue Jays may abandon nests if disturbed. Observe quietly …',
            ),
          ],
          onSeeMore: () {
            // Handle see more action
            ConservationReminder(
              title: 'Ethics Reminder:',
              body: 'Blue Jays may abandon nests if disturbed. Observe quietly …',
            );
          },
        ),

        SizedBox(height: 20.h),
        ScientificClassificationCard(
          items: [
            ClassificationItem(
              label: 'Genus',
              value: 'Regulus–Kinglets, Crests, Kinglets and Crests, Kinglet',
            ),
            ClassificationItem(
              label: 'Family',
              value: 'Regulidae– Goldcrests and kinglets',
            ),
            ClassificationItem(
              label: 'Order',
              value: 'Passeriformes– Perching birds, Songsters, Songbirds, passe',
            ),
          ],
          onLearnMore: () {

          },
        ),
        SizedBox(height: 20.h),
        SimilarSpeciesSection(
          subtitle: 'Often perches on wires, posts, and low branches',
          species: [
            SimilarSpecies(
              imageUrl: AppImages.bird1,
              commonName: 'Mountain Bluebird',
              scientificName: 'Sialia currucoides',
              note: 'Lighter, sky-blue coloration with no rusty breast',
            ),
            SimilarSpecies(
              imageUrl: AppImages.bird2,
              commonName: 'Indigo Bunting',
              scientificName: 'Passerina cyanea',
              note: 'Brighter blue with distinct wing bars',
            ),
          ],
        ),
        SizedBox(height: 20.h),
        DidYouKnowCard(
          factText: 'Dogs often use gentle mouthing as a sign of affection, but setting boundaries helps ensure play remains comfortable for both of you. 🐕💙',
        ),
        SizedBox(height: 20.h),
        Row(
          children: [
            CustomElevatedButton(
              isGradient: false,
              bgColor: Colors.white,
              textColor: AppColors.blackColor,
              borderColor: AppColors.greyColor,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              radius: 15.r,
              height: 50.h,
              width: 120.w,
              onclick: () => print('Fix Results tapped'),
              child: Text('Fix Results',
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: CustomElevatedButton(
                isGradient: false,
                bgColor: AppColors.secondaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                radius: 15.r,

                height: 50.h,
                onclick: () => print('Save To Collection tapped'),
                child: Text('Save To Collection',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),


      ],
    );
  }
}
