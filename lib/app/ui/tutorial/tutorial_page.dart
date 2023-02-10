import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:washing_hand_education/app/common/shared_code.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../common/color_values.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: ColorValues.primaryBlue,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: 100.w,
              padding: EdgeInsets.all(SharedCode.defaultPadding),
              decoration: const BoxDecoration(
                color: ColorValues.primaryBlue,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(32), bottomLeft: Radius.circular(32))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/logo-white.png',
                    height: 8.h,
                  ),
                  SizedBox(height: 2.5.h),
                  Text(AppLocalizations.of(context).tutorial1, style: GoogleFonts.inter(color: Colors.white, fontSize: 24.sp, fontWeight: FontWeight.bold,),),
                ],
              ),
            ),
            const Spacer(),
            Image.asset('assets/tutorial-1.png')
          ],
        ),
      ),
    );
  }
}
