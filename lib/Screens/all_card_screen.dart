// ignore_for_file: file_names

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:crawllet/Components/main_component.dart';
import 'package:crawllet/Theme/font_sizes.dart';
import 'package:crawllet/Theme/main_colors.dart';
import 'package:crawllet/Theme/spacing.dart';
import 'package:crawllet/utils/api_call.dart';
import 'package:crawllet/utils/firebase_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../Models/firebase_card_model.dart';

class AllCards extends StatefulWidget {
  const AllCards({Key? key}) : super(key: key);

  @override
  State<AllCards> createState() => _AllCardsState();
}

class _AllCardsState extends State<AllCards> {
  bool loading = false;
  TextEditingController cardName = TextEditingController();
  TextEditingController cardExp = TextEditingController();
  TextEditingController cardNum = TextEditingController();
  TextEditingController cardCompany = TextEditingController();
  TextEditingController cardVCS = TextEditingController();
  dynamic cardData;
  @override
  void initState() {
    super.initState();

    getFirestoreData();
  }

  getFirestoreData() async {
    dynamic carddat = await FirebaseFunctions().getUserCardData();
    if (mounted) {
      setState(() {
        cardData = carddat;
      });
    }
    print(carddat);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MainColors.foregroundColor,
      body: MainComponent(
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 10.0),
                  child: Text(
                    " Cards ",
                    style: TextStyle(
                        fontSize: FontSizes.headingSize,
                        fontFamily: "Harlow",
                        color: MainColors.headingColor),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0, left: 10.0),
              child: Text(
                " All Cards ",
                style: TextStyle(
                    fontSize: FontSizes.headingSize,
                    fontFamily: "Harlow",
                    color: MainColors.backgroundColors),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: Spacing.md),
                    child: TextButton(
                      onPressed: () {
                        showBottomSheet();
                      },
                      child: Container(
                        height: 180,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                            color: MainColors.boxFillColor,
                            borderRadius: BorderRadius.circular(14.0)),
                        child: Icon(
                          Icons.add,
                          size: FontSizes.md,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textField(TextEditingController control, String text,
      TextInputType val, int maxlines) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: TextField(
        controller: control,
        maxLines: maxlines,
        keyboardType: val,
        style: TextStyle(
            fontFamily: "rockwell",
            fontSize: FontSizes.md,
            color: MainColors.foregroundColor),
        decoration: InputDecoration(
            hintText: text,
            hintStyle: TextStyle(
                fontFamily: "rockwell",
                fontSize: FontSizes.sm,
                color: MainColors.foregroundColor.withOpacity(0.5)),
            contentPadding: EdgeInsets.symmetric(horizontal: Spacing.sm),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.0),
                borderSide: BorderSide(color: MainColors.foregroundColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.0),
                borderSide: BorderSide(color: MainColors.foregroundColor))),
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context,
      ScrollController scrollController, double bottomSheetOffset) {
    return Column(
      children: [
        SizedBox(
            width: 300,
            child: textField(
                cardName, "Enter Card Holder's Name", TextInputType.name, 64)),
        SizedBox(
            width: 300,
            child: textField(
                cardNum, "Enter Card Number", TextInputType.number, 14)),
        SizedBox(
            width: 300,
            child: textField(
                cardCompany, "Enter Card Company", TextInputType.name, 64)),
        Row(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SizedBox(
              width: 150,
              child: textField(
                  cardExp, "Enter Card Expiry", TextInputType.datetime, 64),
            ),
          ),
          SizedBox(
            width: 150,
            child: textField(
                cardVCS, "Enter Card's Hidden Code", TextInputType.number, 3),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: TextButton(
              style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(60, 20),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  alignment: Alignment.centerLeft),
              onPressed: () async {
                try {
                  if (cardName.text.isNotEmpty &&
                      cardCompany.text.isNotEmpty &&
                      cardExp.text.isNotEmpty &&
                      cardVCS.text.isNotEmpty &&
                      cardNum.text.isNotEmpty) {
                    setState(() {
                      loading = true;
                    });
                    await FirebaseFunctions().addDatatoFirestore(CardModel(
                        cardName.text.trim(),
                        cardNum.text.trim(),
                        cardCompany.text.trim(),
                        cardExp.text.trim(),
                        cardVCS.text.trim()));
                  }
                } catch (e) {
                  Get.snackbar("Error Occurred", " Please Try Again ");
                  setState(() {
                    loading = false;
                  });
                }
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: loading
                        ? MainColors.drawingFillColor
                        : MainColors.foregroundColor,
                    borderRadius: BorderRadius.circular(14)),
                child: Center(
                  child: loading
                      ? Image.asset("assets/gifs/loading.gif")
                      : Text(
                          "Submit",
                          style: TextStyle(
                              fontFamily: "harlow",
                              fontSize: FontSizes.lg,
                              color: MainColors.headingColor),
                        ),
                ),
              )),
        ),
      ],
    );
  }

  showBottomSheet() {
    return showMaterialModalBottomSheet(
        enableDrag: true,
        backgroundColor: MainColors.backgroundColors,
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              children: [
                SizedBox(
                    width: 300,
                    child: textField(cardName, "Enter Card Holder's Name",
                        TextInputType.name, 64)),
                SizedBox(
                    width: 300,
                    child: textField(cardNum, "Enter Card Number",
                        TextInputType.number, 14)),
                SizedBox(
                    width: 300,
                    child: textField(cardCompany, "Enter Card Company",
                        TextInputType.name, 64)),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: SizedBox(
                      width: 150,
                      child: textField(cardExp, "Enter Card Expiry",
                          TextInputType.datetime, 64),
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    child: textField(cardVCS, "Enter Card's Hidden Code",
                        TextInputType.number, 3),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: TextButton(
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(60, 20),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          alignment: Alignment.centerLeft),
                      onPressed: () async {
                        try {
                          if (cardName.text.isNotEmpty &&
                              cardCompany.text.isNotEmpty &&
                              cardExp.text.isNotEmpty &&
                              cardVCS.text.isNotEmpty &&
                              cardNum.text.isNotEmpty) {
                            setState(() {
                              loading = true;
                            });
                            await FirebaseFunctions().addDatatoFirestore(
                                CardModel(
                                    cardName.text.trim(),
                                    cardNum.text.trim(),
                                    cardCompany.text.trim(),
                                    cardExp.text.trim(),
                                    cardVCS.text.trim()));
                          }
                        } catch (e) {
                          Get.snackbar("Error Occurred", " Please Try Again ");
                          setState(() {
                            loading = false;
                          });
                        }
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: loading
                                ? MainColors.drawingFillColor
                                : MainColors.foregroundColor,
                            borderRadius: BorderRadius.circular(14)),
                        child: Center(
                          child: loading
                              ? Image.asset("assets/gifs/loading.gif")
                              : Text(
                                  "Submit",
                                  style: TextStyle(
                                      fontFamily: "harlow",
                                      fontSize: FontSizes.lg,
                                      color: MainColors.headingColor),
                                ),
                        ),
                      )),
                ),
              ],
            ),
          );
        });
  }
}
