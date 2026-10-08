// UniTrack FINAL - Founded by Emmanuel Favour Iye
// 3 AIs + Dashboard + Notes + Timer + Reminders
import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(UnitrackApp());

class UnitrackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UniTrack - By Favor Iye',
      theme: ThemeData(primarySwatch: Colors.deepPurple, useMaterial3: true),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  final pages = [DashboardPage(), NotesPage(), TimerPage(), AIHubPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: [
          NavigationDestination(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          NavigationDestination(icon: Icon(Icons.note_alt), label: 'Notes'),
          NavigationDestination(icon: Icon(Icons.timer), label: 'Timer'),
          NavigationDestination(icon: Icon(Icons.smart_toy), label: '3 AIs'),
        ],
      ),
    );
  }
}

// 1. DASHBOARD
class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UniTrack - Founded by Favor Iye'), centerTitle: true),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Card(child: ListTile(title: Text('Welcome Favor! 🎓'), subtitle: Text('Your all-in-one student companion for Nigeria'), leading: Icon(Icons.school, color: Colors.deepPurple, size: 40))),
          SizedBox(height: 10),
          Row(children: [
            Expanded(child: Card(color: Colors.deepPurple.shade50, child: Padding(padding: EdgeInsets.all(16), child: Column(children: [Icon(Icons.note), Text('Notes'), Text('Ready')])))),
            Expanded(child: Card(color: Colors.orange.shade50, child: Padding(padding: EdgeInsets.all(16), child: Column(children: [Icon(Icons.timer), Text('Focus Timer'), Text('25 min')])))),
          ]),
          Card(child: ListTile(title: Text('Founded by Emmanuel Favour Iye'), subtitle: Text('UniTrack Public - 2026'), trailing: Icon(Icons.verified, color: Colors.green))),
        ],
      ),
    );
  }
}

// 2. NOTES
class NotesPage extends StatefulWidget {
  @override
  State<NotesPage> createState() => _NotesPageState
