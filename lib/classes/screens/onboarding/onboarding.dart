import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trust_travel/classes/bottom_bar/bottom_bar.dart';
import 'package:trust_travel/classes/screens/home/home.dart';

import '../../headers/utils/utils.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  //
  final introKey = GlobalKey<IntroductionScreenState>();
//
  void _onIntroEnd(context) async {
    //
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('onboarding_screen_see', 'yes');
    //
    Navigator.push(
      context,
      MaterialPageRoute(
          // builder: (context) => const HomeFeedScreen(),
          builder: (context) => const BottomBarScreen(specificBarIndex: 0)),
    );
  }

  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/images/4873.jpg',
      fit: BoxFit.contain,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset(
      'assets/images/$assetName',
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    //
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: false,
      autoScrollDuration: 9000,
      infiniteAutoScroll: false,
      globalHeader: const Align(
        alignment: Alignment.topRight,
        // child: SafeArea(
        //   child: Padding(
        //     padding: const EdgeInsets.only(top: 16, right: 16),
        //     child: _buildImage('flutter.png', 100),
        //   ),
        // ),
      ),
      /*globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          child: const Text(
            'Let\'s go right away!',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          onPressed: () => _onIntroEnd(context),
        ),
      ),*/
      pages: [
        // SizedBox(height: 60,),
        // PageViewModel(
        //   title: "Fractional shares",
        //   body:
        //       "Instead of having to buy an entire share, invest any amount you want.",
        //   image: _buildImage('images/login_page.png'),
        //   decoration: pageDecoration,
        // ),
        // PageViewModel(
        //   title: "Learn as you go",
        //   body:
        //       "Download the Stockpile app and master the market with our mini-lesson.",
        //   image: _buildImage('images/login_page.png'),
        //   decoration: pageDecoration,
        // ),
        /*PageViewModel(
          title: "Kids and teens",
          body:
              "Kids and teens can track their stocks 24/7 and place trades that you approve.",
          image: _buildImage('images/login_page.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "",
          body: "body",
          image: _buildFullscreenImage(),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            // bodyFlex: 2,
            // imageFlex: 3,
            // safeArea: 100,
          ),
        ),*/
        // PageViewModel(
        //   title: "Another title page",
        //   body: "Another beautiful body text for this example onboarding",
        //   image: _buildImage('images/login_page.png'),
        //   footer: ElevatedButton(
        //     onPressed: () {
        //       introKey.currentState?.animateScroll(0);
        //     },
        //     style: ElevatedButton.styleFrom(
        //       backgroundColor: Colors.lightBlue,
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(8.0),
        //       ),
        //     ),
        //     child: const Text(
        //       'FooButton',
        //       style: TextStyle(color: Colors.white),
        //     ),
        //   ),
        //   decoration: pageDecoration.copyWith(
        //     bodyFlex: 6,
        //     imageFlex: 6,
        //     safeArea: 80,
        //   ),
        // ),

        PageViewModel(
          title: "Travel with Buddies",
          bodyWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              text_regular_open(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                  Colors.black,
                  14.0),
              // Icon(Icons.edit),
              // Text(" to edit a post", style: bodyStyle),
            ],
          ),
          decoration: pageDecoration.copyWith(
            bodyFlex: 2,
            imageFlex: 4,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.topCenter,
          ),
          image: Padding(
            padding: const EdgeInsets.all(14.0),
            child: _buildImage('4873.jpg'),
          ),
          reverse: true,
        ),
        PageViewModel(
          title: "In house party",
          bodyWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              text_regular_open(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                  Colors.black,
                  14.0),
              // Icon(Icons.edit),
              // Text(" to edit a post", style: bodyStyle),
            ],
          ),
          decoration: pageDecoration.copyWith(
            bodyFlex: 2,
            imageFlex: 4,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.topCenter,
          ),
          image: _buildImage('party.jpg'),
          reverse: true,
        ),
        PageViewModel(
          title: "Party with Others",
          bodyWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              text_regular_open(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                  Colors.black,
                  14.0),
              // Icon(Icons.edit),
              // Text(" to edit a post", style: bodyStyle),
            ],
          ),
          decoration: pageDecoration.copyWith(
            bodyFlex: 2,
            imageFlex: 4,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.topCenter,
          ),
          image: Padding(
            padding: const EdgeInsets.all(12.0),
            child: _buildImage('party2.jpg'),
          ),
          reverse: true,
        ),
        PageViewModel(
          title: "Strangers Bday party",
          bodyWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              text_regular_open(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                  Colors.black,
                  14.0),
              // Icon(Icons.edit),
              // Text(" to edit a post", style: bodyStyle),
            ],
          ),
          decoration: pageDecoration.copyWith(
            bodyFlex: 2,
            imageFlex: 4,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.topCenter,
          ),
          image: _buildImage('bday_party_with_others.jpg'),
          reverse: true,
        ),
        /*PageViewModel(
          title: "Records",
          bodyWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              text_bold_comforta(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                  Colors.black,
                  14.0),
              // Icon(Icons.edit),
              // Text(" to edit a post", style: bodyStyle),
            ],
          ),
          decoration: pageDecoration.copyWith(
            bodyFlex: 2,
            imageFlex: 4,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.topCenter,
          ),
          image: _buildImage('images/login_page.png'),
          reverse: true,
        ),*/
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: text_bold_poppins('skip', Colors.black, 14.0),
      next: const Icon(Icons.arrow_forward),
      done: text_bold_poppins('done', Colors.black, 14.0),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
