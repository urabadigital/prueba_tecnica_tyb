import 'package:flutter/material.dart';
import 'package:tyba/data/university_analytics.dart';
import 'package:tyba/data/rest/university_rest_service.dart';
import 'package:tyba/domain/repository/university_api.dart';
import 'package:tyba/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UniversityAnalytics>(
          create: (_) => UniversityAnalytics(),
        ),
        Provider<UniversityApi>(
          create: (context) => UniversityRestService(
            context.read<UniversityAnalytics>(),
          ),
        ),
        
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(builder: (context, provider, _) {
        final isLight = provider.isLight;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter University',
          theme: isLight ? ThemeData.light() : ThemeData.dark(),
          home: const SplashScreen(),
        );
      }),
    );
  }
}

class ThemeProvider extends ChangeNotifier {
  bool isLight = true;

  void changeTheme() {
    isLight = !isLight;
    notifyListeners();
  }
}
