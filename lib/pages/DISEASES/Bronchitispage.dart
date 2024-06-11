import 'package:flutter/material.dart';

class Bronchitispage extends StatelessWidget {
  const Bronchitispage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'What is Bronchitis',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Column(
            children: [
              Text(
                "Bronchitis is a common and potentially serious infection of the lungs that can affect people of all ages. Here's a general overview:",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Image.asset(
            'lib/images/Bronchcover.jpg',
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16.0),
          SizedBox(height: 8.0),
          Column(
            children: [
              Text(
                'Bronchitis is an inflammation of the bronchial tubes, which carry air to and from the lungs. It can be acute or chronic. Acute bronchitis is often caused by viral infections and typically resolves within a few weeks. Chronic bronchitis is a long-term condition characterized by persistent inflammation of the bronchial tubes and is commonly associated with smoking or long-term exposure to irritants.',
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
            'Causes',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6.0),
          Text(
            'Viral Infections',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Acute bronchitis is most commonly caused by viral infections, such as the influenza virus, rhinovirus, or respiratory syncytial virus (RSV).',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            'Environmental Irritants',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Exposure to environmental irritants such as cigarette smoke, air pollution, dust, or chemical fumes can irritate the bronchial tubes and trigger acute or chronic bronchitis.",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            'Bacterial Infections',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Bacterial infections can also cause acute bronchitis, although they are less common than viral infections. Bacteria such as Streptococcus pneumoniae or Haemophilus influenzae may be responsible.",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            'Other Factors',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Factors such as gastroesophageal reflux disease (GERD), allergies, or immune system disorders can also contribute to the development of bronchitis.",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
