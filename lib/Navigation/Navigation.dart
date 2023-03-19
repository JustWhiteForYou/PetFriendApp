import 'package:flutter/material.dart';


void Navigate() => runApp(MyApp());

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  final pages = [
    Center(child: Text('Page 1',style: TextStyle(fontSize: 50),),),
    Center(child: Text('Page 2',style: TextStyle(fontSize: 50),),),
    Center(child: Text('Page 3',style: TextStyle(fontSize: 50),),),
    Center(child: Text('Page 4',style: TextStyle(fontSize: 50),),),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('PetLog',),
          backgroundColor: Color.fromRGBO(255,120,63,1),
        ),
        body: pages[index],
        bottomNavigationBar: NavigationBar(
          elevation: 10,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.pets_outlined,),
              selectedIcon: Icon(Icons.pets,color: Color.fromRGBO(255,120,63,1)),
              label: 'Pet',
            ),
            NavigationDestination(
              icon: Icon(Icons.photo_outlined),
              selectedIcon: Icon(Icons.photo,color: Color.fromRGBO(255,120,63,1)),
              label: 'Gallery',
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_month_outlined),
              selectedIcon: Icon(Icons.calendar_month,color: Color.fromRGBO(255,120,63,1)),
              label: 'Calendar',
            ),
            NavigationDestination(
              icon: Icon(Icons.local_hospital_outlined),
              selectedIcon: Icon(Icons.local_hospital,color: Color.fromRGBO(255,120,63,1)),
              label: 'Medicine',
            ),
          ],
        ),
      ),
    );
  }
}
