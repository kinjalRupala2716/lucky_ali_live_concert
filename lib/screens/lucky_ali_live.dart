import 'package:flutter/material.dart';
import 'package:knocksence_flutter_webapp/screens/ticket_screen.dart';
import 'package:knocksence_flutter_webapp/utils/app_string.dart';
import 'package:knocksence_flutter_webapp/utils/color.dart';

class LuckyAliLiveScreen extends StatefulWidget {
  const LuckyAliLiveScreen({super.key});

  @override
  State<LuckyAliLiveScreen> createState() => _LuckyAliLiveScreenState();
}

class _LuckyAliLiveScreenState extends State<LuckyAliLiveScreen> {
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
                      Container(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                        color: Colors.transparent,
                        height: 100,
                        width: double.infinity,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "RS 1000 ONWARDS",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const TicketScreen(),
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
                  ),
                ),
              ),
            
            ],
          ),
        ));
  }

  Widget _initialWidget() {
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
          const Text(
            "KNOCKSENSE\nLUCKY ALI LIVE",
            style: TextStyle(
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
              const Text(
                "20 Nov 2022 at 04:00 PM",
                style: TextStyle(fontSize: 30, color: Colors.black),
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
              const Text(
                "Outhouse By Office, Kanpur",
                style: TextStyle(fontSize: 30, color: Colors.black),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
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
                const SizedBox(
                  height: 20,
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
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _endWidget() {
    return Column(
      children: const [
        Text(
          "For existing Platinum/Select Members: Click on book tickets -> Type\nyour name & registered phone number -> Click on proceed to get\nmembership wise pricing.\n\n\n-> Ticket Price for Select & Select Mini Member: Rs. 300\n-> Rs.400 Off for Platinum Members\n-> Ticket Price for a Non-KnockOFF Members: Rs.1000\n-> Ticket Price for Select & Select Mini Member: Rs. 300\n-> Rs.400 Off for Platinum Members\n-> Ticket Price for a Non-KnockOFF Member: Rs.1000\n-> Ticket Price for Select & Select Mini Members: Rs. 300",
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }

  Widget sliverAppBarWidget() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 85,
      backgroundColor: Colors.transparent,
      expandedHeight: MediaQuery.of(context).size.height,
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
                decoration: const BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                        image: AssetImage("assets/images/luckyali.png"),
                        fit: BoxFit.fill)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
