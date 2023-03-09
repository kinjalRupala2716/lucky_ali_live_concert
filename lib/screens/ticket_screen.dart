// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:knocksence_flutter_webapp/commom_widget/common_toast.dart';
import 'package:knocksence_flutter_webapp/commom_widget/common_web_appbar.dart';
import 'package:knocksence_flutter_webapp/models/event_detail_model.dart';
import 'package:knocksence_flutter_webapp/providers/get_location_provider.dart';
import 'package:knocksence_flutter_webapp/screens/checkout_screen.dart';
import 'package:knocksence_flutter_webapp/utils/app_string.dart';
import 'package:knocksence_flutter_webapp/utils/color.dart';
import 'package:knocksence_flutter_webapp/utils/my_sharepreferences.dart';
import 'package:provider/provider.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key, required this.id});

  final int id;
  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      // if (constraint.maxWidth > 1200) {
      //   return DesktopView(
      //     id: widget.id,
      //   );
      // } else if (constraint.maxWidth > 800 && constraint.maxWidth < 1200) {
      //   return TabletView(
      //     id: widget.id,
      //   );
      // }
      return MobileView(
        id: widget.id,
      );
    });
  }
}

class DesktopView extends StatefulWidget {
  const DesktopView({super.key, required this.id});

  final int id;

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  int count = 0;

  late GetLocactionProvider getLocactionProvider;

