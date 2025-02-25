import 'package:flutter/material.dart';
import 'package:flutter_introduction_app_ard_grup/utils/themes.dart';
import 'package:progress_indicators/progress_indicators.dart';

class CustomLoadingScreen extends StatefulWidget {
  final Color? backgroundColor;
  final Color? textColor;
  CustomLoadingScreen({
    Key? key,
    this.backgroundColor = const Color.fromARGB(40, 0, 0, 0),
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  State<CustomLoadingScreen> createState() => _CustomLoadingScreenState();
}

class _CustomLoadingScreenState extends State<CustomLoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Container(
        color: widget.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeartbeatProgressIndicator(
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 8,
                    height: MediaQuery.of(context).size.height / 13,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset(
                          APPImages.splashScreen.images,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
