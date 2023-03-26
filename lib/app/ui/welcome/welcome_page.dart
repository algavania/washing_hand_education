import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:washing_hand_education/app/routes/router.gr.dart';

import '../../common/color_values.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final SpeechToText _speechToText = SpeechToText();
  String _lastWords = '';

  /// Each time to start a speech recognition session
  void _startListening() async {
    try {
      await Permission.microphone.request();
      bool result = await _speechToText.initialize();
      debugPrint('result $result');
      if (result) {
        await _speechToText.listen(onResult: _onSpeechResult, localeId: 'id');
        debugPrint('listening ...');
      }
    } catch (_) {
      Future.delayed(const Duration(seconds: 3)).then((_) {
        AutoRouter.of(context).replace(const CountingRoute());
      });
    }
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    _lastWords = result.recognizedWords;
    debugPrint('last words $_lastWords');
    if (_lastWords.toLowerCase().contains('halo')) {
      AutoRouter.of(context).replace(const CountingRoute());
    }
    _speechToText.listen(onResult: _onSpeechResult, localeId: 'id');
    debugPrint('2 listening ...');
  }

  @override
  void initState() {
    _startListening();
    super.initState();
  }

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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: _buildBubbleWidget(ColorValues.primaryBlue,
                              true, AppLocalizations.of(context).goodMorning),
                        ),
                        Flexible(
                            child: Image.asset(
                          'assets/welcome.png',
                          fit: BoxFit.contain,
                          height: 30.h,
                        )),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                          margin: EdgeInsets.only(top: 12.h, right: 2.w),
                          child: _buildBubbleWidget(Colors.orange, false,
                              AppLocalizations.of(context).sayHello)),
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

  Container _buildBubbleWidget(Color color, bool isLeft, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 28),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(32),
            topRight: const Radius.circular(32),
            bottomRight: isLeft ? const Radius.circular(32) : Radius.zero,
            bottomLeft: isLeft ? Radius.zero : const Radius.circular(32),
          )),
      child: Text(
        text,
        style: GoogleFonts.inter(
            fontWeight: FontWeight.bold, fontSize: 16.sp, color: Colors.white),
      ),
    );
  }
}
