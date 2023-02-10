import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:washing_hand_education/app/common/shared_code.dart';
import 'package:washing_hand_education/app/routes/router.gr.dart';

import '../../common/color_values.dart';

class CountingPage extends StatefulWidget {
  const CountingPage({Key? key}) : super(key: key);

  @override
  State<CountingPage> createState() => _CountingPageState();
}

class _CountingPageState extends State<CountingPage> {
  int _seconds = 5;
  late Timer _timer;

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_seconds == 0) {
          setState(() {
            timer.cancel();
          });
          AutoRouter.of(context).replace(const TutorialRoute());
        } else {
          setState(() {
            _seconds--;
          });
        }
      },
    );
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 3.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SharedCode.defaultPadding),
              child: Image.asset(
                'assets/logo.png',
                height: 8.h,
              ),
            ),
            SizedBox(height: 2.5.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SharedCode.defaultPadding),
              child: Text(AppLocalizations.of(context).washHands, style: GoogleFonts.inter(fontSize: 24.sp, fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 4.h),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                width: 100.w,
                decoration: const BoxDecoration(
                  color: ColorValues.primaryBlue,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32))
                ),
                child: Stack(
                  children: [
                    Center(child: Container(decoration: const BoxDecoration(shape: BoxShape.circle, color: ColorValues.lightBlue2), width: 100.w)),
                    Center(child: Container(decoration: const BoxDecoration(shape: BoxShape.circle, color: ColorValues.lightBlue1), width: 60.w)),
                    Center(child: Text(_seconds.toString(), style: GoogleFonts.inter(fontSize: 100.sp, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center,)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
