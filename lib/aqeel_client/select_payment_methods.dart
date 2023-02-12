import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SelectPaymentMethods extends StatefulWidget {
  const SelectPaymentMethods({super.key});

  @override
  State<SelectPaymentMethods> createState() => _SelectPaymentMethodsState();
}

class _SelectPaymentMethodsState extends State<SelectPaymentMethods> {
  ScrollController scrollController = ScrollController();
  List<Map<String, dynamic>> imageList = [
    {
      "image": "taptopay",
      "name": "Tap to Pay",
    },
    {
      "image": "applepay",
      "name": "Apple Pay",
    },
    {
      "image": "manualentry",
      "name": "Manual  Entry",
    },
    {
      "image": "paypal",
      "name": "PayPal",
    },
    {
      "image": "savedcards",
      "name": "Saved Cards",
    },
    {
      "image": "samsung",
      "name": "Samsung Pay",
    },
  ];
  @override
  void initState() {
    scrollController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text(
          "Select  Payment Method",
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: APPCOLORS().kPrimaryColor,
                ),
                onPressed: () {},
                child: const Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
        backgroundColor: APPCOLORS().kDarkPurple3,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: appGradientDecoration,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 12.0,
            ),
            Divider(
              endIndent: 20,
              indent: 20,
              color: APPCOLORS().kPurple2,
              thickness: 1.5,
            ),
            const SizedBox(
              height: 6.0,
            ),
            const Text(
              "Swipe to Select Method",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Row(
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        scrollController.animateTo(
                          scrollController.position.minScrollExtent,
                          duration: const Duration(seconds: 2),
                          curve: Curves.fastOutSlowIn,
                        );
                      },
                      child: Icon(
                        Icons.arrow_left,
                        size: 40,
                        color: scrollController.positions.isEmpty
                            ? APPCOLORS().kGrey
                            : scrollController.position.pixels > 340
                                ? APPCOLORS().kPurple3
                                : APPCOLORS().kGrey,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SizedBox(
                    height: 130,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        controller: scrollController,
                        itemCount: imageList.length,
                        itemBuilder: (ctx, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              left: 14,
                              right: index == 5 ? 14 : 0,
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                    "assets/images/${imageList[index]["image"]}.png"),
                                const SizedBox(
                                  height: 12.0,
                                ),
                                Text(
                                  imageList[index]["name"],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        scrollController.animateTo(
                          scrollController.position.maxScrollExtent,
                          duration: const Duration(seconds: 2),
                          curve: Curves.fastOutSlowIn,
                        );
                      },
                      child: Icon(
                        Icons.arrow_right,
                        size: 40,
                        color: APPCOLORS().kPurple3,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 12.0,
            ),
            Center(
              child: DotsIndicator(
                dotsCount: 2,
                position: scrollController.positions.isEmpty
                    ? 0
                    : scrollController.position.pixels > 340
                        ? 1
                        : 0,
                decorator: DotsDecorator(
                  color: APPCOLORS().kGrey, // Inactive color
                  activeColor: APPCOLORS().kGreen2,
                ),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      APPCOLORS().kDarkPurple,
                      APPCOLORS().kDarkPurple2,
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 6.0,
                    ),
                    const Text(
                      "Tap to Pay",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Add to Balance",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              const Text(
                                "USD",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "\$",
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: APPCOLORS().kPurple4,
                                ),
                              ),
                              const Text(
                                "267",
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                        onTap: () {
                          showFancyCustomDialog(context);
                        },
                        child: Image.asset("assets/images/holdcard.png")),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      "Tap & Hold Card on Back",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    SvgPicture.asset("assets/images/payments.svg"),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showFancyCustomDialog(BuildContext context) {
    Dialog fancyDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: 210.0,
        width: 350.0,
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 210,
              decoration: BoxDecoration(
                color: APPCOLORS().kDarkPurple6,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                children: [
                  const Text(
                    "Select  Entry Method",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 18.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.asset("assets/images/scancard.png"),
                            const SizedBox(
                              height: 6.0,
                            ),
                            Row(
                              children: const [
                                Text(
                                  "Scan Card",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 11.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 6.0,
                                ),
                                Text(
                                  "(fastest)",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 11.0,
                                    color: Color(0xff28750D),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 50.0,
                              width: 1.0,
                              color: Colors.white,
                              margin: const EdgeInsets.only(bottom: 6.0),
                            ),
                            const Text(
                              "OR",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 6.0),
                              height: 50.0,
                              width: 1.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset("assets/images/typecard.png"),
                            const SizedBox(
                              height: 6.0,
                            ),
                            const Text(
                              "Type  Card Details",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        
                      ],
                    ),
                  ),
                  const SizedBox(height: 6.0,),
                  DotsIndicator(
                    dotsCount: 3,
                    position: 0,
                    decorator: DotsDecorator(
                      color: APPCOLORS().kBlack, // Inactive color
                      activeColor: APPCOLORS().kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              // These values are based on trial & error method
              alignment: const Alignment(1.05, -1.05),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: APPCOLORS().kPrimaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => fancyDialog);
  }
}

class APPCOLORS {
  //////kPurple
  Color kPrimaryColor = const Color(0xff8B25DA);
  Color kPurple1 = const Color(0xffAE67E5);
  Color kPurple2 = const Color(0xff3C146B);
  Color kPurple3 = const Color(0xff6020AC);
  Color kPurple4 = const Color(0xff9353DF);
  Color kPurple5 = const Color(0xff481881);
  Color kPurple6 = const Color(0xff541C96);
  Color kPurple7 = const Color(0xff3C146C);
  Color kPurple8 = const Color(0xff7C28D7);
  Color kPurple9 = const Color(0xff7828D7);
  Color kPurple10 = const Color(0xff4E1A8C);
//////kLightPurple
  Color kLightPurple1 = const Color(0xffC9A9EF);
  Color kLightPurple2 = const Color(0xffC592EC);
  Color kLightPurple3 = const Color(0xffF3E9FB);
  Color kLightPurple = const Color(0xffB97CE9);
  Color kLightPurple4 = const Color(0xffE8D3F8);
////kDarkPurple
  Color kDarkPurple = const Color(0xff45136D);
  Color kDarkPurple2 = const Color(0xff28156A);
  Color kDarkPurple3 = const Color(0xff19082b);
  Color kDarkPurple1 = const Color(0xff301056);
  Color kDarkPurple4 = const Color(0xff0E052E);
  Color kDarkPurple5 = const Color(0xff240C40);
  Color kDarkPurple6 = const Color(0xff290E49);
  Color kDarkPurple7 = const Color(0xff3C156B);
  Color kDarkPurple8 = const Color(0xff240C41);
////kDarkPurple
  Color kWhite = const Color(0xffFFFFFF);
  Color kGrey = const Color(0xff808080);
  Color kGrey1 = const Color(0xffBFBFBF);
  Color kGrey2 = const Color(0xff484848);
  Color kGrey3 = const Color(0xff8C8C8C);
  Color kGrey4 = const Color(0xff777B88);
  Color kGrey5 = const Color(0xffCCCCCC);
  Color kBlue = const Color(0xff0B4DF8);
  Color kBlue2 = const Color(0xff0812FC);
  Color kblue1 = const Color(0xff502AD5);
  Color kGreen = const Color(0xff80E567);
  Color kGreen2 = const Color(0xff2D7B08);
  Color kGreen3 = const Color(0xff26E12E);
  Color kGreen1 = const Color(0xff45BA77);
  Color kGreen4 = const Color(0xff30C46F);
  Color kRed = const Color(0xffFF4C4D);
  Color kRed1 = const Color(0xffD84D4D);
  Color kBlack = const Color(0xff000000);
}

Gradient appGradientDecoration = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    APPCOLORS().kDarkPurple3,
    APPCOLORS().kDarkPurple4,
  ],
);

Gradient appBTNGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.topRight,
  colors: [
    APPCOLORS().kblue1,
    APPCOLORS().kPurple7,
  ],
);
