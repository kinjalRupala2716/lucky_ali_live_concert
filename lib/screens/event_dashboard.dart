import 'package:flutter/material.dart';
import 'package:knocksence_flutter_webapp/screens/lucky_ali_live.dart';
import 'package:knocksence_flutter_webapp/utils/app_string.dart';
import 'package:knocksence_flutter_webapp/utils/color.dart';

class EventDashboardScreen extends StatefulWidget {
  const EventDashboardScreen({super.key});

  @override
  State<EventDashboardScreen> createState() => _EventDashboardScreenState();
}

class _EventDashboardScreenState extends State<EventDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return const DesktopView();
        }
        return Container();
      },
    );
  }
}

class DesktopView extends StatefulWidget {
  const DesktopView({super.key});

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  var location = [
    // AppStrings.eventHint,
    "Event Location",
    "Ahmedabad",
    "surat",
    "pune",
    "banglore"
  ];
  String fixVelue = "Event Location";

  List imageList = [
    "assets/images/sufinights.png",
    "assets/images/luckyali.png",
    "assets/images/luckyali.png",
    "assets/images/luckyali.png",
    "assets/images/luckyali.png",
  ];

  List sponcersList = [
    "Sufi Nights Ft.",
    "Knocksense",
    "Knocksense",
    "Knocksense",
    "Knocksense",
  ];

  List features = [
    "The Ali Brothers",
    "Lucky Ali Live",
    "Lucky Ali Live",
    "Lucky Ali Live",
    "Lucky Ali Live",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: MediaQuery.of(context).size.height / 7,
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logos/KnockScenseLogoWhite2.png",
              height: MediaQuery.of(context).size.height / 7,
              width: MediaQuery.of(context).size.width / 3.5,
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
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 60, top: 50),
            child: Text(
              AppStrings.event,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: GetColor().getColorFromHex(AppColors().orange),
                  fontSize: 40),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              padding: const EdgeInsets.only(left: 20),
              width: MediaQuery.of(context).size.width / 6,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 4),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20)),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: AppStrings.eventHint,
                  hintStyle: TextStyle(
                    fontSize: 20,
                    color: GetColor().getColorFromHex(AppColors().hintColor),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              width: MediaQuery.of(context).size.width / 6,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 4),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                  items: location.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(
                      () {
                        fixVelue = newValue!;
                      },
                    );
                  },
                  value: fixVelue,
                ),
             
              ),
            ),
          ]),
          SizedBox(
            height: MediaQuery.of(context).size.height / 6,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: GridView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 4.2 / 4,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 10.0),
                itemCount: imageList.length,
                itemBuilder: (BuildContext ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context)=>const LuckyAliLiveScreen()));
                    },
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(50),
                                          topRight: Radius.circular(50))),
                                  child: Image.asset(
                                    imageList[index],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  width: 264,
                                  height: 80,
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 15, bottom: 10),
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(50),
                                          bottomRight: Radius.circular(50))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        sponcersList[index],
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        features[index],
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height / 5,
                              width: MediaQuery.of(context).size.width / 30,
                              decoration: BoxDecoration(
                                  color: GetColor()
                                      .getColorFromHex(AppColors().appbarColor),
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      bottomRight: Radius.circular(50))),
                              child: const Text(
                                "10\nFeb",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          )
        ]),
      ),
    );
  }

 
}
