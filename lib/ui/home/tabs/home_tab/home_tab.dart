import 'package:evently_app/ui/home/tabs/home_tab/event_item.dart';
import 'package:evently_app/ui/home/tabs/home_tab/event_tab_item.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    List<String> eventNameList = [
      AppLocalizations.of(context)!.event_all,
      AppLocalizations.of(context)!.event_birthday,
      AppLocalizations.of(context)!.event_book_club,
      AppLocalizations.of(context)!.event_eating,
      AppLocalizations.of(context)!.event_exhibition,
      AppLocalizations.of(context)!.event_gaming,
      AppLocalizations.of(context)!.event_holiday,
      AppLocalizations.of(context)!.event_meeting,
      AppLocalizations.of(context)!.event_sport,
      AppLocalizations.of(context)!.event_workshop,
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.welcome_back,
                  style: AppStyles.regular14White,
                ),
                Text(
                  'Abdelrahman Shalaby',
                  style: AppStyles.bold24White,
                ),
              ],
            ),
            Spacer(),
            Image.asset(AssetsManager.iconTheme),
            SizedBox(
              width: width * 0.02,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02, vertical: height * 0.01),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.whiteColor),
              child: Text(
                'EN',
                style: AppStyles.bold14Primary,
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: height * 0.13,
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.011,
                ),
                Row(
                  children: [
                    Image.asset(AssetsManager.iconMap),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Text(
                      'Cairo, Egypt',
                      style: AppStyles.regular14White
                          .copyWith(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                DefaultTabController(
                    length: eventNameList.length,
                    child: TabBar(
                        onTap: (index) {
                          selectedIndex = index;
                          setState(() {});
                        },
                        labelPadding: EdgeInsetsDirectional.zero,
                        indicatorColor: AppColors.transparentColor,
                        dividerColor: AppColors.transparentColor,
                        tabAlignment: TabAlignment.start,
                        isScrollable: true,
                        tabs: eventNameList.map((eventName) {
                          return EventTabItem(
                            eventName: eventName,
                            isSelected: selectedIndex ==
                                eventNameList.indexOf(eventName),
                            selectedBackgroundColor:
                                Theme.of(context).focusColor,
                            selectedTextStyle:
                                Theme.of(context).textTheme.headlineSmall,
                            unSelectedTextStyle: AppStyles.mudium16White,
                          );
                        }).toList()))
              ],
            ),
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                        child: EventItem());
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: height * 0.03,
                    );
                  },
                  itemCount: 20))
        ],
      ),
    );
  }
}
