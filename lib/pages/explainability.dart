import 'package:flutter/material.dart';

class Explainability extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Explainability',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.asset(
            'lib/images/explain.png',
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16.0),
          SizedBox(height: 8.0),
          Column(
            children: [
              Text(
                'This is a detailed explanation about the image. It provides context and background information that helps the viewer understand the significance or story behind the image. You can describe what the image shows, why it is important, and any other interesting details.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Recommendations',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6.0),
          Text(
            'This is a detailed explanation about the image. It provides context and background information that helps the viewer understand the significance or story behind the image. You can describe what the image shows, why it is important, and any other interesting details.',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
