import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isp_project/presentation/veiws/id_entry_screen.dart';
import 'package:isp_project/presentation/veiws/provinc_select_screen.dart';
import 'package:isp_project/presentation/view_models/id_entry.dart';
import 'package:isp_project/presentation/view_models/province_entry.dart';
import 'package:isp_project/presentation/view_models/user_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => ProvinceViewModel()),
        ChangeNotifierProvider(create: (_) => IDEntryViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<IDEntryViewModel>(builder: (context, settings, child) {
      return MaterialApp(

        title: 'Harry Refah',

        debugShowCheckedModeBanner: false,
        navigatorKey: NavigatorService.navigatorKey,
        initialRoute: '/',
        routes: {
          '/': (context) => ProvinceSelectionScreen(),
          '/idEntry': (context) => const IDEntryScreen(),
        },
      );
    });
  }
}
class NavigatorService {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}