import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_textstyle.dart';
import '../models/additional_cover.dart';

class ExpandedCard extends StatefulWidget {
  const ExpandedCard({
    super.key,
    required this.titleText,
    required this.subTitleText,
    required this.onTap,
    required this.price,
    required this.coverList,
    required this.secondTitleText,
    required this.secondSubtitleText,
    required this.firstScreen,
  });

  final String titleText;
  final String subTitleText;
  final void Function()? onTap;
  final String price;
  final String secondTitleText;
  final String secondSubtitleText;
  final List<AdditionalCover> coverList;
  final bool firstScreen;

  @override
  State<ExpandedCard> createState() => _ExpandedCardState();
}

class _ExpandedCardState extends State<ExpandedCard> {
  int selectedIndex = -1;
  late List<AdditionalCover> myList;
  late List<bool> booleanList;

  @override
  void initState() {
    myList = widget.coverList;
    booleanList = List.generate(widget.coverList.length, (_) => true);
    super.initState();
  }

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
            height: 950,
            decoration: const BoxDecoration(
              color: CustomColors.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(28, 21, 0, 0),
                  child: Text(
                    widget.titleText,
                    style: CustomTextStyle.interText.copyWith(fontSize: 24, color: CustomColors.whiteColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(28, 8, 0, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.subTitleText,
                          style: CustomTextStyle.interText.copyWith(fontSize: 16, color: CustomColors.whiteColor),
                        ),
                      ),
                      Material(
                        elevation: 5,
                        color: CustomColors.whiteColor,
                        borderRadius: const BorderRadius.all(Radius.circular(11)),
                        child: Container(
                          height: 52,
                          width: 52,
                          decoration: const BoxDecoration(
                            color: CustomColors.whiteColor,
                            borderRadius: BorderRadius.all(Radius.circular(11)),
                          ),
                          child: IconButton(
                            icon: const FaIcon(
                              FontAwesomeIcons.angleUp,
                              color: CustomColors.primaryColor,
                            ),
                            onPressed: widget.onTap,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 29,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(28, 46, 0, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.secondTitleText,
                          style: CustomTextStyle.interText.copyWith(fontSize: 20, color: CustomColors.whiteColor),
                        ),
                      ),
                      const SizedBox(
                        width: 29,
                      ),
                    ],
                  ),
                ),
                widget.firstScreen
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(28, 11, 0, 0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.secondSubtitleText,
                                style: CustomTextStyle.interText.copyWith(fontSize: 16, color: CustomColors.whiteColor),
                              ),
                            ),
                            const SizedBox(
                              width: 29,
                            ),
                          ],
                        ),
                      )
                    : Container(),
                widget.firstScreen
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(28, 19, 28, 0),
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.fromLTRB(28, 15, 0, 0),
                          decoration: BoxDecoration(
                            color: CustomColors.darkBlue,
                            border: Border.all(color: CustomColors.primaryColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: TextFormField(
                            style: CustomTextStyle.interText.copyWith(color: CustomColors.whiteColor, fontSize: 14),
                            decoration: InputDecoration.collapsed(
                                hintText: "Enter countries",
                                hintStyle: CustomTextStyle.interText.copyWith(color: CustomColors.whiteColor, fontSize: 14)),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.fromLTRB(28, 19, 28, 0),
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.fromLTRB(28, 15, 10, 0),
                          decoration: BoxDecoration(
                            color: CustomColors.darkBlue,
                            border: Border.all(color: CustomColors.primaryColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: DropdownButtonFormField(
                            dropdownColor: CustomColors.primaryColor,
                            icon: const FaIcon(
                              FontAwesomeIcons.angleDown,
                              color: CustomColors.whiteColor,
                            ),
                            style: CustomTextStyle.interText.copyWith(color: CustomColors.whiteColor, fontSize: 14),
                            decoration: InputDecoration.collapsed(
                                hintText: "Select Destination",
                                hintStyle: CustomTextStyle.interText.copyWith(color: CustomColors.whiteColor, fontSize: 14)),
                            items: const [
                              DropdownMenuItem(
                                child: Text("Item 1"),
                                value: "1",
                              ),
                              DropdownMenuItem(
                                child: Text("Item 2"),
                                value: "2",
                              )
                            ],
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 52, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: myList
                          .map((data) => SizedBox(
                                height: 50,
                                child: RadioListTile(
                                  title: Text(
                                    data.name,
                                    style: CustomTextStyle.interText.copyWith(fontSize: 13, color: CustomColors.whiteColor),
                                  ),
                                  toggleable: true,
                                  groupValue: booleanList[data.index - 1],
                                  value: data.isSelected,
                                  selected: booleanList[data.index - 1],
                                  tileColor: Colors.white,
                                  activeColor: Colors.white,
                                  selectedTileColor: Colors.white,
                                  onChanged: (val) {
                                    setState(() {
                                      booleanList[data.index - 1] = !booleanList[data.index - 1];
                                    });
                                  },
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                "from\n\$${widget.price}",
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
