import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/custom_colors.dart';
import '../utils/custom_textstyle.dart';

class CollapsedCard extends StatelessWidget {
  const CollapsedCard({
    super.key,
    required this.titleText,
    required this.subTitleText,
    required this.onTap,
    required this.price,
  });

  final String titleText;
  final String subTitleText;
  final void Function()? onTap;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Material(
          elevation: 5,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: Container(
            width: double.infinity,
            height: 150,
            decoration: const BoxDecoration(
              color: CustomColors.whiteColor,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(28, 21, 0, 0),
                  child: Text(
                    titleText,
                    style: CustomTextStyle.interText.copyWith(fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(28, 8, 0, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          subTitleText,
                          style: CustomTextStyle.interText.copyWith(fontSize: 16),
                        ),
                      ),
                      Material(
                        elevation: 5,
                        color: CustomColors.primaryColor,
                        borderRadius: const BorderRadius.all(Radius.circular(11)),
                        child: Container(
                          height: 52,
                          width: 52,
                          decoration: const BoxDecoration(
                            color: CustomColors.primaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(11)),
                          ),
                          child: IconButton(
                            icon: const FaIcon(
                              FontAwesomeIcons.angleDown,
                              color: CustomColors.whiteColor,
                            ),
                            onPressed: onTap,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 29,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 20,
          top: -50,
          child: Container(
            width: 84,
            height: 84,
            decoration: const BoxDecoration(
              color: CustomColors.secondaryColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                "from\n\$$price",
                textAlign: TextAlign.center,
                style: CustomTextStyle.larkenTextItalic.copyWith(
                  fontSize: 20,
                  color: CustomColors.whiteColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
