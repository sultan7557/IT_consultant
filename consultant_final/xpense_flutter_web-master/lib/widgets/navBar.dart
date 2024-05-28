import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:xpense_flutter_web/pages/about_us.dart';
import 'package:xpense_flutter_web/pages/authentication/authentication.dart';
import 'package:xpense_flutter_web/pages/dashboard/dashboard.dart';
import 'package:xpense_flutter_web/pages/feedback_ratings/reputation_building.dart';
import 'package:xpense_flutter_web/pages/feedback_ratings/resolution_center.dart';
import 'package:xpense_flutter_web/pages/feedback_ratings/review_system.dart';
import 'package:xpense_flutter_web/pages/profile/client_profile.dart';
import 'package:xpense_flutter_web/pages/profile/consultant_profile.dart';
import 'package:xpense_flutter_web/pages/profile/user_profile.dart';
import 'package:xpense_flutter_web/pages/project_management/bidding_system.dart';
import 'package:xpense_flutter_web/pages/project_management/milestone_tracking.dart';
import 'package:xpense_flutter_web/pages/project_management/payment_integration.dart';
import 'package:xpense_flutter_web/utils/colors.dart';
import 'package:xpense_flutter_web/utils/constants.dart';
import 'package:xpense_flutter_web/utils/styles.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MobileNavBar(),
      desktop: DeskTopNavBar(),
    );
  }
}

Widget MobileNavBar() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20),
    height: 70,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Icon(Icons.menu), navLogo()],
    ),
  );
}

class DeskTopNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          navLogo(),
          Row(
            children: [
              navButton('Dashboard', context),
              SizedBox(width: 20),
              navButton('About Us', context),
              SizedBox(width: 20),
              navButton('Project Management', context),
              SizedBox(width: 20),
              navButton('Feedback And Ratings', context),
              SizedBox(width: 20),
              navButton('Profile', context),
            ],
          ),
          Container(
            height: 45,
            child: ElevatedButton(
                style: borderedButtonStyle,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AuthenticationPage()),
                  );
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: AppColors.primary),
                )),
          )
        ],
      ),
    );
  }
}

Widget navButton(String text, BuildContext context) {
  if (text == 'Profile' ||
      text == 'Project Management' ||
      text == 'Feedback And Ratings' ||
      text == 'About Us' ||
      text == 'Dashboard') {
    return PopupMenuButton<String>(
      child: Text(text,
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
      onSelected: (value) {
        switch (value) {
          case 'Dashboard':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashboardPage()),
            );
            break;
          case 'Client':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ClientProfile()),
            );
            break;
          case 'User':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserProfile()),
            );
            break;
          case 'Consultant':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ConsultantProfile()),
            );
            break;
          case 'Bidding System':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BiddingSystem()),
            );
            break;
          case 'Milestone Tracking':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MilestoneTracking()),
            );
            break;
          case 'Payment Integration':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PaymentIntegration()),
            );

            break;

          case 'Review System':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReviewSystem()),
            );
            break;

          case 'Resolution Center':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ResolutionCenter()),
            );
            break;

          case 'Reputation Building':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReputationBuilding()),
            );
            break;

          case 'About Us':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutUs()),
            );
            break;
        }
      },
      itemBuilder: (BuildContext context) {
        if (text == 'Profile') {
          return <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'Client',
              child: Text('Client Profile'),
            ),
            const PopupMenuItem<String>(
              value: 'User',
              child: Text('User Profile'),
            ),
            const PopupMenuItem<String>(
              value: 'Consultant',
              child: Text('Consultant Profile'),
            ),
          ];
        } else if (text == 'Project Management') {
          return <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'Bidding System',
              child: Text('Bidding System'),
            ),
            const PopupMenuItem<String>(
              value: 'Milestone Tracking',
              child: Text('Milestone Tracking'),
            ),
            const PopupMenuItem<String>(
              value: 'Payment Integration',
              child: Text('Payment Integration'),
            ),
          ];
        } else if (text == 'Dashboard') {
          return <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'Dashboard',
              child: Text('Dashboard'),
            ),
          ];
        } else if (text == 'Feedback And Ratings') {
          return <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'Review System',
              child: Text('Review System'),
            ),
            const PopupMenuItem<String>(
              value: 'Resolution Center',
              child: Text('Resolution Center'),
            ),
            const PopupMenuItem<String>(
              value: 'Reputation Building',
              child: Text('Reputation Building'),
            ),
          ];
        } else if (text == 'About Us') {
          return <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'About Us',
              child: Text('About Us'),
            ),
          ];
        } else {
          return <PopupMenuEntry<String>>[];
        }
      },
    );
  } else {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        onPressed: () {},
        child: Text(text,
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}

Widget navLogo() {
  return Container(
    width: 110,
    decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(logo), fit: BoxFit.contain)),
  );
}
