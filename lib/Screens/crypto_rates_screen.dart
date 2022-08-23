import 'package:crawllet/Theme/main_colors.dart';
import 'package:crawllet/utils/api_call.dart';
import 'package:flutter/material.dart';

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
    dynamic dat = await ApiCall().fetchCryptoData();

    if (mounted) {
      setState(() {
        data = dat;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: MainColors.foregroundColor,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: ListView.builder(
                itemCount: data["rates"].length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      
                     ],
                  );
                }),
          ),
        ));
  }
}
