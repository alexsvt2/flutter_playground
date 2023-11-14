import 'package:flutter/material.dart';
import 'package:playground/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _mainContents = [
    // Content for Home tab
    Container(
      color: Colors.yellow.shade100,
      alignment: Alignment.center,
      child: const CounterPage(title: 'Counter App')
      // child: const Text(
      //   'Home',
      //   style: TextStyle(fontSize: 40),
      // ),
    ),
    // Content for Feed tab
    Container(
      color: Colors.purple.shade100,
      alignment: Alignment.center,
      child: const Text(
        'Feed',
        style: TextStyle(fontSize: 40),
      ),
    ),
    // Content for Favorites tab
    Container(
      color: Colors.red.shade100,
      alignment: Alignment.center,
      child: const Text(
        'Favorites',
        style: TextStyle(fontSize: 40),
      ),
    ),
    // Content for Settings tab
    Container(
      color: Colors.pink.shade300,
      alignment: Alignment.center,
      child: const Text(
        'Settings',
        style: TextStyle(fontSize: 40),
      ),
    )
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test')),
      bottomNavigationBar: MediaQuery.of(context).size.width < 640
          ? BottomNavigationBar(
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.indigoAccent,
          // called when one tab is selected
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          // bottom tab items
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.feed), label: 'Feed'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorites'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings')
          ])
          : null,
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (MediaQuery.of(context).size.width >= 640)
            NavigationRail(
              minWidth: 55.0,
              selectedIndex: _selectedIndex,
              // Called when one tab is selected
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.all,
              selectedLabelTextStyle: const TextStyle(
                color: Colors.amber,
              ),
              leading: const Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  CircleAvatar(
                    radius: 20,
                    child: Icon(Icons.person),
                  ),
                ],
              ),
              unselectedLabelTextStyle: const TextStyle(),
              // navigation rail items
              destinations: const [
                NavigationRailDestination(
                    icon: Icon(Icons.home), label: Text('Home')),
                NavigationRailDestination(
                    icon: Icon(Icons.feed), label: Text('Feed')),
                NavigationRailDestination(
                    icon: Icon(Icons.favorite), label: Text('Favorites')),
                NavigationRailDestination(
                    icon: Icon(Icons.settings), label: Text('Settings')),
              ],
            ),

          // Main content
          // This part is always shown
          // You will see it on both small and wide screen
          Expanded(child: _mainContents[_selectedIndex]),
        ],
      ),
    );
  }

}
