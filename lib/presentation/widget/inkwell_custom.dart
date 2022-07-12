import 'package:flutter/material.dart';

class InkWellCustom extends StatelessWidget {
  final String? image;
  final String? title;
  final int? id;
  final VoidCallback? onTap;
  const InkWellCustom({Key? key, this.image, this.title, this.id, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      splashColor: Colors.green,
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Image.network(
              image!,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            '#$id - $title!',
            style: const TextStyle(fontSize: 18, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 6,
          )
        ],
      ),
    );
  }
}
