import 'package:flutter/material.dart';

class Explainnormal extends StatelessWidget {
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
            'These medicines are used to treat bacterial pneumonia. It may take time to identify the type of bacteria causing your pneumonia and to choose the best antibiotic to treat it. If your symptoms do not improve, your doctor may recommend a different antibiotic.',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            'Cough medicine',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "This medicine may be used to calm your cough so that you can rest. Because coughing helps loosen and move fluid from your lungs, it's a good idea not to eliminate your cough completely. In addition, you should know that very few studies have looked at whether over-the-counter cough medicines lessen coughing caused by pneumonia. If you want to try a cough suppressant, use the lowest dose that helps you rest.",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            'Fever reducers/pain relievers',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "You may take these as needed for fever and discomfort. These include drugs such as aspirin, ibuprofen (Advil, Motrin IB, others) and acetaminophen (Tylenol, others).",
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
