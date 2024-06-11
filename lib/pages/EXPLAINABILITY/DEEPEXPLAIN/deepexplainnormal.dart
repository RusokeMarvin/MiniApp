import 'package:flutter/material.dart';

class Explainnormaldeep extends StatelessWidget {
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
          Column(
            children: [
              Text(
                "Our model's predictions are trustworthy because they are based on identifying and focusing on important medical patterns in X-ray images. The provided visual example helps to illustrate this capability, ensuring that our predictions are clear, reliable, and aligned with medical expertise.",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  LegendItem(
                    color: Colors.red,
                    description:
                        'High Attention: Areas the model focuses on most',
                  ),
                  LegendItem(
                    color: Colors.orange,
                    description:
                        'Medium-High Attention: Areas the model finds important',
                  ),
                  LegendItem(
                    color: Colors.yellow,
                    description: 'Medium Attention: Moderately important areas',
                  ),
                  LegendItem(
                    color: Colors.green,
                    description: 'Low Attention: Areas with lesser importance',
                  ),
                  LegendItem(
                    color: Color.fromARGB(255, 192, 135, 238),
                    description:
                        'No Attention: Areas the model does not focus on',
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Prevention of Pneumonia',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6.0),
          Text(
            'Get vaccinated. ',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Vaccines are available to prevent some types of pneumonia and the flu. Talk with your doctor about getting these shots. The vaccination guidelines have changed over time so make sure to review your vaccination status with your doctor even if you recall previously receiving a pneumonia vaccine.',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            'Make sure children get vaccinated.',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Doctors recommend a different pneumonia vaccine for children younger than age 2 and for children ages 2 to 5 years who are at particular risk of pneumococcal disease. Children who attend a group child care center should also get the vaccine. Doctors also recommend flu shots for children older than 6 months.",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            'Practice good hygiene',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "To protect yourself against respiratory infections that sometimes lead to pneumonia, wash your hands regularly or use an alcohol-based hand sanitizer.",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            "Don't smoke",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Smoking damages your lungs' natural defenses against respiratory infections.",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String description;

  LegendItem({required this.color, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 24,
            height: 24,
            color: color,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
