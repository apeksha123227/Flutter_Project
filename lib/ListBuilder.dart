import 'dart:math';

import 'package:flutter/material.dart';

class Listbuilder extends StatelessWidget {
  const Listbuilder({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> human_Names = [
      'Aarav',
      'Aanya',
      'Aditya',
      'Aditi',
      'Aisha',
      'Akash',
      'Alisha',
      'Aman',
      'Amara',
      'Amir',
      'Ananya',
      'Anika',
      'Anil',
      'Anita',
      'Arjun',
      'Arya',
      'Ayush',
      'Bhavya',
      'Chirag',
      'Deepa',
      'Dev',
      'Diya',
      'Divya',
      'Esha',
      'Farhan',
      'Gaurav',
      'Harsh',
      'Isha',
      'Ishaan',
      'Jaya',
      'Kabir',
      'Karan',
      'Kavya',
      'Khushi',
      'Laksh',
      'Lina',
      'Mahi',
      'Manav',
      'Meera',
      'Mira',
      'Mohit',
      'Neha',
      'Nikita',
      'Niraj',
      'Nisha',
      'Om',
      'Pooja',
      'Pranav',
      'Priya',
      'Rahul',
      'Raj',
      'Rajesh',
      'Rakesh',
      'Ravi',
      'Rhea',
      'Riya',
      'Rohan',
      'Rohit',
      'Rupa',
      'Saanvi',
      'Sahil',
      'Sai',
      'Sakshi',
      'Salman',
      'Samir',
      'Sana',
      'Sara',
      'Shreya',
      'Shruti',
      'Simran',
      'Sneha',
      'Soham',
      'Sonali',
      'Suman',
      'Suresh',
      'Swati',
      'Tanvi',
      'Tara',
      'Tanish',
      'Tanu',
      'Tarun',
      'Trisha',
      'Uday',
      'Uma',
      'Vansh',
      'Varun',
      'Veer',
      'Vidya',
      'Vikram',
      'Vinay',
      'Vivek',
      'Yash',
      'Yuvraj',
      'Zara',
      'Zoya',
      'Reema',
      'Kritika',
      'Harini',
      'Ritesh',
      'Arnav',
      'Naveen',
      'Chandan',
      'Bhavana',
      'Dhruv',
      'Lavanya',
      'Rajni',
    ];

    Color getRandomColor()
    {
        Random random=Random();
        return Color.fromARGB( 255,
        random.nextInt(256), // Red 0-255
        random.nextInt(256), // Green 0-255
         random.nextInt(256)); // Blue 0-255)
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "ListBuider Examples",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
          ),
          backgroundColor: Colors.pink,
          leading: Icon(Icons.arrow_back, size: 20, color: Colors.white),
          elevation: 5,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Human names",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: human_Names.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: getRandomColor(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: Colors.pink, width: 1),
                      ),
                      child: ListTile(
                        leading: Icon(Icons.person, color: Colors.white),
                        title: Text(human_Names[index],
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
