import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../core/utils/apps_strings.dart';

class GlassMorphism extends StatelessWidget {
  final int? id;
  final String? name;
  final String? image;
  final String? status;
  final String? gender;
  final String? location;

  const GlassMorphism({
    super.key,
    this.id,
    this.name,
    this.image,
    this.status,
    this.gender,
    this.location,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GlassmorphicContainer(
        blur: 1,
        height: 150,
        width: size.width,
        border: 1,
        borderRadius: 16,
        borderGradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blueAccent, Colors.yellowAccent],
        ),
        linearGradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Colors.transparent, Colors.white30],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  image!,
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '#$id - $name',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Status: ${_switchStatus(status)} ',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        _switchStatusLife(status),
                      ],
                    ),
                    Text(
                      'Genero: ${_switchGender(gender)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Ultima localização:\n$location',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
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

  Widget _switchStatusLife(String? status) {
    switch (status) {
      case 'Alive':
        return const Icon(
          MdiIcons.circleMedium,
          color: Colors.greenAccent,
        );
      case 'Dead':
        return const Icon(
          MdiIcons.circleMedium,
          color: Colors.redAccent,
        );
      default:
        return const Icon(
          MdiIcons.circleMedium,
          color: Colors.grey,
        );
    }
  }
}
