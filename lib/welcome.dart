import 'package:caperr/main.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

import 'login.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  late Material materialButton;
  late int index;

  //Onboarding Seiten
  final onboardingPagesList = [

    //Erste Seite: Willkommen
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xFFF3B7BC),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [

              const SizedBox(height:20),

              Image.asset('assets/images/CapeTownRentRide.jpg'),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Willkommen',
                    style: pageTitleStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Entdecke jetzt deine Möglichkeiten wie du deinen Aufenthalt in Kapstadt unvergesslich machen kannst!',
                    style: pageInfoStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),

    //Zweite Seite: Südafrika
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xFFF3B7BC),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [

              const SizedBox(height:30),

              Image.asset('assets/images/flag.svg.png'),
              const SizedBox(height:25),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Erfahre mehr über die Kultur Südafrikas!',
                    style: pageTitleStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Entdecke jetzt deine Möglichkeiten wie du deinen Aufenthalt in Kapstadt unvergesslich machen kannst!',
                    style: pageInfoStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),

    //Erste Seite: Wir
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xFFF3B7BC),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [

              const SizedBox(height:40),

              Image.asset('assets/images/wir.jpeg'),
              const SizedBox(height:25),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Plane noch heute deine unvergessliche Tour mit uns!',
                    style: pageTitleStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Entdecke jetzt deine Möglichkeiten wie du deinen Aufenthalt in Kapstadt unvergesslich machen kannst!',
                    style: pageInfoStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const SizedBox(height:50),
            ],
          ),
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
  }

  //Skip Button
  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      // Styling
      borderRadius: defaultSkipButtonBorderRadius,
      color: Colors.white,
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        //Funktion wenn gedrückt
        onTap: () {
          if (setIndex != null) {
            index = 2;
            setIndex(2); //Index wird auf 2 gesetzt -> letzte Seite
          }
        },

        child: const Padding(
          padding: defaultSkipButtonPadding,
          child: Text(
            'Skip',
            style: TextStyle(
                color: Color(0xFFF3B7BC)
            ),
          ),
        ),
      ),
    );
  }

  //Signup Button
  Material get _signupButton {
    return Material(
      // Styling

    borderRadius: defaultProceedButtonBorderRadius,
      color: Colors.white,
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        //Funktion wenn gedrückt
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginClass()), //Routing zur Login Seite
          );
        },
        child: const Padding(
          padding: defaultProceedButtonPadding,
          child: Text(
            'Sign up',
            style: TextStyle(
                color: Color(0xFFF3B7BC)
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Onboarding(
          pages: onboardingPagesList,
          onPageChange: (int pageIndex) {
            index = pageIndex;
          },
          startPageIndex: 0, // Erste Seite
          footerBuilder: (context, dragDistance, pagesLength, setIndex) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xFFF3B7BC),
                border: Border.all(
                  width: 0.0,
                  color: Color(0xFFF3B7BC),
                ),
              ),

              //Allgemeines Styling der Seiten
              child: ColoredBox(
                color: Color(0xFFF3B7BC),
                child: Padding(
                  padding: const EdgeInsets.all(45.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIndicator(
                          netDragPercent: dragDistance,
                          pagesLength: pagesLength,
                          indicator: Indicator(
                            indicatorDesign: IndicatorDesign.polygon(
                              polygonDesign: PolygonDesign(
                                polygon: DesignType.polygon_circle,
                              ),
                            ),
                          )
                      ),
                      index == pagesLength - 1
                          ? _signupButton
                          : _skipButton(setIndex: setIndex)
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
