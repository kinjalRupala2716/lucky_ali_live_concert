import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:knocksence_flutter_webapp/commom_widget/common_web_appbar.dart';
import 'package:knocksence_flutter_webapp/models/get_location_model.dart';
import 'package:knocksence_flutter_webapp/providers/get_location_provider.dart';
import 'package:knocksence_flutter_webapp/screens/lucky_ali_live.dart';
import 'package:knocksence_flutter_webapp/utils/app_string.dart';
import 'package:knocksence_flutter_webapp/utils/color.dart';
import 'package:provider/provider.dart';

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
      // if (constraint.maxWidth > 1200) {
      //   return const DesktopView();
      // } else if (constraint.maxWidth > 800 && constraint.maxWidth < 1200) {
      //   return const TabletView();
      // }
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
  // var location = [
  //   // AppStrings.eventHint,
  //   "Event Location",
  //   "Ahmedabad",
  //   "surat",
  //   "pune",
  //   "banglore"
  // ];
  String fixVelue = "Event Location";

  // List imageList = [
  //   "assets/images/sufinights.png",
  //   "assets/images/luckyali.png",
  //   "assets/images/luckyali.png",
  //   "assets/images/luckyali.png",
  //   "assets/images/luckyali.png",
  // ];

  // List sponcersList = [
  //   "Sufi Nights Ft.",
  //   "Knocksense",
  //   "Knocksense",
  //   "Knocksense",
  //   "Knocksense",
  // ];

  // List features = [
  //   "The Ali Brothers",
  //   "Lucky Ali Live",
  //   "Lucky Ali Live",
  //   "Lucky Ali Live",
  //   "Lucky Ali Live",
  // ];

  GetLocactionProvider? getLocactionProvider;
  int? _mySelection;

  @override
  void initState() {
    super.initState();

    Provider.of<GetLocactionProvider>(context, listen: false).getLocation();
    Provider.of<GetLocactionProvider>(context, listen: false).getAllEvents();
  }

  int? lId;

  String formatDate(DateTime date) => DateFormat("d MMM").format(date);

  GetLocationModel? getLocationModel;
  List<GetLocationModel> getLocationList = [];

  @override
  Widget build(BuildContext context) {
    final locationList =
        context.select((GetLocactionProvider g) => g.getLocationList);

    final locationBasedEventLIst =
        context.select((GetLocactionProvider g) => g.locationBasedEventsList);
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
                child: DropdownButton<int>(
                  isExpanded: true,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                  items: locationList.map((value) {
                    return DropdownMenuItem<int>(
                      value: value.id,
                      child: Text(
                        value.name.toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(
                      () {
                        _mySelection = newValue;

                        Provider.of<GetLocactionProvider>(context,
                                listen: false)
                            .getLocation();
                      },
                    );

                    Provider.of<GetLocactionProvider>(context, listen: false)
                        .getLocationBasedEvents(_mySelection ?? 1);

                    log(newValue.toString());
                  },
                  hint: const Text(
                    "Select Location",
                    style: TextStyle(color: Colors.white),
                  ),
                  // value: _mySelection,
                  value: _mySelection,
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
                // padding: EdgeInsets.all(50),
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 3 / 4,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0),
                itemCount: locationBasedEventLIst.length,
                itemBuilder: (BuildContext ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      var id = locationBasedEventLIst[index].id;
                      log("id___________________________$id");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  LuckyAliLiveScreen(id: id)));
                    },
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Container(
                                //   decoration: const BoxDecoration(
                                //       color: Colors.white,
                                //       borderRadius: BorderRadius.only(
                                //           topLeft: Radius.circular(50),
                                //           topRight: Radius.circular(50))),
                                //   child: Image.network(
                                //     locationBasedEventLIst[index].coverImage,
                                //     fit: BoxFit.fill,
                                //   ),
                                // ),
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 4,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                locationBasedEventLIst[index]
                                                    .coverImage))),
                                  ),
                                ),
                                Container(
                                  width: double.maxFinite,
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
                                        locationBasedEventLIst[index].name,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      // Text(
                                      //   features[index],
                                      //   style: const TextStyle(
                                      //       fontSize: 18,
                                      //       fontWeight: FontWeight.w700),
                                      // ),
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
                              child: Text(
                                formatDate(locationBasedEventLIst[index].date),
                                maxLines: 2,
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
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
  int? _mySelection;

  GetLocactionProvider? getLocactionProvider;

  get index => null;

  @override
  void initState() {
    super.initState();

    Provider.of<GetLocactionProvider>(context, listen: false).getLocation();
    Provider.of<GetLocactionProvider>(context, listen: false).getAllEvents();
  }

  int? lId;

  String formatDate(DateTime date) => DateFormat("d MMM").format(date);

  GetLocationModel? getLocationModel;
  List<GetLocationModel> getLocationList = [];

  @override
  Widget build(BuildContext context) {
    final locationList =
        context.select((GetLocactionProvider g) => g.getLocationList);

    final locationBasedEventLIst =
        context.select((GetLocactionProvider g) => g.locationBasedEventsList);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          // toolbarHeight: MediaQuery.of(context).size.height / 7,
          backgroundColor: Colors.black,
          title: const CommonWebAppbar()),
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text(
              AppStrings.event,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: GetColor().getColorFromHex(AppColors().orange),
                  fontSize: 30),
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
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.orange,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: AppStrings.eventHint,
                        hintStyle: TextStyle(
                          fontSize: 18,
                          color:
                              GetColor().getColorFromHex(AppColors().hintColor),
                        ),
                      ),
                      onChanged: (value) {
                        Provider.of<GetLocactionProvider>(context,
                                listen: false)
                            .getSearchEvetDetail(
                                1, eventController.text.toString());
                        // setState(() {
                        //   Provider.of<GetLocactionProvider>(context,
                        //           listen: false)
                        //       .getAllEvents();
                        // });

                        // Provider.of<GetLocactionProvider>(context,
                        //         listen: false)
                        //     .getAllEvents();
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    width: MediaQuery.of(context).size.width / 2.3,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 4),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20)),
                    child:
                        //  DropdownButton<GetLocationModel>(
                        //   hint: Text("Select a user"),
                        //   value: getLocationModel,
                        //   onChanged: (newValue) {
                        //     setState(() {
                        //       getLocationModel = newValue;
                        //     });
                        //   },
                        //   items: getLocationList.map((GetLocationModel user) {
                        //     return DropdownMenuItem<GetLocationModel>(
                        //       value: user,
                        //       child: Text(
                        //         user.name.toString(),
                        //         style: const TextStyle(color: Colors.white),
                        //       ),
                        //     );
                        //   }).toList(),
                        // ),

                        DropdownButtonHideUnderline(
                      child: DropdownButton<int>(
                        isExpanded: true,
                        dropdownColor: Colors.black,
                        items: locationList.map((countryone) {
                          return DropdownMenuItem<int>(
                            value: countryone
                                .id, //locationList[index].data[index].name,
                            child: Text(
                              countryone.name.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 17),
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(
                            () {
                              _mySelection = newValue;

                              Provider.of<GetLocactionProvider>(context,
                                      listen: false)
                                  .getLocation();
                            },
                          );

                          Provider.of<GetLocactionProvider>(context,
                                  listen: false)
                              .getLocationBasedEvents(_mySelection ?? 1);

                          log(newValue.toString());
                        },
                        hint: const Text(
                          "Select Location",
                          style: TextStyle(color: Colors.white),
                        ),
                        // value: _mySelection,
                        value: _mySelection,
                      ),
                    ),
                  ),
                ]),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1.1,
              child: GridView.builder(
                  padding: const EdgeInsets.all(10),
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3.5 / 5,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 0.0),
                  itemCount: locationBasedEventLIst.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        var id = locationBasedEventLIst[index].id;
                        log("id___________________________-$id");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    LuckyAliLiveScreen(id: id)));
                      },
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              5,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                  locationBasedEventLIst[index]
                                                      .coverImage))),
                                    ),
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
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Row(
                                      children: [
                                        Container(
                                          color: Colors.transparent,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3.5,
                                          child: Text(
                                            locationBasedEventLIst[index].name,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style:
                                                const TextStyle(fontSize: 15),
                                          ),
                                        ),
                                        const SizedBox()
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                alignment: Alignment.center,
                                height: MediaQuery.of(context).size.height / 8,
                                width: MediaQuery.of(context).size.width / 10,
                                decoration: BoxDecoration(
                                    color: GetColor().getColorFromHex(
                                        AppColors().appbarColor),
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20))),
                                child: Text(
                                  // locationBasedEventLIst[index].date.toString(),
                                  formatDate(
                                      locationBasedEventLIst[index].date),
                                  maxLines: 2,
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
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
  int? _mySelection;

  GetLocactionProvider? getLocactionProvider;

  @override
  void initState() {
    super.initState();

    Provider.of<GetLocactionProvider>(context, listen: false).getLocation();
    Provider.of<GetLocactionProvider>(context, listen: false).getAllEvents();
  }

  int? lId;

  String formatDate(DateTime date) => DateFormat("d MMM").format(date);

  GetLocationModel? getLocationModel;
  List<GetLocationModel> getLocationList = [];
  @override
  Widget build(BuildContext context) {
    final locationList =
        context.select((GetLocactionProvider g) => g.getLocationList);

    final locationBasedEventLIst =
        context.select((GetLocactionProvider g) => g.locationBasedEventsList);

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
                  child: DropdownButton<int>(
                    isExpanded: true,
                    dropdownColor: Colors.red,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                    items: locationList.map((value) {
                      return DropdownMenuItem<int>(
                        value: value.id,
                        child: Text(
                          value.name.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 30),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(
                        () {
                          _mySelection = newValue;

                          Provider.of<GetLocactionProvider>(context,
                                  listen: false)
                              .getLocation();
                        },
                      );

                      Provider.of<GetLocactionProvider>(context, listen: false)
                          .getLocationBasedEvents(_mySelection ?? 1);

                      log(newValue.toString());
                    },
                    hint: const Text(
                      "Select Location",
                      style: TextStyle(color: Colors.white),
                    ),
                    // value: _mySelection,
                    value: _mySelection,
                  ),
                ),
              ),
            ]),
            const SizedBox(height: 30),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                  // physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3.5 / 3,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 0.0),
                  itemCount: locationBasedEventLIst.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        final id = locationBasedEventLIst[index].id;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LuckyAliLiveScreen(
                                      id: id,
                                    )));
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
                                        image: NetworkImage(
                                            locationBasedEventLIst[index]
                                                .coverImage),
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
                                        MediaQuery.of(context).size.height / 8,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            locationBasedEventLIst[index].name,
                                            style: const TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
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
                                child: Text(
                                  formatDate(
                                      locationBasedEventLIst[index].date),
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
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
