import 'package:flutter/material.dart';
import 'package:knocksence_flutter_webapp/screens/event_dashboard.dart';
import 'package:knocksence_flutter_webapp/utils/app_string.dart';

class CommonWebAppbar extends StatefulWidget {
  const CommonWebAppbar({super.key});

  @override
  State<CommonWebAppbar> createState() => _CommonWebAppbarState();
}

class _CommonWebAppbarState extends State<CommonWebAppbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => const EventDashboardScreen()),
                (route) => false);
          },
          child: Image.asset(
            "assets/logos/KnockScenseLogoWhite2.png",
            height: MediaQuery.of(context).size.height / 8,
            // width: MediaQuery.of(context).size.width / 3,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              Image.asset(
                "assets/icons/liteIcon.png",
                height: 15,
              ),
              const SizedBox(
                width: 8,
              ),
              const Text(
                AppStrings.bookingSite,
                style: TextStyle(fontSize: 17),
              )
            ],
          ),
        )
      ],
    );
  }
}
