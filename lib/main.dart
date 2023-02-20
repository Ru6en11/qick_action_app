import 'package:flutter/material.dart';
import 'package:qick_act_app/shortcuts.dart';
import 'package:quick_actions/quick_actions.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {

  const App({super.key});

  @override
  State<StatefulWidget> createState() => _App();
}

class _App extends State {

  var _currentPage = 0;
  final QuickActions quickActions = const QuickActions();

  final _pages = const [
    Text('News'),
    Text('Calendar'),
    Text('Pass')
  ];

  @override
  void initState() {
    super.initState();

    initQuickActions();
  }

  void initQuickActions() {

    quickActions.initialize((String? type) {

      var page = 0;

      if (type == null) return;
      if (type == ShortcutsItems.actionNews.type) {
        page = 0;
      } else if (type == ShortcutsItems.actionCalendar.type) {
        page = 1;
      } else if (type == ShortcutsItems.actionPass.type) {
        page = 2;
      }

      setState(() {
        _currentPage = page;  
      }); 
    });

    quickActions.setShortcutItems(ShortcutsItems.items);
  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Quick Actions',
      home: Scaffold(
        body: Center(child: _pages.elementAt(_currentPage),),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: 'News'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Calendar'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.payment),
              label: 'Pass'
            ),
          ],
          currentIndex: _currentPage,
          fixedColor: Colors.blue,
          onTap: (int inIndex) {
            setState(() {
              _currentPage = inIndex;
            });
          },
        ),
      ),
    );
  }
}
