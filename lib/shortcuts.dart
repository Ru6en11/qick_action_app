import 'package:quick_actions/quick_actions.dart';

class ShortcutsItems {
  
  static final items = <ShortcutItem>[
    actionNews,
    actionCalendar,
    actionPass
  ];

  static const actionNews = ShortcutItem(
    type: 'action_news', 
    localizedTitle: 'News'
  );

  static const actionCalendar = ShortcutItem(
    type: 'action_calendar', 
    localizedTitle: 'Calendar'
  );

  static const actionPass = ShortcutItem(
    type: 'action_pass', 
    localizedTitle: 'Pass'
  );
}