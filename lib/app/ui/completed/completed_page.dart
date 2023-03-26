import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../common/color_values.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Center(
                          child: _buildBubbleWidget(ColorValues.primaryBlue, AppLocalizations.of(context).completedText),
                        ),
                        SizedBox(height: 3.h),
                        Flexible(
                            child: Image.asset(
                              'assets/completed.png',
                              fit: BoxFit.contain,
                              height: 30.h,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildBubbleWidget(Color color, String text) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 28),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(32),
            topRight: const Radius.circular(32),
            bottomRight: Radius.zero,
            bottomLeft: const Radius.circular(32),
          )),
      child: Text(
        text,
        style: GoogleFonts.inter(
            fontWeight: FontWeight.bold, fontSize: 16.sp, color: Colors.white),
      ),
    );
  }}
