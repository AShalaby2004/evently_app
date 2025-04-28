import 'package:evently_app/ui/home/tabs/home_tab/event_item.dart';
import 'package:evently_app/ui/home/widgets/custom_text_field.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:evently_app/utils/assets_manager.dart';

class FavoriteTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.04,
            ),
            CustomTextField(
              borderColor: AppColors.primaryLight,
              hintText: AppLocalizations.of(context)!.search_for_event,
              hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
              prefixIcon: Image.asset(AssetsManager.iconSearch),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return EventItem();
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: height * 0.03,
                  );
                },
                itemCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
