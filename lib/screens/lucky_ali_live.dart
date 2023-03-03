
// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:knocksence_flutter_webapp/commom_widget/common_web_appbar.dart';
import 'package:knocksence_flutter_webapp/providers/get_location_provider.dart';
import 'package:knocksence_flutter_webapp/screens/ticket_screen.dart';
import 'package:knocksence_flutter_webapp/utils/app_string.dart';
import 'package:knocksence_flutter_webapp/utils/color.dart';
import 'package:provider/provider.dart';

class LuckyAliLiveScreen extends StatefulWidget {
  const LuckyAliLiveScreen({super.key, required this.id});

  final int id;

  @override
  State<LuckyAliLiveScreen> createState() => _LuckyAliLiveScreenState();
}

class _LuckyAliLiveScreenState extends State<LuckyAliLiveScreen> {
  late GetLocactionProvider getLocactionProvider;

  @override
  void initState() {
    super.initState();
    getLocactionProvider =
        Provider.of<GetLocactionProvider>(context, listen: false);
    getLocactionProvider.getEvetDetail(widget.id);

    log("mobileId___________________${widget.id}");
  }

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
  DesktopView({super.key, required this.id});

  int id;

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  late GetLocactionProvider getLocactionProvider;

  @override
  void initState() {
    super.initState();
    getLocactionProvider =
        Provider.of<GetLocactionProvider>(context, listen: false);
    getLocactionProvider.getEvetDetail(widget.id);

    log(
        "name_____________________${getLocactionProvider.eventDetailModel?.name.toString()}");

    log(
        "image_____________________${getLocactionProvider.eventDetailModel?.coverImage}");

    log("mobileId___________________${widget.id}");
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
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[sliverAppBarWidget()];
          },
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        // height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color: Colors.white,
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
                              _endWidget(),
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
              Container(
                padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                color: Colors.transparent,
                height: 100,
                width: double.infinity,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "RS.${getLocactionProvider.eventDetailModel?.ticket.first.price.round().toString() ?? ''} ONWARDS",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 40),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TicketScreen(id: widget.id),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: GetColor()
                                  .getColorFromHex(AppColors().orange),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            "BUY NOW",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      )
                    ]),
              )
            ],
          ),
        ));
  }

  Widget _initialWidget() {
    String formatDate(DateTime date) => DateFormat("d MMM yyyy").format(date);

    String formatTime(DateTime time) => DateFormat("kk:mm a").format(time);
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
              color: Colors.black,
              width: MediaQuery.of(context).size.width / 10,
              height: 5,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            getLocactionProvider.eventDetailModel?.name.toString() ?? '',
            style: const TextStyle(
                color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Image.asset(
                "assets/icons/calenderIcon.png",
                // height: MediaQuery.of(context).size.height / 4,
                // width: MediaQuery.of(context).size.width / 4,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                "${formatDate(getLocactionProvider.eventDetailModel?.date ?? DateTime.now())} at ${formatTime(getLocactionProvider.eventDetailModel?.date ?? DateTime.now())}",
                style: const TextStyle(fontSize: 30, color: Colors.black),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Image.asset(
                "assets/icons/locationIcon.png",
                // height: MediaQuery.of(context).size.height / 4,
                // width: MediaQuery.of(context).size.width / 4,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                getLocactionProvider.eventDetailModel?.location.toString() ??
                    "",
                style: const TextStyle(fontSize: 30, color: Colors.black),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            // height: 500,
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 00),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: GetColor().getColorFromHex(AppColors().liteGrey),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Knocksense Member Benefits",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: DefaultTabController(
                    length: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TabBar(
                          unselectedLabelColor: Colors.black,
                          labelColor:
                              GetColor().getColorFromHex(AppColors().orange),
                          indicatorColor: Colors.transparent,
                          // controller: _controller,
                          tabs: const [
                            Tab(
                              child: Text(
                                "SELECT",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w900),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "SELECT MINI",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w900),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "PREMIUM",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Colors.black,
                          thickness: 1,
                          height: 2,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 80.0,
                          child: TabBarView(
                            // controller: _controller,
                            children: <Widget>[
                              Text(
                                "For existing Knocksense Select Members, tickets will be available at Rs. 1",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "For existing Knocksense Select mini Members, tickets will be available at Rs. 1",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "For existing Knocksense Premium Members, tickets will be available at Rs. 1",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _endWidget() {
    return Column(
      children: [
        Text(
          getLocactionProvider.eventDetailModel?.description.toString() ?? "",
          // "For existing Platinum/Select Members: Click on book tickets -> Type\nyour name & registered phone number -> Click on proceed to get\nmembership wise pricing.\n\n\n-> Ticket Price for Select & Select Mini Member: Rs. 300\n-> Rs.400 Off for Platinum Members\n-> Ticket Price for a Non-KnockOFF Members: Rs.1000\n-> Ticket Price for Select & Select Mini Member: Rs. 300\n-> Rs.400 Off for Platinum Members\n-> Ticket Price for a Non-KnockOFF Member: Rs.1000\n-> Ticket Price for Select & Select Mini Members: Rs. 300",
          style: const TextStyle(fontSize: 20),
        )
      ],
    );
  }

  Widget sliverAppBarWidget() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 85,
      backgroundColor: Colors.transparent,
      expandedHeight: MediaQuery.of(context).size.height / 10,
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
}

class MobileView extends StatefulWidget {
  const MobileView({super.key, required this.id});

  final int id;

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  late GetLocactionProvider getLocactionProvider;

  @override
  void initState() {
    super.initState();
    getLocactionProvider =
        Provider.of<GetLocactionProvider>(context, listen: false);
    getLocactionProvider.getEvetDetail(widget.id);

    log(
        "name_____________________${getLocactionProvider.eventDetailModel?.name.toString()}");

    log(
        "image_____________________${getLocactionProvider.eventDetailModel?.coverImage}");

    log("mobileId___________________${widget.id}");
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
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width / 3,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
        body: Consumer<GetLocactionProvider>(builder: (context, value, index) {
          return NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[sliverAppBarWidget()];
              },
              body: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            // height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  _initialWidget(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  _endWidget(),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 30,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    color: Colors.transparent,
                    height: 100,
                    width: double.infinity,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "RS.${getLocactionProvider.eventDetailModel?.ticket.first.price.round().toString() ?? ''} ONWARDS",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 20),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      TicketScreen(id: widget.id),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: GetColor()
                                      .getColorFromHex(AppColors().orange),
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Text(
                                "BUY NOW",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          )
                        ]),
                  )
                ],
              ));
        }));
  }

  Widget _initialWidget() {
    String formatDate(DateTime date) => DateFormat("dd MMM yyyy").format(date);

    String formatTime(DateTime time) => DateFormat("kk:mm a").format(time);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
              width: MediaQuery.of(context).size.width / 5,
              height: 5,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Text(
                  getLocactionProvider.eventDetailModel?.name.toString() ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                      getLocactionProvider.eventDetailModel?.thumbnailImage ??
                          ''),
                ),
              )
            ],
          ),
          // const SizedBox(
          //   height: 30,
          // ),
          Row(
            children: [
              Image.asset(
                "assets/icons/calenderIcon.png",
                height: 20, //MediaQuery.of(context).size.height / 10,
                width: 20, //MediaQuery.of(context).size.width / 10,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "${formatDate(getLocactionProvider.eventDetailModel?.date ?? DateTime.now())} at ${formatTime(getLocactionProvider.eventDetailModel?.date ?? DateTime.now())}",
                style: const TextStyle(fontSize: 15, color: Colors.black),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Image.asset(
                "assets/icons/locationIcon.png",
                height: 20,
                width: 20,
                // height: MediaQuery.of(context).size.height / 4,
                // width: MediaQuery.of(context).size.width / 4,
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Text(
                  getLocactionProvider.eventDetailModel?.location ?? "",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: GetColor().getColorFromHex(AppColors().liteGrey),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Knocksense Member Benefits",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                DefaultTabController(
                  length: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TabBar(
                        unselectedLabelColor: Colors.black,
                        labelColor:
                            GetColor().getColorFromHex(AppColors().orange),
                        indicatorColor: Colors.transparent,
                        // controller: _controller,
                        tabs: const [
                          Tab(
                            child: Text(
                              "SELECT",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w900),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "SELECT MINI",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w900),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "PREMIUM",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.black,
                        thickness: 1,
                        height: 2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 40.0,
                        child: TabBarView(
                          // controller: _controller,
                          children: <Widget>[
                            Text(
                              "For existing Knocksense Select Members, tickets will be available at Rs. 1",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              "For existing Knocksense Select mini Members, tickets will be available at Rs. 1",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              "For existing Knocksense Premium Members, tickets will be available at Rs. 1",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _endWidget() {
    return Column(
      children: [
        Text(
          getLocactionProvider.eventDetailModel?.description.toString() ?? "",
          // "For existing Platinum/Select Members: Click on book tickets -> Type\nyour name & registered phone number -> Click on proceed to get\nmembership wise pricing.\n\n\n-> Ticket Price for Select & Select Mini Member: Rs. 300\n-> Rs.400 Off for Platinum Members\n-> Ticket Price for a Non-KnockOFF Members: Rs.1000\n-> Ticket Price for Select & Select Mini Member: Rs. 300\n-> Rs.400 Off for Platinum Members\n-> Ticket Price for a Non-KnockOFF Member: Rs.1000\n-> Ticket Price for Select & Select Mini Members: Rs. 300",
          style: const TextStyle(fontSize: 15),
        )
      ],
    );
  }

  Widget sliverAppBarWidget() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      // toolbarHeight: 85,
      backgroundColor: Colors.transparent,
      expandedHeight: MediaQuery.of(context).size.height / 3,
      floating: true,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        background: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                // height: MediaQuery.of(context).size.height / 2,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
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
}

class TabletView extends StatefulWidget {
  TabletView({super.key, required this.id});

  int id;

  @override
  State<TabletView> createState() => _TabletViewState();
}

class _TabletViewState extends State<TabletView> {
  late GetLocactionProvider getLocactionProvider;

  @override
  void initState() {
    super.initState();
    getLocactionProvider =
        Provider.of<GetLocactionProvider>(context, listen: false);
    getLocactionProvider.getEvetDetail(widget.id);

    log(
        "name_____________________${getLocactionProvider.eventDetailModel?.name.toString()}");

    log(
        "image_____________________${getLocactionProvider.eventDetailModel?.coverImage}");

    log("mobileId___________________${widget.id}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: MediaQuery.of(context).size.height / 5,
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logos/KnockScenseLogoWhite2.png",
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width / 3,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[sliverAppBarWidget()];
          },
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        // height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
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
                              _endWidget(),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                        color: Colors.transparent,
                        height: 100,
                        width: double.infinity,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "RS.${getLocactionProvider.eventDetailModel?.ticket.first.price.round().toString() ?? ''} ONWARDS",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 30),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          TicketScreen(id: widget.id),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: GetColor()
                                          .getColorFromHex(AppColors().orange),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Text(
                                    "BUY NOW",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              )
                            ]),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _initialWidget() {
    String formatDate(DateTime date) => DateFormat("d MMM yyyy").format(date);

    String formatTime(DateTime time) => DateFormat("kk:mm a").format(time);
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
              color: Colors.black,
              width: MediaQuery.of(context).size.width / 10,
              height: 5,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            getLocactionProvider.eventDetailModel?.name ?? "",
            style: const TextStyle(
                color: Colors.black, fontSize: 50, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Image.asset(
                "assets/icons/calenderIcon.png",
                // height: 30, //MediaQuery.of(context).size.height / 10,
                // width: 30, //MediaQuery.of(context).size.width / 10,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                "${formatDate(getLocactionProvider.eventDetailModel?.date ?? DateTime.now())} at ${formatTime(getLocactionProvider.eventDetailModel?.date ?? DateTime.now())}",
                style: const TextStyle(fontSize: 40, color: Colors.black),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Image.asset(
                "assets/icons/locationIcon.png",
                // height: 40,
                // width: 40,
                // height: MediaQuery.of(context).size.height / 4,
                // width: MediaQuery.of(context).size.width / 4,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                getLocactionProvider.eventDetailModel?.location.toString() ??
                    "",
                style: const TextStyle(fontSize: 40, color: Colors.black),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 30, 15, 00),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: GetColor().getColorFromHex(AppColors().liteGrey),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Knocksense Member Benefits",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                // const SizedBox(
                //   height: 20,
                // ),
                DefaultTabController(
                  length: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TabBar(
                        unselectedLabelColor: Colors.black,
                        labelColor:
                            GetColor().getColorFromHex(AppColors().orange),
                        indicatorColor: Colors.transparent,
                        // controller: _controller,
                        tabs: const [
                          Tab(
                            child: Text(
                              "SELECT",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.w900),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "SELECT MINI",
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.w900),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "PREMIUM",
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.black,
                        thickness: 1,
                        height: 2,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 80.0,
                        child: TabBarView(
                          // controller: _controller,
                          children: <Widget>[
                            Text(
                              "For existing Knocksense Select Members, tickets will be available at Rs. 1",
                              style: TextStyle(
                                fontSize: 50,
                              ),
                            ),
                            Text(
                              "For existing Knocksense Select mini Members, tickets will be available at Rs. 1",
                              style: TextStyle(
                                fontSize: 50,
                              ),
                            ),
                            Text(
                              "For existing Knocksense Premium Members, tickets will be available at Rs. 1",
                              style: TextStyle(
                                fontSize: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _endWidget() {
    return Column(
      children: [
        Text(
          getLocactionProvider.eventDetailModel?.description.toString() ?? "",
          style: const TextStyle(fontSize: 50),
        )
      ],
    );
  }

  Widget sliverAppBarWidget() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      // toolbarHeight: 85,
      backgroundColor: Colors.transparent,
      expandedHeight: MediaQuery.of(context).size.height / 2,
      floating: true,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        background: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                // height: MediaQuery.of(context).size.height / 2,
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
}
