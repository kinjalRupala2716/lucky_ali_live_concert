import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:knocksence_flutter_webapp/utils/color.dart';

class ThankYouScreen extends StatefulWidget {
  const ThankYouScreen({super.key});

  @override
  State<ThankYouScreen> createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
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
