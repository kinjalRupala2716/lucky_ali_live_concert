import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:knocksence_flutter_webapp/screens/checkout_screen.dart';
import 'package:knocksence_flutter_webapp/utils/app_string.dart';
import 'package:knocksence_flutter_webapp/utils/color.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
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
  int count = 0;

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
    List ticketName = [
      "Platinum - General Area",
      "Select Mini - Premium Area",
      "Select - VIP Area",
    ];

    bool isTicketBuy = false;
    print('$isTicketBuy kkkkkkkkkk');
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
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showBottomSheet(
                        backgroundColor: Colors.black,
                        context: context,
                        builder: (context) {
                          return _initialWidget1(count);
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      ticketName[index],
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    const Text(
                                      "Early Bird Ticket Live Now!\nFree Platinum Membership",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
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

  Widget _initialWidget1(int count) {
    var location = [
      // AppStrings.eventHint,
      "View Details",
      "Ahmedabad",
      "surat",
      "pune",
      "banglore"
    ];
    String fixVelue = "View Details";

    TextEditingController nameController = TextEditingController();
    TextEditingController numberController = TextEditingController();

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
                          count < 1
                              ? Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        count++;
                                        print("count________$count");

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
                                        print("count________$count");

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
                                        print("count________$count");

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
                                      controller: nameController,
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
                                      controller: numberController,
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
                      if (nameController.text.toString().isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please Enter Name",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else if (numberController.text.toString().isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please Enter Number",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CheckOutScreen()));
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
}
