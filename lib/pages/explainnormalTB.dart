import 'package:flutter/material.dart';

class ExplainnormalTB extends StatelessWidget {
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
            'lib/images/explain2.png',
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16.0),
          SizedBox(height: 8.0),
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
            'Prevention of TB',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6.0),
          Text(
            'Vaccination ',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'The Bacillus Calmette-Guérin (BCG) vaccine is widely used to protect against TB, especially in children. It is most effective in preventing severe forms of TB such as TB meningitis and miliary TB in children​',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            'Screening and Early Diagnosis',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Regular screening, especially for high-risk groups such as healthcare workers, people living with HIV, and those in close contact with TB patients, can help detect TB early and start treatment promptly​ ",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            'Complete Treatment Regimens',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Ensure that individuals diagnosed with TB complete their entire course of treatment to prevent the development of drug-resistant TB strains. Directly Observed Therapy (DOT) programs can help ensure adherence​",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            "Infection Control",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Use masks, especially in healthcare settings and crowded places, to reduce the risk of transmission and also ensure proper ventilation in living and working environments to dilute and remove airborne TB bacteria​",
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
