import 'package:crawllet/Components/main_component.dart';
import 'package:crawllet/Theme/font_sizes.dart';
import 'package:crawllet/Theme/main_colors.dart';
import 'package:crawllet/utils/api_call.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CryptoRatesScreen extends StatefulWidget {
  const CryptoRatesScreen({super.key});

  @override
  State<CryptoRatesScreen> createState() => _CryptoRatesScreenState();
}

class _CryptoRatesScreenState extends State<CryptoRatesScreen> {
  dynamic data;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    try {
      dynamic dat = await ApiCall().fetchCryptoData();

      if (mounted) {
        setState(() {
          data = dat;
        });
      }
    } catch (e) {
      Get.snackbar("Error", "Internet Connection Not available");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: MainColors.foregroundColor,
        body: MainComponent(
          widget: SizedBox(
            width: size.width,
            height: size.height,
            child: SingleChildScrollView(
              child: data != null
                  ? ListView.builder(
                      itemCount: data["rates"].length,
                      itemBuilder: (context, index) {
                        if (index != 0) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 20.0, left: 10.0),
                                  child: Text(
                                    "All Cryptos",
                                    style: TextStyle(
                                        fontSize: FontSizes.headingSize,
                                        fontFamily: "Harlow",
                                        color: MainColors.headingColor),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Container(
                                    height: 100,
                                    width: size.width * 0.8,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: MainColors.boxFillColor,
                                        borderRadius:
                                            BorderRadius.circular(14.0)),
                                    child: Row(
                                      children: [
                                         Text(
                                          "${data[index]["name"]}",
                                          style: TextStyle(
                                              color: MainColors.headingColor,
                                              fontSize: FontSizes.lg,
                                              fontFamily: "rockwell"),
                                        ),
                                        Text(
                                          "${data[index]["price_usd"]}",
                                          style: TextStyle(
                                              color: MainColors.textColor,
                                              fontSize: FontSizes.lg,
                                              fontFamily: "rockwell"),
                                        ),
                                      ],
                                    )),
                              )
                            ],
                          );
                        } else {
                          return const Spacer();
                        }
                      })
                  : Center(
                      child: CircularProgressIndicator(
                      color: MainColors.backgroundColors,
                    )),
            ),
          ),
        ));
  }
}
