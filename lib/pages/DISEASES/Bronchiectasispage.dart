import 'package:flutter/material.dart';

class Bronchiectasispage extends StatelessWidget {
  const Bronchiectasispage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'What is Bronchiectasis',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Column(
            children: [
              Text(
                "Bronchiectasis is a common and potentially serious infection of the lungs that can affect people of all ages. Here's a general overview:",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Image.asset(
            'lib/images/bronchiectatiscover.jpg',
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16.0),
          SizedBox(height: 8.0),
          Column(
            children: [
              Text(
                'Bronchiectasis is a chronic condition characterized by abnormal widening and thickening of the bronchial tubes, leading to a buildup of mucus and recurrent infections in the lungs. Over time, the damage to the bronchial walls can impair lung function and lead to symptoms such as chronic cough, excessive mucus production, and recurrent respiratory infections. Bronchiectasis is often a result of damage to the airways caused by underlying conditions such as cystic fibrosis, recurrent lung infections, or immune system disorders.',
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
            'Cystic Fibrosis',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            ' Cystic fibrosis is a genetic disorder that affects the mucus-producing glands, leading to thick and sticky mucus that can block the airways and promote bacterial growth.',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            'Recurrent Lung Infections',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Recurrent or severe lung infections, such as pneumonia or tuberculosis, can cause damage to the bronchial walls and lead to bronchiectasis.",
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
            'Immune System Disorders',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Disorders that affect the immune system, such as rheumatoid arthritis or HIV/AIDS, can increase the risk of developing bronchiectasis by impairing the body's ability to fight off infections.",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
