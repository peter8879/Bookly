import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/features/Splash/presentation/views/widgets/sliding_text.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>with SingleTickerProviderStateMixin {
  late AnimationController animationController;
   late Animation<Offset> slidingAnimation;
  @override
  void initState() {

    super.initState();
    initSlidingAnimation();
    navigateToHome();

  }


  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Image(
          image: AssetImage(
           AssetsData.logo
          ),
        ),
       const SizedBox(height: 4.0,),
        SlidingText(slidingAnimation: slidingAnimation),

      ],
    );
  }
  void navigateToHome() {
    Future.delayed(
        const Duration(seconds: 3),
            (){
          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
        }
    );
  }

  void initSlidingAnimation() {
    animationController=AnimationController(
      vsync:this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation=Tween<Offset>(
        begin: const Offset(
            0,
            2

        ),
        end: Offset.zero

    ).animate(animationController);
    animationController.forward();
  }
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
}


