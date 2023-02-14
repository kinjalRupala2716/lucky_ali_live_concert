import 'package:flutter/material.dart';
import 'package:knocksence_flutter_webapp/commom_widget/common_web_appbar.dart';
import 'package:knocksence_flutter_webapp/screens/thankyou_screen.dart';
import 'package:knocksence_flutter_webapp/utils/app_string.dart';
import 'package:knocksence_flutter_webapp/utils/color.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      if (constraint.maxWidth > 1200) {
        return const DesktopView();
      } else if (constraint.maxWidth < 800) {
        return const MobileView();
      } else if (constraint.maxWidth >= 800) {
        return const TabletView();
      }
      return Container();
    });
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
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [sliverAppBarWidget()];
          },
          body: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                // physics: const NeverScrollableScrollPhysics(),
                child: Column(children: [
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
                ]),
              ))
            ],
          )),
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

  _initialWidget() {
    return Container(
        padding: const EdgeInsets.all(50),
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
            const Center(
              child: Text(
                "CHECKOUT",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/luckyali2.png"),
                    ),
                  ),
                  // child: Image.asset("assets/images/luckyali.png"),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text(
                    "Knocksence Lucky\nAli Live",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.white,
                    // thickness: 1,
                    width: MediaQuery.of(context).size.width / 2,
                    height: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Image.asset("assets/icons/calenderWhiteIcon.png"),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Sun, 26 Feb 2023",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Image.asset("assets/icons/clock.png"),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "07:00 PM Onwards",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 60),
                        child:
                            Image.asset("assets/icons/locationWhiteIcon.png"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: const Text(
                          "Club 07 Rd, off Sardar Patel Ring Road, Shela Gujrat 380059, Ahmedabad",
                          softWrap: true,
                          textAlign: TextAlign.start,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      )
                    ],
                  ),
                ])
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "User Details",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Price",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.black,
                  // thickness: 1,
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Name Of User",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "1234567890",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          "₹ 849",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Unsubscribed",
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ],
                )
              ]),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Total",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "₹ 900.00",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ThankYouScreen(),
                    ),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: GetColor().getColorFromHex(AppColors().orange),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: const Text(
                    "PROCEED TO PAY",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: MediaQuery.of(context).size.height / 7,
          backgroundColor: Colors.black,
          title: const CommonWebAppbar()),
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [sliverAppBarWidget()];
          },
          body: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                // physics: const NeverScrollableScrollPhysics(),
                child: Column(children: [
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
                ]),
              ))
            ],
          )),
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

  _initialWidget() {
    return Container(
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
            const Center(
              child: Text(
                "CHECKOUT",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 2.7,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/luckyali2.png"))),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text(
                    "Knocksence Lucky\nAli Live",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.white,
                    // thickness: 1,
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 1,
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/icons/calenderWhiteIcon.png",
                        height: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Sun, 26 Feb 2023",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/icons/clock.png",
                        height: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "07:00 PM Onwards",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Image.asset(
                          "assets/icons/locationWhiteIcon.png",
                          height: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: const Text(
                          "Club 07 Rd, off Sardar Patel Ring Road, Shela Gujrat 380059, Ahmedabad",
                          softWrap: true,
                          textAlign: TextAlign.start,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ])
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "User Details",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Price",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.black,
                  // thickness: 1,
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Name Of User",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "1234567890",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          "₹ 849",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Unsubscribed",
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ],
                )
              ]),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Total",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "₹ 900.00",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ThankYouScreen(),
                    ),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: GetColor().getColorFromHex(AppColors().orange),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: const Text(
                    "PROCEED TO PAY",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class TabletView extends StatefulWidget {
  const TabletView({super.key});

  @override
  State<TabletView> createState() => _TabletViewState();
}

class _TabletViewState extends State<TabletView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: MediaQuery.of(context).size.height / 7,
          backgroundColor: Colors.black,
          title: const CommonWebAppbar()),
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [sliverAppBarWidget()];
          },
          body: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                // physics: const NeverScrollableScrollPhysics(),
                child: Column(children: [
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
                ]),
              ))
            ],
          )),
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

  _initialWidget() {
    return Container(
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
            const Center(
              child: Text(
                "CHECKOUT",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 2.7,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/luckyali2.png"))),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text(
                    "Knocksence Lucky\nAli Live",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.white,
                    // thickness: 1,
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 1,
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/icons/calenderWhiteIcon.png",
                        height: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Sun, 26 Feb 2023",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/icons/clock.png",
                        height: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "07:00 PM Onwards",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Image.asset(
                          "assets/icons/locationWhiteIcon.png",
                          height: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: const Text(
                          "Club 07 Rd, off Sardar Patel Ring Road, Shela Gujrat 380059, Ahmedabad",
                          softWrap: true,
                          textAlign: TextAlign.start,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      )
                    ],
                  ),
                ])
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "User Details",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Price",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.black,
                  // thickness: 1,
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Name Of User",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "1234567890",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          "₹ 849",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Unsubscribed",
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 30,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ],
                )
              ]),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Total",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "₹ 900.00",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ThankYouScreen(),
                    ),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: GetColor().getColorFromHex(AppColors().orange),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: const Text(
                    "PROCEED TO PAY",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
