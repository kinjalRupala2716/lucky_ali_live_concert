import 'package:flutter/material.dart';
import 'package:knocksence_flutter_webapp/providers/get_location_provider.dart';
import 'package:knocksence_flutter_webapp/screens/event_dashboard.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GetLocactionProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const EventDashboardScreen(),
      ),
    );
  }
}
