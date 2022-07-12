import 'package:flutter/material.dart';

import '../../core/utils/apps_strings.dart';

class CardCustom extends StatelessWidget {
  final int? id;
  final String? name;
  final String? image;
  final String? status;
  final String? gender;

  const CardCustom({
    Key? key,
    this.id,
    this.name,
    this.image,
    this.status,
    this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.green[400]?.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                image!,
                height: MediaQuery.of(context).size.height,
                width: 150,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 35, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 90,
                  child: Text(
                    name!,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text('Status: ${_switchStatus(status)}'),
                const SizedBox(height: 5),
                Text('Genero: ${_switchGender(gender)}'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _switchStatus(String? status) {
    switch (status) {
      case 'Alive':
        return AppsStrings.alive;
      case 'Dead':
        return AppsStrings.dead;
      case 'unknown':
        return AppsStrings.unknown;
      default:
        return '';
    }
  }

  String _switchGender(String? gender) {
    switch (gender) {
      case 'Female':
        return AppsStrings.female;
      case 'Male':
        return AppsStrings.male;
      default:
        return '';
    }
  }
}
