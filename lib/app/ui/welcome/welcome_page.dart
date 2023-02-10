import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:washing_hand_education/app/routes/router.gr.dart';

import '../../common/color_values.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            AutoRouter.of(context).replace(const CountingRoute());
          },
          child: SizedBox(
            height: 100.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 3.h),
                Center(
                  child: Image.asset(
                    'assets/logo.png',
                    height: 8.h,
                  ),
                ),
                SizedBox(height: 30.h),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 28),
                          decoration: const BoxDecoration(
                              color: ColorValues.primaryBlue,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32),
                                  topRight: Radius.circular(32),
                                  bottomRight: Radius.circular(32))),
                          child: Text(AppLocalizations.of(context).goodMorning, style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 16.sp, color: Colors.white),),
                        ),
                      ),
                      Flexible(child: Image.asset('assets/welcome.png', fit: BoxFit.contain, height: 30.h,)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
