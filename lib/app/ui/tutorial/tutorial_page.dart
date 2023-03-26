import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sizer/sizer.dart';
import 'package:washing_hand_education/app/common/shared_code.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../data/models/step_model.dart';
import '../../blocs/blocs.dart';
import '../../common/color_values.dart';
import '../../repositories/repositories.dart';
import '../../routes/router.gr.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  int _index = -1;

  @override
  Widget build(BuildContext context) {
    List<StepModel> steps = [
      StepModel(text: AppLocalizations.of(context).tutorial1, state: false),
      StepModel(
          text: AppLocalizations.of(context).tutorial2,
          state: true,
          duration: 20,
          fontSize: 20.sp,
      ),
      StepModel(text: AppLocalizations.of(context).tutorial3, state: false),
      StepModel(text: AppLocalizations.of(context).tutorial4, state: true),
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: ColorValues.primaryBlue,
      ),
      body: BlocProvider(
        create: (context) => HandwashBloc(RepositoryProvider.of<HandwashRepository>(context))..add(const UpdateHandwashStateEvent(true)),
        child: BlocBuilder<HandwashBloc, HandwashState>(
          builder: (context, state) {
            if (state is HandwashLoading || state is HandwashInitial) {
              context.loaderOverlay.show();
              return Container();
            }
            if (state is HandwashError) {
              context.loaderOverlay.hide();
              Future.delayed(Duration.zero, () {
                SharedCode.showSnackBar(context, true, state.error);
              });
            }
            if (state is HandwashRetrieved) {
              context.loaderOverlay.hide();
              _index++;
              debugPrint('index $_index');
              if (_index < steps.length) {
                Future.delayed(Duration(seconds: steps[_index].duration), () {
                  debugPrint('step name ${steps[_index].text}, state ${steps[_index].state}');
                  BlocProvider.of<HandwashBloc>(context).add(UpdateHandwashStateEvent(steps[_index].state));
                });
              }
            }
            if (_index >= steps.length) {
              Future.delayed(Duration.zero, () {
                AutoRouter.of(context).replace(const CompletedRoute());
              });
              return Container();
            } else {
              return _buildBody(steps[_index == -1 ? 0 : _index]);
            }
          },
        ),
      ),
    );
  }

  Widget _buildBody(StepModel stepModel) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: 100.w,
          padding: EdgeInsets.all(SharedCode.defaultPadding),
          decoration: const BoxDecoration(
              color: ColorValues.primaryBlue,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(32),
                  bottomLeft: Radius.circular(32))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/logo-white.png',
                height: 8.h,
              ),
              SizedBox(height: 2.5.h),
              Expanded(
                child: AutoSizeText(
                  stepModel.text,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: stepModel.fontSize ?? 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5.h),
        Expanded(child: Image.asset('assets/tutorial-${_index+1}.png', width: 100.w, fit: BoxFit.fill,))
      ],
    );
  }
}
