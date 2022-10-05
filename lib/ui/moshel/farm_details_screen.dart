import 'dart:io';

import 'package:flutter/material.dart';
import 'package:moshel_app/core/model/farm_card.dart';
import 'package:moshel_app/ui/components/button_column.dart';
import 'package:moshel_app/ui/components/title_section.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FarmerCategoryDescription extends StatelessWidget {
  const FarmerCategoryDescription({Key? key, required this.farm})
      : super(key: key);
  final FarmCard farm;

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(
            Icons.keyboard_backspace,
            color: Colors.black,
          ),
          onTap: () => Navigator.pop(context),
        ),
        title: Text(
          farm.name,
          style: const TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor:
            Theme.of(context).scaffoldBackgroundColor, // Colors.white,
      ),
      body: ListView(
        children: [
          Image.asset(
            'assets/images/${farm.image}',
            width: 600.0,
            height: 240.0,
            fit: BoxFit.cover,
          ),
          TitleSection(
            farm: farm,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                child: ButtonColumn(
                  icon: Icons.call,
                  label: 'CALL',
                  color: color,
                ),
                onTap: () => launchUrlString("tel://+256705976124"),
              ),
              InkWell(
                child: ButtonColumn(
                  icon: Icons.near_me,
                  label: 'WHATSAPP',
                  color: color,
                ),
                onTap: () => {} ,// openwhatsapp(context, '+256705976124'),
              ),
              ButtonColumn(
                icon: Icons.share,
                label: 'SHARE',
                color: color,
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 28.0, top: 20, bottom: 10),
            child: Text('ABOUT US'),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: Text(
              farm.aboutUs,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  // open whatsapp function
  openwhatsapp(BuildContext context, String whatsappNumber) async {
    var whatsappURlAndroid = "whatsapp://send?phone=$whatsappNumber&text=hello";
    var whatappURLIos =
        "https://wa.me/$whatsappNumber?text=${Uri.parse("hello")}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(Uri.parse(whatappURLIos))) {
        await launchUrl(Uri.parse(whatappURLIos));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("whatsapp no installed")));
      }
    } else {
      // android , web
      if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
        await launchUrl(Uri.parse(whatsappURlAndroid));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("whatsapp no installed")));
      }
    }
  }


  Future<void> _openUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not open $url';
    }
}
}
