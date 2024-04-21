import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Women Development App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(), // Removed const keyword
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> images = [
    'assets/image1.jpeg', // Replace with your image paths
    'assets/image2.webp', // Replace with your image paths
    'assets/image3.jpg', // Replace with your image paths
    'assets/image4.jpg', // Replace with your image paths
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Women Development App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.login),
            onPressed: () {
              // Add your login logic here
            },
          ),
        ],
      ),
      drawer:  Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Option 1'),
              onTap: () {
                // Add your menu option 1 logic here
              },
            ),
            ListTile(
              title: Text('Option 2'),
              onTap: () {
                // Add your menu option 2 logic here
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 16 / 9,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
              ),
              items: images.map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                      ),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Founded in 2011, Anjuman-I-Islams Kalsekar Technical Campus is a distinguished institution located in the state of Navi Mumbai. The institute offers a range of Degree courses, which include PG and UG. These courses are approved by the AICTE and are designed to be delivered in full-time mode. The institute offers various courses such as B.Arch, B.E. / B.Tech, B.Pharma, B.Sc., M.E./M.Tech covering major streams such as Architecture and Planning, Engineering, IT and Software, Medicine and Health Sciences. Courses are taught by experienced faculty members who are experts in Electronics Engineering, Electronics Engineering, Civil Engineering, Computer Science Engineering, Artificial Intelligence and Machine Learning, Computer Science Engineering, Electrical Engineering, Electronics and Communication Engineering, Mechanical Engineering, Construction Engineering and various other fields. The institute have 678 seats and it provides quality education at an affordable fee; ranging between INR 195,210-443,655, making these courses accessible to all, and allowing students to acquire knowledge and expertise in their chosen fields. Moreover, the institute provides excellent infrastructure facilities to support students learning experiences.'

                ,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
