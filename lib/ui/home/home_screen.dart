import 'package:evently_app/ui/home/tabs/favorite/favorite_tab.dart';
import 'package:evently_app/ui/home/tabs/home_tab/add_event.dart';
import 'package:evently_app/ui/home/tabs/home_tab/home_tab.dart';
import 'package:evently_app/ui/home/tabs/map/map_tab.dart';
import 'package:evently_app/ui/home/tabs/profile/profile_tab.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [HomeTab(), MapTab(), FavoriteTab(), ProfileTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryLight,
      ),
      bottomNavigationBar: Theme(
        data:
            Theme.of(context).copyWith(canvasColor: AppColors.transparentColor),
        child: BottomAppBar(
          padding: EdgeInsets.zero,
          color: Theme.of(context).primaryColor,
          shape: CircularNotchedRectangle(),
          notchMargin: 3,
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: [
              buildNavItem(
                index: 0,
                unSelectedIconName: AssetsManager.iconHome,
                seletedIconName: AssetsManager.selectedIconHome,
                label: AppLocalizations.of(context)!.home,
              ),
              buildNavItem(
                index: 1,
                unSelectedIconName: AssetsManager.iconMap,
                seletedIconName: AssetsManager.selectedIconMap,
                label: AppLocalizations.of(context)!.map,
              ),
              buildNavItem(
                index: 2,
                unSelectedIconName: AssetsManager.iconFavorite,
                seletedIconName: AssetsManager.selectedIconFavorite,
                label: AppLocalizations.of(context)!.favorite,
              ),
              buildNavItem(
                index: 3,
                unSelectedIconName: AssetsManager.iconProfile,
                seletedIconName: AssetsManager.selectedIconProfile,
                label: AppLocalizations.of(context)!.profile,
              ),
            ],
          ),
        ),
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddEvent.routeName);
        },
        child: Icon(
          Icons.add,
          color: AppColors.whiteColor,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  BottomNavigationBarItem buildNavItem({
    required String label,
    required String unSelectedIconName,
    required String seletedIconName,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: Image.asset(
          selectedIndex == index ? seletedIconName : unSelectedIconName),
      label: label,
    );
  }
}
