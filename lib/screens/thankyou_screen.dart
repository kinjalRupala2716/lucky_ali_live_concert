import 'package:flutter/material.dart';
import 'package:knocksence_flutter_webapp/utils/color.dart';

class ThankYouScreen extends StatefulWidget {
  const ThankYouScreen({super.key});

  @override
  State<ThankYouScreen> createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
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
        backgroundColor: Colors.black,
        title: Center(
          child: Image.asset(
            "assets/logos/KnockScenseLogoWhite2.png",
            height: MediaQuery.of(context).size.height / 7,
            width: MediaQuery.of(context).size.width / 3.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Booking Successful!",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(50),
                decoration: BoxDecoration(
                  color: GetColor().getColorFromHex(AppColors().orange),
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Ticket is Credited in your Knocksense Account",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Image.asset("assets/icons/personIcon.png"),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            "Exmple name",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Image.asset("assets/icons/phoneIcon.png"),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            "1234567890",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      )
                    ]),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Download the Knocksence App to view\nyour Ticket",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: GetColor().getColorFromHex(AppColors().orange),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "DOWNLOAD NOW",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                color: GetColor().getColorFromHex(AppColors().orange),
                child: Image.asset("assets/images/luckyaliSquare.png"),
              ),
              const SizedBox(
                height: 50,
              ),
              RotationTransition(
                turns: const AlwaysStoppedAnimation(2 / 360),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.7,
                  padding: const EdgeInsets.all(20),
                  color: Colors.white,
                  child: Text.rich(
                    TextSpan(
                      text: 'I\'m attending ',
                      style: TextStyle(
                          fontSize: 40,
                          color: GetColor().getColorFromHex(
                              AppColors().orange)), // default text style
                      children: <TextSpan>[
                        TextSpan(
                            text: 'The Indie music fest',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: GetColor()
                                    .getColorFromHex(AppColors().orange))),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: GetColor().getColorFromHex(AppColors().orange),
                ),
                child: const Text(
                  "ARE YOU???",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width / 6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      )),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Share",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 25),
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          "assets/icons/shareIcon.png",
                        )
                      ]),
                ),
              )
              // Container(child: Text("I’m attending The Indie Music Fest", style: TextStyle(color: GetColor().getColorFromHex(AppColors().orange)),),)
            ],
          ),
        ),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Center(
          child: Image.asset(
            "assets/logos/KnockScenseLogoWhite2.png",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 3.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Booking Successful!",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: GetColor().getColorFromHex(AppColors().orange),
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Ticket is Credited in your Knocksense Account",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/icons/personIcon.png",
                            height: 20,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            "Exmple name",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/icons/phoneIcon.png",
                            height: 20,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            "1234567890",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      )
                    ]),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Download the Knocksence App to view\nyour Ticket",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: GetColor().getColorFromHex(AppColors().orange),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "DOWNLOAD NOW",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 00),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: GetColor().getColorFromHex(AppColors().orange),
                  child: Image.asset("assets/images/luckyaliSquare.png"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RotationTransition(
                turns: const AlwaysStoppedAnimation(2 / 360),
                child: Container(
                  // width: MediaQuery.of(context).size.width / 1.7,
                  padding: const EdgeInsets.all(20),
                  color: Colors.white,
                  child: Text.rich(
                    TextSpan(
                      text: 'I\'m attending ',
                      style: TextStyle(
                          fontSize: 15,
                          color: GetColor().getColorFromHex(
                              AppColors().orange)), // default text style
                      children: <TextSpan>[
                        TextSpan(
                            text: 'The Indie music fest',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: GetColor()
                                    .getColorFromHex(AppColors().orange))),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: GetColor().getColorFromHex(AppColors().orange),
                ),
                child: const Text(
                  "ARE YOU???",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      )),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Share",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 20),
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          "assets/icons/shareIcon.png",
                          height: 25,
                        )
                      ]),
                ),
              )
              // Container(child: Text("I’m attending The Indie Music Fest", style: TextStyle(color: GetColor().getColorFromHex(AppColors().orange)),),)
            ],
          ),
        ),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Center(
          child: Image.asset(
            "assets/logos/KnockScenseLogoWhite2.png",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 3.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Booking Successful!",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: GetColor().getColorFromHex(AppColors().orange),
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Ticket is Credited in your Knocksense Account",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/icons/personIcon.png",
                            height: 30,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            "Exmple name",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/icons/phoneIcon.png",
                            height: 30,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            "1234567890",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ],
                      )
                    ]),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Download the Knocksence App to view\nyour Ticket",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: GetColor().getColorFromHex(AppColors().orange),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "DOWNLOAD NOW",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 00),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: GetColor().getColorFromHex(AppColors().orange),
                  child: Image.asset("assets/images/luckyaliSquare.png"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: RotationTransition(
                  turns: const AlwaysStoppedAnimation(2 / 360),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(20),
                    color: Colors.white,
                    child: Text.rich(
                      TextSpan(
                        text: 'I\'m attending ',
                        style: TextStyle(
                            fontSize: 30,
                            color: GetColor().getColorFromHex(
                                AppColors().orange)), // default text style
                        children: <TextSpan>[
                          TextSpan(
                              text: 'The Indie music fest',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: GetColor()
                                      .getColorFromHex(AppColors().orange))),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: GetColor().getColorFromHex(AppColors().orange),
                ),
                child: const Text(
                  "ARE YOU???",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      )),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Share",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 30),
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          "assets/icons/shareIcon.png",
                          height: 35,
                        )
                      ]),
                ),
              )
              // Container(child: Text("I’m attending The Indie Music Fest", style: TextStyle(color: GetColor().getColorFromHex(AppColors().orange)),),)
            ],
          ),
        ),
      ),
    );
  }
}
