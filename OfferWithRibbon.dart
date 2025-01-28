import 'package:flutter/material.dart';

///A small Container with a title and a ribbon in the top right corner, has a slight 3D effect
class OfferWithRibbon extends StatelessWidget {
  const OfferWithRibbon(
      {super.key, required this.title, required this.offerText});

  ///The main text on the ribbon
  final String title;
  ///The text on the ribbon in the corner
  final String offerText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        _buildRotatedBox(
            top: -2, right: 45, angle: 0.75, color: Colors.red.shade900),
        _buildRotatedBox(
            top: 44, right: -2, angle: 0.75, color: Colors.red.shade900),
        _buildOfferContainer(context),
        _buildRibbon(context),
      ],
    );
  }

  Widget _buildRotatedBox(
      {required double top,
      required double right,
      required double angle,
      required Color color}) {
    return Positioned(
      top: top,
      right: right,
      child: Transform.rotate(
        angle: angle,
        child: Container(
          height: 10,
          width: 10,
          color: color,
        ),
      ),
    );
  }

  Widget _buildOfferContainer(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4, right: 4),
          child: Container(
            height: 60,
            width: 200,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onInverseSurface,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRibbon(BuildContext context) {
    return Positioned(
      top: 8,
      right: -18,
      child: Transform.rotate(
        angle: 0.785398, // 45 degrees in radians
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 24.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(2, 2), // changes position of shadow
              ),
            ],
          ),
          child: Text(
            offerText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
