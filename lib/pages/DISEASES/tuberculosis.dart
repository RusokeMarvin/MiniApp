import 'package:flutter/material.dart';

class Tuberculosispage extends StatelessWidget {
  const Tuberculosispage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'What is Tuberculosis',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Column(
            children: [
              Text(
                "Tuberculosis is a common and potentially serious infection of the lungs that can affect people of all ages. Here's a general overview:",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Image.asset(
            'lib/images/Tubercover.jpg',
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16.0),
          SizedBox(height: 8.0),
          Column(
            children: [
              Text(
                'Tuberculosis (TB) is an infectious disease caused by the bacterium Mycobacterium tuberculosis. It primarily affects the lungs (pulmonary tuberculosis), but it can also affect other parts of the body (extrapulmonary tuberculosis). TB spreads through the air when an infected person coughs or sneezes, releasing bacteria into the air.',
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
            'Mycobacterium tuberculosis',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "TB is caused by the bacterium Mycobacterium tuberculosis. This bacterium infects the lungs and other organs, evading the immune system's defenses and multiplying within the body.",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            'Transmission',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "TB is primarily spread through the air when an infected person coughs, sneezes, or speaks, releasing respiratory droplets containing Mycobacterium tuberculosis. Close contact with an infected individual in poorly ventilated settings increases the risk of transmission. ",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Symptoms',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Cough',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "In tuberculosis (TB), a persistent cough lasting over three weeks is common, often producing phlegm or blood. This cough can be persistent and may worsen over time.",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            'Chest Pain',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Chest pain associated with TB is characterized by discomfort or pressure in the chest, especially during coughing or deep breathing. It can feel sharp or stabbing and may be localized or spread across the chest area.",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            'Fever',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Fever in TB is typically low-grade and may occur in the afternoon or evening. It results from the body's immune response to the infection and can raise suspicion for TB when combined with other symptoms.",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
