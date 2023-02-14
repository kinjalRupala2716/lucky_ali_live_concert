import 'package:flutter/material.dart';
import 'package:knocksence_flutter_webapp/commom_widget/common_web_appbar.dart';
import 'package:knocksence_flutter_webapp/screens/lucky_ali_live.dart';
import 'package:knocksence_flutter_webapp/utils/app_string.dart';
import 'package:knocksence_flutter_webapp/utils/color.dart';

TextEditingController eventController = TextEditingController();

class EventDashboardScreen extends StatefulWidget {
  const EventDashboardScreen({super.key});

  @override
  State<EventDashboardScreen> createState() => _EventDashboardScreenState();
}

class _EventDashboardScreenState extends State<EventDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      if (constraint.maxWidth > 1200) {
        return const DesktopView();
      } else if (constraint.maxWidth > 800 && constraint.maxWidth < 1200) {
        return const TabletView();
      }
      return const MobileView();
    });
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
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: MediaQuery.of(context).size.height / 7,
          backgroundColor: Colors.black,
          title: const CommonWebAppbar()),
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
                controller: eventController,
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
            height: MediaQuery.of(context).size.height / 1.1,
            child: GridView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                // physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 3.5 / 4,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 10.0),
                itemCount: imageList.length,
                itemBuilder: (BuildContext ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const LuckyAliLiveScreen()));
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

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
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
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: MediaQuery.of(context).size.height / 7,
          backgroundColor: Colors.black,
          title: const CommonWebAppbar()),
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    width: MediaQuery.of(context).size.width / 2.3,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 4),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      controller: eventController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: AppStrings.eventHint,
                        hintStyle: TextStyle(
                          fontSize: 18,
                          color:
                              GetColor().getColorFromHex(AppColors().hintColor),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    width: MediaQuery.of(context).size.width / 2.3,
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
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 17),
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
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              // color: Colors.red,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1.1,
              child: GridView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  // physics: AlwaysScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3.2 / 5,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0),
                  itemCount: imageList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const LuckyAliLiveScreen()));
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
                                    height:
                                        MediaQuery.of(context).size.height / 4,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                                "${imageList[index]}"))),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                      color: Colors.white,
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    width: double.maxFinite,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            features[index],
                                            style:
                                                const TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                            sponcersList[index],
                                            style:
                                                const TextStyle(fontSize: 20),
                                          )
                                        ]),
                                  )
                                ],
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: MediaQuery.of(context).size.height / 8,
                                width: MediaQuery.of(context).size.width / 10,
                                decoration: BoxDecoration(
                                    color: GetColor().getColorFromHex(
                                        AppColors().appbarColor),
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20))),
                                child: const Text(
                                  "10\nFeb",
                                  style: TextStyle(
                                      fontSize: 15,
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
            ),
          )
        ]),
      ),
    );
  }
}

class TabletView extends StatefulWidget {
  const TabletView({super.key});

  @override
  State<TabletView> createState() => _TabletViewState();
}

class _TabletViewState extends State<TabletView> {
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
          title: const CommonWebAppbar()),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
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
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                padding: const EdgeInsets.only(left: 20),
                width: MediaQuery.of(context).size.width / 2.3,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 4),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  controller: eventController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: AppStrings.eventHint,
                    hintStyle: TextStyle(
                      fontSize: 30,
                      color: GetColor().getColorFromHex(AppColors().hintColor),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                width: MediaQuery.of(context).size.width / 2.3,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 4),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    dropdownColor: Colors.red,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                    items: location.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 30),
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
            const SizedBox(height: 30),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  // physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // childAspectRatio: 3.5 / 3,
                      crossAxisSpacing: 00.0,
                      mainAxisSpacing: 0.0),
                  itemCount: imageList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const LuckyAliLiveScreen()));
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
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image:
                                            AssetImage("${imageList[index]}"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(40),
                                        bottomRight: Radius.circular(40),
                                      ),
                                      color: Colors.white,
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    width: double.maxFinite,
                                    height:
                                        MediaQuery.of(context).size.height / 10,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            features[index],
                                            style: TextStyle(
                                                fontSize: 35,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "sponcersList[index]",
                                            style: TextStyle(
                                                fontSize: 35,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ]),
                                  )
                                ],
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: MediaQuery.of(context).size.height / 7,
                                width: MediaQuery.of(context).size.width / 8,
                                decoration: BoxDecoration(
                                    color: GetColor().getColorFromHex(
                                        AppColors().appbarColor),
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(40),
                                        bottomRight: Radius.circular(40))),
                                child: const Text(
                                  "10\nFeb",
                                  style: TextStyle(
                                      fontSize: 30,
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
      ),
    );
  }
}