  @override
  void initState() {
    super.initState();
    getLocactionProvider =
        Provider.of<GetLocactionProvider>(context, listen: false);
    getLocactionProvider.getEvetDetail(widget.id);
  }

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
      body: NestedScrollView(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      // height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _initialWidget(),
                            const SizedBox(
                              height: 20,
                            ),
                            // _endWidget(),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [sliverAppBarWidget()];
        },
      ),
    );
  }

  Widget sliverAppBarWidget() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 85,
      backgroundColor: Colors.transparent,
      expandedHeight: MediaQuery.of(context).size.height / 2,
      floating: true,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        background: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(50),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                        image: NetworkImage(
                            getLocactionProvider.eventDetailModel?.coverImage ??
                                ""),
                        fit: BoxFit.fill)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _initialWidget() {
    // List ticketName = [
    //   "Platinum - General Area",
    //   "Select Mini - Premium Area",
    //   "Select - VIP Area",
    // ];

    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                color: GetColor().getColorFromHex(AppColors().liteGrey),
                width: MediaQuery.of(context).size.width / 10,
                height: 5,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Choose Ticket Type",
                style: TextStyle(
                    color: GetColor().getColorFromHex(AppColors().liteGrey),
                    fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              // width: MediaQuery.of(context).size.width / 1.5,
              child: ListView.separated(
                // padding: EdgeInsets.zero,
                itemCount:
                    getLocactionProvider.eventDetailModel?.ticket.length ?? 00,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showBottomSheet(
                        backgroundColor: Colors.black,
                        context: context,
                        builder: (context) {
                          return _initialWidget1(
                              count,
                              getLocactionProvider
                                  .eventDetailModel!.ticket[index]);
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/icons/ticketIcon.png",
                                  height: 100,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        getLocactionProvider.eventDetailModel
                                                ?.ticket[index].name
                                                .toString() ??
                                            "",
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      Text(
                                        getLocactionProvider.eventDetailModel
                                                ?.ticket[index].description
                                                .toString() ??
                                            "",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Image.asset(
                              "assets/icons/forwardArrow.png",
                              height: 30,
                              width: 30,
                            )
                          ]),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
              ),
            )
          ],
        ));
  }

  Widget _initialWidget1(int count, Ticket ticket) {
    String fixVelue = "View Details";

    List<TextEditingController> nameController = [];
    List<TextEditingController> numberController = [];

    return StatefulBuilder(builder: (context, setState) {
      return SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(30),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    color: GetColor().getColorFromHex(AppColors().liteGrey),
                    width: MediaQuery.of(context).size.width / 9,
                    height: 5,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 30,
                          ),
                          Text(
                            "Back",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 50),
                      child: Text(
                        "BOOK TICKETS",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ticket.name.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ticket.price.toString(),
                            style: const TextStyle(
                                fontSize: 30, color: Colors.black),
                          ),
                          count < 1
                              ? Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        count++;

                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                            "assets/icons/addIcon.png",
                                          ),
                                        )),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Add",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: GetColor().getColorFromHex(
                                              AppColors().orange)),
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        count++;

                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                            "assets/icons/addIcon.png",
                                          ),
                                        )),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Add",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: GetColor().getColorFromHex(
                                              AppColors().orange)),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        count--;

                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                            "assets/icons/subtractionIcon.png",
                                          ),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                          const SizedBox(),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: Colors.white,
                            isExpanded: true,
                            hint: const Text("View Details"),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Color.fromRGBO(0, 0, 0, 1),
                              size: 50,
                            ),
                            items: getLocactionProvider.eventDetailList
                                .map((value) {
                              return DropdownMenuItem<String>(
                                value: value.description.toString(),
                                child: Text(
                                  value.description.toString(),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 20),
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: GetColor().getColorFromHex(AppColors().pinkColor),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Ticket will be credited in first user’s Knocksense account !",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color:
                            GetColor().getColorFromHex(AppColors().maroonColor),
                        fontSize: 25),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  // height: MediaQuery.of(context).size.height,
                  width: double.maxFinite,
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.black,
                          // height: 500,
                          width: MediaQuery.of(context).size.width,

                          child: Container(
                              padding: const EdgeInsets.all(30),
                              height: 100,
                              // width: MediaQuery.of(context).size.width / 2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                              child: Row(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: GetColor().getColorFromHex(
                                                AppColors().hintColor)),
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            bottomLeft: Radius.circular(15))),
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    height: 100,
                                    child: TextFormField(
                                      controller: nameController[index],
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.name,
                                      decoration: const InputDecoration(
                                          hintText: "Name",
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: GetColor().getColorFromHex(
                                                AppColors().hintColor)),
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(15),
                                            bottomRight: Radius.circular(15))),
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    height: 70,
                                    child: TextFormField(
                                      controller: numberController[index],
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.name,
                                      decoration: const InputDecoration(
                                          hintText: "Contact Number",
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              )),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
                      itemCount: count),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      log("count______________$count");
                      if (count == 0) {
                        _showDialogBox();
                      } else {
                        GetLocactionProvider getLocactionProvider =
                            Provider.of<GetLocactionProvider>(context,
                                listen: false);

                        Map data = {
                          "mobile": numberController[count].text.toString(),
                          "is_from_event_booking_site": 1
                        };

                        getLocactionProvider.signInProvider(data);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: GetColor().getColorFromHex(AppColors().orange),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      child: const Text(
                        "SUBMIT DETAILS",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                )
              ],
            )),
      );
    });
  }

  _showDialogBox() {
    return showDialog(
        builder: (context) {
          return AlertDialog(
            actionsPadding: EdgeInsets.zero,
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Ok",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: GetColor().getColorFromHex(AppColors().orange),
                    ),
                  ))
            ],
            content: Text.rich(
              TextSpan(
                text: 'Click on ',
                style: TextStyle(
                    fontSize: 17,
                    color: GetColor().getColorFromHex(
                        AppColors().orange)), // default text style
                children: <TextSpan>[
                  TextSpan(
                    text: 'Add Button ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: GetColor().getColorFromHex(AppColors().orange),
                    ),
                  ),
                  TextSpan(
                    text: "to add details",
                    style: TextStyle(
                      fontSize: 17,
                      color: GetColor().getColorFromHex(AppColors().orange),
                    ),
                  )
                ],
              ),
              textAlign: TextAlign.center,
            ),
          );
        },
        context: context);
  }
}

class MobileView extends StatefulWidget {
  const MobileView({super.key, required this.id});

  final int id;
  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  int count = 0;

  late GetLocactionProvider getLocactionProvider;

  @override
  void initState() {
    super.initState();
    getLocactionProvider =
        Provider.of<GetLocactionProvider>(context, listen: false);
    getLocactionProvider.getEvetDetail(widget.id);
  }

