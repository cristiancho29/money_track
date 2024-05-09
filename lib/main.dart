import 'package:flutter/material.dart';
import 'package:money_track/outcomes/main.dart';
import 'package:money_track/statistics/main.dart';
import 'package:money_track/incomes/main.dart';
import 'package:money_track/dashboard/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Track!',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    Widget page;
    switch(selectedIndex) {
      case 0: {
        page = const DashboardPage();
        break;
      }
      case 1: {
        page = const IncomesPage();
        break;
      }
      case 2: {
        page = const OutcomesPage();
        break;
      }
      case 3: {
        page = const StatisticsPage();
        break;
      }
      default: {
        throw UnimplementedError('no widget for $selectedIndex');
      }
    }
    return LayoutBuilder(builder: (context, constrains){
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constrains.maxWidth > 600,
                selectedIndex: selectedIndex,
                destinations: const [
                  NavigationRailDestination(icon: Icon(Icons.space_dashboard), label: Text('Dashboard')),
                  NavigationRailDestination(icon: Icon(Icons.account_balance_wallet), label: Text('Incomes')),
                  NavigationRailDestination(icon: Icon(Icons.payments), label: Text('Outcomes')),
                  NavigationRailDestination(icon: Icon(Icons.query_stats_rounded), label: Text('Statistics')),
                ],
                onDestinationSelected: (int index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ) 
            ),
            Expanded(child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: page,
            ))
          ],
        ),
      );
    });

  }
}
