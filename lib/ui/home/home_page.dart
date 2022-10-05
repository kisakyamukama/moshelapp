import 'package:flutter/material.dart';
import 'package:moshel_app/core/model/farm_card.dart';
import 'package:moshel_app/ui/moshel/farm_details_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static String magavigAboutUs = 'Megavig limited is located in Tororo, Uganda with branches in various places. It owns an apiary and extracts bee wax from the natural bees. Products here include honey, bee wax.';
  static String naturalFruitAboutUs =  " Natural Fruits Farm is located Kampala, Uganda with branches in various places. It deals with a network of farmers in different regions to supply markets within and abroad. Products enjoyed here include honey, bee wax, fruits.";
  static String moshelFarmAboutUs = " Moshel Traders is located Kampala, Uganda with branches in various places. It deals with a network of farmers in different regions to supply markets within and abroad. Products enjoyed here include honey, bee wax, fruits.";
  static String siwaFarmAboutUs = " Siwa Traders is located Tororo, Uganda with branches in various places.  It has an orchard with certain fruits grown for commercial purposes to supply markets within and abroad. Products here include fruits like Pineapples, Avocadoes, Oranges, Passionfruits.";
  List<FarmCard> farmerCategories = [
    FarmCard(name: 'Megavig', image: 'fruitFarm.jpeg', aboutUs: magavigAboutUs, ratings: 86),
    FarmCard(
        name: 'Natural Fruits',
        image: 'honeyFarm.jpeg',
        aboutUs: naturalFruitAboutUs, ratings: 23),
    FarmCard(
        name: 'Moshel farm',
        image: 'processedHoney.jpg',
        aboutUs: moshelFarmAboutUs, ratings: 45),
    FarmCard(
        name: 'Siwa Farm', image: 'honeyCup.jpeg', aboutUs: siwaFarmAboutUs, ratings: 80)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Moshel App',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: farmerCategories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => FarmerCategoryDescription(
                        farm: farmerCategories[index])),
                  )),
              child: Card(
                  child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/${farmerCategories[index].image}',
                    width: 600.0,
                    height: 240.0,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 10,
                    child: Text(
                      farmerCategories[index].name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                  ),
                ],
              )),
            );
          },
        ),
      ),
    );
  }
}
