import 'package:evently_app/firebase_utils.dart';
import 'package:evently_app/model/event.dart';
import 'package:evently_app/ui/home/home_screen.dart';
import 'package:evently_app/ui/home/tabs/home_tab/event_tab_item.dart';
import 'package:evently_app/ui/home/widgets/customElevatedButton.dart';
import 'package:evently_app/ui/home/widgets/custom_text_field.dart';
import 'package:evently_app/ui/home/widgets/event_date_or_time.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:evently_app/utils/assets_manager.dart';
import 'package:intl/intl.dart';

class AddEvent extends StatefulWidget {
  static const String routeName = 'add_ event';

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  int selectedIndex = 0;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String formatedDate = '';
  String? formatTime;
  String selectedImage = '';
  String selectedEventName = '';
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    List<String> eventNameList = [
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
    List<String> imageSelectedEvent = [
      AssetsManager.sportImage,
      AssetsManager.birthdayImage,
      AssetsManager.bookClubImage,
      AssetsManager.gamingImage,
      AssetsManager.holidayImage,
      AssetsManager.meetingImage,
      AssetsManager.workShopImage,
      AssetsManager.exhibitionImage,
      AssetsManager.eatingImage
    ];
    selectedImage = imageSelectedEvent[selectedIndex];
    selectedEventName = eventNameList[selectedIndex];

    Map<String, String> eventsMap = {
      AppLocalizations.of(context)!.event_birthday: AssetsManager.birthdayImage,
      AppLocalizations.of(context)!.event_book_club:
          AssetsManager.bookClubImage,
      AppLocalizations.of(context)!.event_eating: AssetsManager.eatingImage,
      AppLocalizations.of(context)!.event_exhibition:
          AssetsManager.exhibitionImage,
      AppLocalizations.of(context)!.event_gaming: AssetsManager.gamingImage,
      AppLocalizations.of(context)!.event_holiday: AssetsManager.holidayImage,
      AppLocalizations.of(context)!.event_meeting: AssetsManager.meetingImage,
      AppLocalizations.of(context)!.event_sport: AssetsManager.sportImage,
      AppLocalizations.of(context)!.event_workshop: AssetsManager.workShopImage,
    };

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.create_event,
          style:
              AppStyles.mudium20Primary.copyWith(fontWeight: FontWeight.w900),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(eventsMap[eventNameList[selectedIndex]]!),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                height: height * 0.06,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          selectedIndex = index;
                          setState(() {});
                        },
                        child: EventTabItem(
                          borderColor: AppColors.primaryLight,
                          eventName: eventNameList[index],
                          isSelected: selectedIndex == index,
                          selectedBackgroundColor: AppColors.primaryLight,
                          selectedTextStyle: AppStyles.mudium16White,
                          unSelectedTextStyle:
                              Theme.of(context).textTheme.headlineSmall,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: width * 0.02,
                      );
                    },
                    itemCount: eventNameList.length),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(AppLocalizations.of(context)!.title,
                          style: Theme.of(context)
                              .inputDecorationTheme
                              .hintStyle
                              ?.copyWith(
                                  fontSize: 18, fontWeight: FontWeight.w700)),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      CustomTextField(
                        prefixIcon: Image.asset(AssetsManager.iconEdit,
                            color: Theme.of(context).hintColor),
                        hintText: AppLocalizations.of(context)!.event_title,
                        controller: titleController,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please enter event title';
                          }
                          return null;
                        },
                        hintStyle:
                            Theme.of(context).inputDecorationTheme.hintStyle,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Text(AppLocalizations.of(context)!.description,
                          style: Theme.of(context)
                              .inputDecorationTheme
                              .hintStyle
                              ?.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w700)),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      CustomTextField(
                        controller: descController,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please enter event description';
                          }
                          return null;
                        },
                        hintText:
                            AppLocalizations.of(context)!.event_description,
                        hintStyle:
                            Theme.of(context).inputDecorationTheme.hintStyle,
                        maxLines: 4,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      EventDateOrTime(
                          iconDateOrTime: AssetsManager.iconDate,
                          chooseDateOrTime: selectedDate == null
                              ? AppLocalizations.of(context)!.choose_date
                              // : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                              : formatedDate,
                          eventDateOrTime:
                              AppLocalizations.of(context)!.event_date,
                          oncChooseDateOrTime: chooseDate),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      EventDateOrTime(
                          iconDateOrTime: AssetsManager.iconTime,
                          chooseDateOrTime: selectedTime == null
                              ? AppLocalizations.of(context)!.choose_time
                              : formatTime!,
                          eventDateOrTime:
                              AppLocalizations.of(context)!.event_time,
                          oncChooseDateOrTime: chooseTime),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Text(AppLocalizations.of(context)!.location,
                          style: Theme.of(context)
                              .inputDecorationTheme
                              .hintStyle
                              ?.copyWith(
                                  fontSize: 15, fontWeight: FontWeight.w700)),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.02, vertical: height * 0.01),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppColors.primaryLight,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.primaryLight),
                              child: IconButton(
                                  onPressed: () {},
                                  icon:
                                      Image.asset(AssetsManager.iconLocation)),
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Text(
                                AppLocalizations.of(context)!
                                    .choose_event_location,
                                style: AppStyles.mudium16Primary),
                            // SizedBox(
                            //   width: width * 0.1,
                            // ),
                            Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.primaryLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Customelevatedbutton(
                          onButtonClick: addEvent,
                          text: AppLocalizations.of(context)!.add_event),
                      SizedBox(
                        height: height * 0.01,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void addEvent() {
    if (formkey.currentState?.validate() == true) {
      Event event = Event(
          image: selectedImage,
          title: titleController.text,
          description: descController.text,
          eventName: selectedEventName,
          dateTime: selectedDate!,
          time: formatTime!);
      FirebaseUtils.addEventToFireStore(event)
          .timeout(Duration(milliseconds: 500), onTimeout: () {
        showAlertdialog();
      });
    }
  }

  void showAlertdialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.success),
        content: Text(
            AppLocalizations.of(context)!.success_event_added_successfully),
        contentTextStyle: AppStyles.mudium16Black,
        titleTextStyle: AppStyles.bold15Black,
        backgroundColor: AppColors.whiteColor,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.popUntil(
                  context, ModalRoute.withName(HomeScreen.routeName));
            },
            child: Text('Ok', style: AppStyles.bold15Black),
          )
        ],
      ),
    );
  }

  void chooseDate() async {
    var chooseDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    selectedDate = chooseDate;
    formatedDate = DateFormat('dd/MM/yyyy').format(selectedDate!);
    setState(() {});
  }

  void chooseTime() async {
    var chooseTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    selectedTime = chooseTime;
    formatTime = selectedTime!.format(context);
    setState(() {});
  }
}