  @override
  Widget build(BuildContext context) {
//         final locationBasedEventLIst =
//         context.select((GetLocactionProvider g) => g.getEvetDetail(count));

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
      body: NestedScrollView(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _initialWidget(),
                            const SizedBox(
                              height: 20,
                            ),
                            // _endWidget(),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [sliverAppBarWidget()];
        },
      ),
    );
  }

  Widget sliverAppBarWidget() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 85,
      backgroundColor: Colors.transparent,
      expandedHeight: MediaQuery.of(context).size.height / 2,
      floating: true,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        background: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(50),
              child: Container(
                // height: MediaQuery.of(context).size.height,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                        image: NetworkImage(
                            getLocactionProvider.eventDetailModel?.coverImage ??
                                ""),
                        fit: BoxFit.fill)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _initialWidget() {
    // List ticketName = [
    //   "Platinum - General Area",
    //   "Select Mini - Premium Area",
    //   "Select - VIP Area",
    // ];

    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                color: GetColor().getColorFromHex(AppColors().liteGrey),
                width: MediaQuery.of(context).size.width / 10,
                height: 5,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Choose Ticket Type",
                style: TextStyle(
                    color: GetColor().getColorFromHex(AppColors().liteGrey),
                    fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              // height: MediaQuery.of(context).size.height / 1.5,
              // width: MediaQuery.of(context).size.width / 1.5,
              child: ListView.separated(
                // padding: EdgeInsets.zero,
                itemCount:
                    getLocactionProvider.eventDetailModel?.ticket.length ?? 00,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showBottomSheet(
                        backgroundColor: Colors.black,
                        context: context,
                        builder: (context) {
                          return _initialWidget1(
                              count,
                              getLocactionProvider
                                  .eventDetailModel!.ticket[index],
                              getLocactionProvider.eventDetailModel!.ticket);
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/icons/ticketIcon.png",
                                  height: 50,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      getLocactionProvider.eventDetailModel
                                              ?.ticket[index].name ??
                                          "",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text(
                                        getLocactionProvider.eventDetailModel
                                                ?.ticket[index].description
                                                .toString() ??
                                            "",
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Image.asset(
                              "assets/icons/forwardArrow.png",
                              height: 30,
                              width: 30,
                            )
                          ]),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
              ),
            )
          ],
        ));
  }

  Widget _initialWidget1(
    int count,
    Ticket ticket,
    List<Ticket> listTicket,
  ) {
    String? fixVelue = "View Details";

    // List<TextEditingController> nameController = [];
    // List<TextEditingController> numberController = [];

    List<Map<String, dynamic>> userDetail = [
      // {"name": '', "mobile": '', "is_from_event_booking_site": 1},
    ];

    List<String>? countryname;

    List<String> countries = ["Nepal", "India", "USA"];

    return StatefulBuilder(builder: (context, setState) {
      return SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(30),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    color: GetColor().getColorFromHex(AppColors().liteGrey),
                    width: MediaQuery.of(context).size.width / 9,
                    height: 5,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 20,
                          ),
                          Text(
                            "Back",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 50),
                      child: Text(
                        "BOOK TICKETS",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // getLocactionProvider.eventDetailModel?.ticket[1].name ?? "",
                        ticket.name.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            // "₹ 849",
                            "₹${ticket.price.round().toString()}",
                            style: const TextStyle(
                                fontSize: 18, color: Colors.black),
                          ),
                          count < 1
                              ? Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          count++;

                                          userDetail.add({
                                            "name": '',
                                            "mobile": '',
                                            "is_from_event_booking_site": 1
                                          });
                                        });
                                      },
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                            "assets/icons/addIcon.png",
                                          ),
                                        )),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Add",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: GetColor().getColorFromHex(
                                              AppColors().orange)),
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          count++;

                                          userDetail.add({
                                            "name": '',
                                            "mobile": '',
                                            "is_from_event_booking_site": 1
                                          });
                                        });
                                      },
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                            "assets/icons/addIcon.png",
                                          ),
                                        )),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Add",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: GetColor().getColorFromHex(
                                              AppColors().orange)),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        count--;

                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                            "assets/icons/subtractionIcon.png",
                                          ),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                          const SizedBox(),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<List<String>>(
                            hint: const Text("View Details"),
                            dropdownColor: Colors.white,
                            isExpanded: true,
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                              size: 30,
                            ),
                            items: listTicket.map((value) {
                              // var iterable =
                              //     Iterable.generate(value.description.length);
                              var dess = value.description;
                              var des = dess.iterator;
                              var actualString;
                              while (des.moveNext()) {
                                actualString = des.current;
                                print(actualString);
                              }
                              return DropdownMenuItem<List<String>>(
                                value: value.description,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: GetColor().getColorFromHex(
                                              AppColors().golden),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Image.asset(
                                          "assets/icons/ticketsmallicon.png"),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.7,
                                      child: Text(
                                        value.description.toString(),
                                        maxLines: 2,
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              // setState(
                              //   () {
                              //     countryname = newValue;
                              //   },
                              // );
                            },
                            value: countryname,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: GetColor().getColorFromHex(AppColors().pinkColor),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Ticket will be credited in first user’s Knocksense account !",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color:
                            GetColor().getColorFromHex(AppColors().maroonColor),
                        fontSize: 12),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  // height: MediaQuery.of(context).size.height,
                  width: double.maxFinite,
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        // nameController.add(TextEditingController());
                        // numberController.add(TextEditingController());
                        return Container(
                          color: Colors.black,
                          // height: 500,
                          width: MediaQuery.of(context).size.width,

                          child: Container(
                              padding: const EdgeInsets.all(10),
                              // height: 50,
                              // width: MediaQuery.of(context).size.width / 2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(left: 20),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: GetColor().getColorFromHex(
                                                AppColors().hintColor)),
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            bottomLeft: Radius.circular(15))),
                                    width: MediaQuery.of(context).size.width,
                                    // height: 50,
                                    child: TextFormField(
                                      // controller: nameController[index],
                                      keyboardType: TextInputType.name,
                                      textInputAction: TextInputAction.next,
                                      decoration: const InputDecoration(
                                          hintText: "Name",
                                          border: InputBorder.none),
                                      onChanged: (value) {
                                        userDetail[index]['name'] = value;
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 20),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: GetColor().getColorFromHex(
                                                AppColors().hintColor)),
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            bottomLeft: Radius.circular(15))),
                                    width: MediaQuery.of(context).size.width,
                                    // height: 50,
                                    child: TextFormField(
                                      // controller: numberController[index],
                                      keyboardType: TextInputType.phone,
                                      textInputAction: TextInputAction.done,
                                      decoration: const InputDecoration(
                                          hintText: "Contact Number",
                                          border: InputBorder.none),
                                      onChanged: (value) {
                                        userDetail[index]['mobile'] = value;
                                      },
                                    ),
                                  ),
                                ],
                              )),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
                      itemCount: count),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      final double totalPrice = ticket.price * count;
                      log("totalPrice----------${ticket.id}");

                      log("userName_________-${userDetail.toString()}");

                      log("count____________$count");
                      if (count == 0) {
                        _showDialogBox();
                      } else if (userDetail[0]["name"].toString().isEmpty) {
                        CommonToast().commonFlutterToast("Enter your Name");
                      } else if (userDetail[0]["mobile"].toString().isEmpty) {
                        CommonToast()
                            .commonFlutterToast("Enter your Mobile Number");
                      } else if (userDetail[0]['mobile'].toString().length >
                          10) {
                        CommonToast().commonFlutterToast(
                            "Number mut have 10 digit long");
                      } else {
                        // GetLocactionProvider getLocactionProvider =
                        // ;
                        Map data = {
                          "mobile": userDetail[0]['mobile'],
                          "is_from_event_booking_site": 1
                        };

                        // Map dataOtp = {
                        //   "mobile": userDetail['mobile'],
                        //   "is_from_event_booking_site": 1
                        // };

                        //  var res = Provider.of<GetLocactionProvider>(context,
                        //           listen: false).signInProvider(data);
                        var res = await context
                            .read<GetLocactionProvider>()
                            .signInProvider(data);
                        if (res['code'] == 900) {
                          log("mobile doe");
                          final res1 = await context
                              .read<GetLocactionProvider>()
                              .otpVerifyProvider({
                            "mobile": userDetail[0]['mobile'],
                            "otp": res['otp'],
                          });

                          if (res1['code'] == 900) {
                            log(res1['message']);
                            log("donneeeeee");
                            String token = res1["data"]["token"];

                            log("Token__________________$token");

                            MySharedPreferences.instance
                                .setStringValue("token", token);

                            // for (int i = 0; i < count; i++) {
                            //   Map data = {
                            //     "name": userDetail[i]["name"],
                            //     "mobile": userDetail[i]["mobile"]
                            //   };
                            // }

                            log("list___________$userDetail");
                            Map res2 = await Provider.of<GetLocactionProvider>(
                                    context,
                                    listen: false)
                                .bookTicketProvider({
                              "tickets": [
                                {"ticket_id": ticket.id, "quantity": count}
                              ],
                              "attendee_list": userDetail
                            }, widget.id);

                            log("res2______________$res2");
                            if (res2['code'] == 900) {
                              log("res2______________$res2");

                              log("TicketId_____${ticket.id}");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CheckOutScreen(
                                          id: widget.id,
                                          tId: ticket.id,
                                          data: res2['data']['Attendee_data'],
                                          price: totalPrice,
                                          quantity: count,
                                        )),
                              );
                            }
                          }
                        }
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: GetColor().getColorFromHex(AppColors().orange),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      child: const Text(
                        "SUBMIT DETAILS",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                )
              ],
            )),
      );
    });
  }

  _showDialogBox() {
    return showDialog(
        builder: (context) {
          return AlertDialog(
            actionsPadding: EdgeInsets.zero,
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Ok",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: GetColor().getColorFromHex(AppColors().orange),
                    ),
                  ))
            ],
            content: Text.rich(
              TextSpan(
                text: 'Click on ',
                style: TextStyle(
                    fontSize: 17,
                    color: GetColor().getColorFromHex(
                        AppColors().orange)), // default text style
                children: <TextSpan>[
                  TextSpan(
                    text: 'Add Button ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: GetColor().getColorFromHex(AppColors().orange),
                    ),
                  ),
                  TextSpan(
                    text: "to add details",
                    style: TextStyle(
                      fontSize: 17,
                      color: GetColor().getColorFromHex(AppColors().orange),
                    ),
                  )
                ],
              ),
              textAlign: TextAlign.center,
            ),
          );
        },
        context: context);
  }
}

