import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/get_started_screen.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_textstyle.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Stack(
        children: [
          Positioned(
            left: (size.width / 2) - 180,
            top: 20,
            child: InkWell(onTap: (){
              GetStartedScreen.crashReport();
            },

              child: FaIcon(
                FontAwesomeIcons.barsStaggered,
                color: CustomColors.blackColor,
              ),
            ),
          ),
          Positioned(
            right: (size.width / 2) - 64,
            top: -60,
            child: Container(
              width: 128,
              height: 128,
              decoration: const BoxDecoration(
                color: CustomColors.primaryColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    "Lyla",
                    style: CustomTextStyle.coolWonderText.copyWith(fontSize: 40, color: CustomColors.whiteColor),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: (size.width / 2) - 180,
            top: 20,
            child: InkWell(child: SvgPicture.asset("assets/images/Profile_icon.svg"),onTap: (){
              GetStartedScreen.crashReport();
            }),
          ),

        ],
      ),
    );
  }
}
