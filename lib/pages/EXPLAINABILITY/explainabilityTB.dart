import 'package:flutter/material.dart';

class ExplainabilityTB extends StatelessWidget {
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
            'lib/images/tbexplain.png',
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
            'Recommendations',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6.0),
          Text(
            'Antibiotics',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'TB treatment typically involves a combination of antibiotics such as isoniazid, rifampin, ethambutol, and pyrazinamide. Adherence to the prescribed medication schedule is essential for curing the disease and preventing drug resistance.',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            'Monitoring',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Regular visits to a healthcare provider are necessary to monitor the effectiveness of the treatment and to manage any side effects.",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            'Balanced Diet',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Eating a nutritious diet rich in fruits, vegetables, lean proteins, and whole grains can help strengthen the immune system.",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            'Avoid Alcohol and Tobacco',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Alcohol and tobacco can interfere with the effectiveness of TB medications and worsen the condition.",
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
