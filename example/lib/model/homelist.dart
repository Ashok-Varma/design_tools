import 'package:best_flutter_ui_templates/design_course/home_design_course.dart';
import 'package:best_flutter_ui_templates/fitness_app/fitness_app_home_screen.dart';
import 'package:best_flutter_ui_templates/hotel_booking/hotel_home_screen.dart';
import 'package:best_flutter_ui_templates/introduction_animation/introduction_animation_screen.dart';
import 'package:design_tools/design_tools.dart';
import 'package:flutter/widgets.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
  });

  Widget? navigateScreen;
  String imagePath;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/introduction_animation/introduction_animation.png',
      navigateScreen: DesignTools(
          verticalInterval: null,
          keylines: [],
          child: IntroductionAnimationScreen()),
    ),
    HomeList(
        imagePath: 'assets/hotel/hotel_booking.png',
        navigateScreen: DesignTools(
            verticalInterval: null,
            horizontalInterval: null,
            keylines: [
              Keyline(
                24,
                decorator: KeylineDecorator.defaultWith(marginWidth: 12),
              ),
              Keyline(
                24,
                gravity: KeylineGravity.end,
                decorator: KeylineDecorator.defaultWith(marginWidth: 12),
              ),
            ],
            child: HotelHomeScreen())),
    HomeList(
      imagePath: 'assets/fitness_app/fitness_app.png',
      navigateScreen: DesignTools(
          verticalInterval: GuideInterval(24, divisions: 2),
          horizontalInterval: GuideInterval(24, divisions: 2),
          keylines: [
            Keyline(
              24,
              decorator: KeylineDecorator.defaultWith(marginWidth: 12),
            ),
            Keyline(
              24,
              gravity: KeylineGravity.end,
              decorator: KeylineDecorator.defaultWith(marginWidth: 12),
            ),
          ],
          child: FitnessAppHomeScreen()),
    ),
    HomeList(
        imagePath: 'assets/design_course/design_course.png',
        navigateScreen: DesignTools(
          verticalInterval: GuideInterval(18, divisions: 2),
          horizontalInterval: GuideInterval(18, divisions: 2),
          keylines: [
            Keyline(18),
            Keyline(18, gravity: KeylineGravity.end),
          ],
          child: DesignCourseHomeScreen(),
        )),
  ];
}
