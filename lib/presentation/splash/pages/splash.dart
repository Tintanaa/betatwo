import 'package:betatwo/common/helper/app_navigation.dart';
import 'package:betatwo/core/configs/assets/app_images.dart';
import 'package:betatwo/core/configs/theme/app_colors.dart';
import 'package:betatwo/presentation/splash/bloc/splash_cubit.dart';
import 'package:betatwo/presentation/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            AppNavigator.pushReplacement(context, widget);
          }

          if (state is Authenticated) {
            AppNavigator.pushReplacement(context, widget);
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AppImages.splashBackground,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.blueDarkShade.withOpacity(0),
                    AppColors.blueDarkShade,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
