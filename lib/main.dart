import 'package:flutter/material.dart';
import 'package:greenz_go_app_v2/notifier/auth_notifier.dart';
import 'package:greenz_go_app_v2/utils/theme/theme_proto.dart';
import 'package:provider/provider.dart';
import 'notifier/vehicle_notifier.dart';
import 'ui/screens/catalog_screen.dart';
import 'ui/screens/edit_profile.dart';
import 'ui/screens/login_screen.dart';
import 'ui/screens/profile_screen.dart';
import 'ui/screens/register_screen.dart';
import 'ui/screens/renter_profile.dart';
import 'ui/screens/request_screen.dart';
import 'ui/screens/search_screen.dart';
import 'ui/screens/vehicle_detail.dart';
// import 'utils/theme/theme.dart';
import 'ui/screens/homescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'notifier/auth_notifier.dart';

//TODO: #0.1 put home in the center.
//TODO: #0.2 Create a dart file for all custom widgets, LOGO, Containers, Search/Login/Register buttons.
//TODO: #0.3 Create variables for all pages where necessary
//TODO: #0.4 Clean and optimize code

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => AuthNotifier(),
      ),
      ChangeNotifierProvider(
        create: (context) => VehicleNotifier(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeProto appTheme = ThemeProto(isDark: true);
    return Provider.value(
      value: appTheme,
      child: MaterialApp(
        theme: appTheme.themeData,
        initialRoute: HomeScreen.id,
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          CatalogScreen.id: (context) => CatalogScreen(),
          EditProfileScreen.id: (context) => EditProfileScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          ProfileScreen.id: (context) => ProfileScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          RenterProfileScreen.id: (context) => RenterProfileScreen(),
          RequestScreen.id: (context) => RequestScreen(),
          SearchScreen.id: (context) => SearchScreen(),
          VehicleDetail.id: (context) => VehicleDetail(),
        },
      ),
    );
  }
}
