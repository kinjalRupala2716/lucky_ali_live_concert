import 'package:flutter/material.dart';
import 'package:knocksence_flutter_webapp/utils/app_string.dart';
import 'package:knocksence_flutter_webapp/utils/color.dart';

class BookTicketsScreen extends StatefulWidget {
  const BookTicketsScreen({super.key});

  @override
  State<BookTicketsScreen> createState() => _BookTicketsScreenState();
}

class _BookTicketsScreenState extends State<BookTicketsScreen> {
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
                            Padding(
                              padding: const EdgeInsets.all(30),
                              child: _initialWidget(),
                            ),
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
                    // Container(
                    //   padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    //   color: Colors.transparent,
                    //   height: 100,
                    //   width: double.infinity,
                    //   child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         const Text(
                    //           "RS 1000 ONWARDS",
                    //           style: TextStyle(
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.w800,
                    //               fontSize: 20),
                    //         ),
                    //         GestureDetector(
                    //           onTap: () {
                    //             Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                 builder: (context) => const BookTicketsScreen(),
                    //               ),
                    //             );
                    //           },
                    //           child: Container(
                    //             padding: const EdgeInsets.all(10),
                    //             decoration: BoxDecoration(
                    //                 color: GetColor()
                    //                     .getColorFromHex(AppColors().orange),
                    //                 borderRadius: BorderRadius.circular(10)),
                    //             child: const Text(
                    //               "BUY NOW",
                    //               style: TextStyle(
                    //                   color: Colors.white,
                    //                   fontSize: 20,
                    //                   fontWeight: FontWeight.w800),
                    //             ),
                    //           ),
                    //         )

                    //       ]),
                    // )
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

  Widget _initialWidget() {
    var location = [
      // AppStrings.eventHint,
      "View Details",
      "Ahmedabad",
      "surat",
      "pune",
      "banglore"
    ];
    String fixVelue = "View Details";

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
              Row(
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
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
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
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "₹ 849",
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                    Row(
                      children: [
                        Container(
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
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Add",
                          style: TextStyle(
                              fontSize: 30,
                              color: GetColor()
                                  .getColorFromHex(AppColors().orange)),
                        )
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
                      focusColor: Colors.red,
                      dropdownColor: Colors.amber,
                      isExpanded: true,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                        size: 50,
                      ),
                      items: location.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
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
                  color: GetColor().getColorFromHex(AppColors().maroonColor),
                  fontSize: 25),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
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
          )
        ],
      ),
    );
  
  }
}