class TabletView extends StatefulWidget {
  const TabletView({super.key, required this.id});

  final int id;

  @override
  State<TabletView> createState() => _TabletViewState();
}

class _TabletViewState extends State<TabletView> {
  int count = 0;

  late GetLocactionProvider getLocactionProvider;

  @override
  void initState() {
    super.initState();
    getLocactionProvider =
        Provider.of<GetLocactionProvider>(context, listen: false);
    getLocactionProvider.getEvetDetail(widget.id);
  }

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
      body: NestedScrollView(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      // height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _initialWidget(),
                            const SizedBox(
                              height: 20,
                            ),
                            // _endWidget(),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [sliverAppBarWidget()];
        },
      ),
    );
  }

  Widget sliverAppBarWidget() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 85,
      backgroundColor: Colors.transparent,
      expandedHeight: MediaQuery.of(context).size.height / 2,
      floating: true,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        background: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(50),
              child: Container(
                // height: MediaQuery.of(context).size.height,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                        image: NetworkImage(
                            getLocactionProvider.eventDetailModel?.coverImage ??
                                ""),
                        fit: BoxFit.fill)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _initialWidget() {
    List ticketName = [
      "Platinum - General Area",
      "Select Mini - Premium Area",
      "Select - VIP Area",
    ];

    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                color: GetColor().getColorFromHex(AppColors().liteGrey),
                width: MediaQuery.of(context).size.width / 10,
                height: 5,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Choose Ticket Type",
                style: TextStyle(
                    color: GetColor().getColorFromHex(AppColors().liteGrey),
                    fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ListView.separated(
              padding: EdgeInsets.zero,
              itemCount:
                  getLocactionProvider.eventDetailModel?.ticket.length ?? 00,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showBottomSheet(
                      backgroundColor: Colors.black,
                      context: context,
                      builder: (context) {
                        return _initialWidget1(
                            count,
                            getLocactionProvider
                                .eventDetailModel!.ticket[index]);
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/icons/ticketIcon.png",
                                height: 80,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ticketName[index],
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 40,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Early Bird Ticket Live Now!\nFree Platinum Membership",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Image.asset(
                            "assets/icons/forwardArrow.png",
                            height: 30,
                            width: 30,
                          )
                        ]),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 20,
                );
              },
            )
          ],
        ));
  }

  Widget _initialWidget1(int count, Ticket ticket) {
    String fixVelue = "View Details";

    List<TextEditingController> nameController = [];
    List<TextEditingController> numberController = [];

    return StatefulBuilder(builder: (context, setState) {
      return SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(30),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    color: GetColor().getColorFromHex(AppColors().liteGrey),
                    width: MediaQuery.of(context).size.width / 9,
                    height: 5,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 20,
                          ),
                          Text(
                            "Back",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 50),
                      child: Text(
                        "BOOK TICKETS",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Platinum - General Area",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "₹ 849",
                            style: TextStyle(fontSize: 30, color: Colors.black),
                          ),
                          count < 1
                              ? Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        count++;

                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                            "assets/icons/addIcon.png",
                                          ),
                                        )),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Add",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: GetColor().getColorFromHex(
                                              AppColors().orange)),
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        count++;

                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                            "assets/icons/addIcon.png",
                                          ),
                                        )),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Add",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: GetColor().getColorFromHex(
                                              AppColors().orange)),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        count--;

                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                            "assets/icons/subtractionIcon.png",
                                          ),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                          const SizedBox(),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: Colors.white,
                            isExpanded: true,
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                              size: 50,
                            ),
                            items: getLocactionProvider.eventDetailList
                                .map((value) {
                              return DropdownMenuItem<String>(
                                value: value.description.toString(),
                                child: Text(
                                  value.description.toString(),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 30),
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: GetColor().getColorFromHex(AppColors().pinkColor),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Ticket will be credited in first user’s Knocksense account !",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color:
                            GetColor().getColorFromHex(AppColors().maroonColor),
                        fontSize: 25),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  // height: MediaQuery.of(context).size.height,
                  width: double.maxFinite,
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(20),
                            height: MediaQuery.of(context).size.width / 3,
                            // width: MediaQuery.of(context).size.width / 2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 20),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: GetColor().getColorFromHex(
                                              AppColors().hintColor)),
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(20))),
                                  width: MediaQuery.of(context).size.width,
                                  // height: 50,
                                  child: TextFormField(
                                    controller: nameController[index],
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.name,
                                    style: TextStyle(
                                        color: GetColor().getColorFromHex(
                                            AppColors().orange),
                                        fontSize: 18),
                                    cursorColor: GetColor()
                                        .getColorFromHex(AppColors().orange),
                                    decoration: const InputDecoration(
                                        hintText: "Name",
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(fontSize: 18)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 20),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: GetColor().getColorFromHex(
                                              AppColors().hintColor)),
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          bottomLeft: Radius.circular(15))),
                                  width: MediaQuery.of(context).size.width,
                                  // height: 50,
                                  child: TextFormField(
                                    controller: numberController[index],
                                    textInputAction: TextInputAction.done,
                                    keyboardType: TextInputType.phone,
                                    style: TextStyle(
                                        color: GetColor().getColorFromHex(
                                            AppColors().orange),
                                        fontSize: 18),
                                    cursorColor: GetColor()
                                        .getColorFromHex(AppColors().orange),
                                    decoration: const InputDecoration(
                                        hintText: "Contact Number",
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(fontSize: 18)),
                                  ),
                                ),
                              ],
                            ));
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
                      itemCount: count),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (count == 0) {
                        _showDialogBox();
                      } else if (nameController[count]
                          .text
                          .toString()
                          .isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please Enter Name",
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor:
                                GetColor().getColorFromHex(AppColors().orange),
                            textColor: Colors.white,
                            fontSize: 20);
                      } else if (numberController[count]
                          .text
                          .toString()
                          .isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please Enter Number",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor:
                                GetColor().getColorFromHex(AppColors().orange),
                            textColor: Colors.white,
                            fontSize: 20);
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckOutScreen(
                                      id: widget.id,
                                      data: [],
                                      tId: 1,
                                      price: 0.0,
                                      quantity: 0,
                                    )));
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: GetColor().getColorFromHex(AppColors().orange),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      child: const Text(
                        "SUBMIT DETAILS",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ),
                )
              ],
            )),
      );
    });
  }

  _showDialogBox() {
    return showDialog(
        builder: (context) {
          return AlertDialog(
            actionsPadding: const EdgeInsets.all(20),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Ok",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: GetColor().getColorFromHex(AppColors().orange),
                    ),
                  ))
            ],
            content: Text.rich(
              TextSpan(
                text: 'Click on ',
                style: TextStyle(
                    fontSize: 30,
                    color: GetColor().getColorFromHex(
                        AppColors().orange)), // default text style
                children: <TextSpan>[
                  TextSpan(
                    text: 'Add Button ',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: GetColor().getColorFromHex(AppColors().orange),
                    ),
                  ),
                  TextSpan(
                    text: "to add details",
                    style: TextStyle(
                      fontSize: 30,
                      color: GetColor().getColorFromHex(AppColors().orange),
                    ),
                  )
                ],
              ),
              textAlign: TextAlign.center,
            ),
          );
        },
        context: context);
  }
}
