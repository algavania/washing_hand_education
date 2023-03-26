import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:washing_hand_education/app/routes/router.gr.dart';

import '../../blocs/blocs.dart';
import '../../common/color_values.dart';
import '../../common/shared_code.dart';
import '../../repositories/repositories.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorValues.primaryBlue,
      body: BlocProvider(
        create: (context) =>
            HandwashBloc(RepositoryProvider.of<HandwashRepository>(context))
              ..add(const GetHandwashEvent()),
        child: BlocBuilder<HandwashBloc, HandwashState>(
          builder: (context, state) {
            if (state is HandwashError) {
              Future.delayed(Duration.zero, () {
                SharedCode.showSnackBar(context, true, state.error);
              });
            }
            if (state is HandwashRetrieved) {
              Future.delayed(const Duration(seconds: 2), () {
                AutoRouter.of(context).replace(const WelcomeRoute());
              });
            }
            return Center(
              child: Image.asset('assets/logo.png', width: 30.w),
            );
          },
        ),
      ),
    );
  }
}
