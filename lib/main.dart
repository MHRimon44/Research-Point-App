import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:research_point/screens/home_screen.dart';
import 'package:research_point/screens/login-screen.dart';
import 'package:research_point/screens/registration-screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'providers/favorites_provider.dart';
import 'screens/about_screen.dart';
import 'screens/downloads_screen.dart';
import 'screens/favorite_screen.dart';
import 'utils/theme_util.dart';
import 'package:firebase_core/firebase_core.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

void main() async {
  // Ensure that Flutter is initialized.
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize Firebase.
    await Firebase.initializeApp();
  } catch (e) {
    // Print any errors that occur during Firebase initialization.
    print('Error initializing Firebase: $e');
  }

  // Set the system overlay style.
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: ThemeUtil.primaryColor),
  );

  // Run the app.
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<FavoritesProvider>(
          create: (_) => FavoritesProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  final _pages = [
    const HomeScreen(),
    const FavoriteScreen(),
    const DownloadsScreen(),
    const AboutScreen(),
  ];

  var _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Research Point',
        theme: ThemeUtil.defaultTheme(),
        home: FirebaseAuth.instance.currentUser!.uid.isEmpty
            ? const RegistrationPage()
            : const HomeScreen()

        // Scaffold(
        //   body: SafeArea(
        //     child: _pages[_selectedPageIndex],
        //   ),
        //   bottomNavigationBar: BottomNavigationBar(
        //     currentIndex: _selectedPageIndex,
        //     selectedItemColor: ThemeUtil.secondaryColor,
        //     showUnselectedLabels: true,
        //     iconSize: 24.0,
        //     elevation: 16.0,
        //     onTap: (int index) {
        //       setState(() {
        //         _selectedPageIndex = index;
        //       });
        //     },
        //     type: BottomNavigationBarType.fixed,
        //     items: const [
        //       BottomNavigationBarItem(
        //         label: 'Home',
        //         icon: Icon(
        //           Icons.home,
        //         ),
        //       ),
        //       BottomNavigationBarItem(
        //         label: 'Favorites',
        //         icon: Icon(
        //           Icons.favorite,
        //         ),
        //       ),
        //       BottomNavigationBarItem(
        //         label: 'Downloads',
        //         icon: Icon(
        //           Icons.cloud_download_outlined,
        //         ),
        //       ),
        //       BottomNavigationBarItem(
        //         label: 'About',
        //         icon: Icon(
        //           Icons.info,
        //         ),
        //       ),
        //     ],
        //   ),
        // )

        );
  }
}
