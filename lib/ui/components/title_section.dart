import 'package:flutter/material.dart';
import 'package:moshel_app/core/model/farm_card.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({
    Key? key, required this.farm,
  }) : super(key: key);

  final FarmCard farm;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child:  Text(
                    farm.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kampala, Uganda',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
           Text(farm.ratings.toString()),
        ],
      ),
    );
  }
}
