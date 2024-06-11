import 'package:flutter/material.dart';

class Pneumoniapage extends StatelessWidget {
  const Pneumoniapage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'What is Pneumonia',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Column(
            children: [
              Text(
                "Pneumonia is a common and potentially serious infection of the lungs that can affect people of all ages. Here's a general overview:",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Image.asset(
            'lib/images/pneumoniacover.jpg',
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16.0),
          SizedBox(height: 8.0),
          Column(
            children: [
              Text(
                'Pneumonia is an infection that inflames the air sacs in one or both lungs. The air sacs may fill with fluid or pus (purulent material), causing cough with phlegm or pus, fever, chills, and difficulty breathing. Pneumonia can range in severity from mild to life-threatening and can affect people of all ages, but it is most dangerous in infants, young children, older adults, and people with weakened immune systems.',
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
            'Bacterial Infections',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Streptococcus pneumoniae is the most common cause of bacterial pneumonia. Other bacteria such as Haemophilus influenzae and Mycoplasma pneumoniae can also cause pneumonia.',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            'Viral Infections',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Viruses such as influenza (flu), respiratory syncytial virus (RSV), and rhinovirus can cause viral pneumonia.",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            'Fungal Infections',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Fungi such as Pneumocystis jirovecii can cause pneumonia, especially in people with weakened immune systems.",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            'Aspiration',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Inhaling food, liquids, vomit, or other foreign substances into the lungs can lead to aspiration pneumonia.",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
