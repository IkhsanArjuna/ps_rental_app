import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:ps_rental_app/provider/auth_provider.dart';
import 'package:ps_rental_app/provider/bottom_nav_provider.dart';
import 'package:ps_rental_app/provider/cart_provider.dart';
import 'package:ps_rental_app/provider/chat_forum_provider.dart';
import 'package:ps_rental_app/provider/cs_provider.dart';
import 'package:ps_rental_app/provider/edit_profile_provider.dart';
import 'package:ps_rental_app/provider/single_product_payment_provider.dart';
import 'package:ps_rental_app/view/page/main/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'view/page/auth/onboarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomNavProvider(),
        ),
        ChangeNotifierProvider(create: (context) => ChatForumProvider()),
        ChangeNotifierProvider(
          create: (context) => CsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SingelProductPaymentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => EditProfileProvider(),
        )
      ],
      child: MyApp(
        token: prefs.getString('token'),
      )));
}

class MyApp extends StatelessWidget {
  final token;
  const MyApp({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          bottomSheetTheme: BottomSheetThemeData(
              backgroundColor: Colors.black.withOpacity(0.5))),
      debugShowCheckedModeBanner: false,
      home: Consumer<AuthProvider>(builder: (context, provider, child) {
        if (token == '') {
          return OnboardingPage();
        } else {
          if (JwtDecoder.isExpired(token) == false) {
            return FutureBuilder(
                future:
                    provider.saveUserNow(JwtDecoder.decode(token)['id_user']),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Scaffold(
                      backgroundColor: Colors.black,
                      appBar: null,
                      body: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (snapshot.data == false) {
                    return OnboardingPage();
                  } else {
                    context
                        .read<EditProfileProvider>()
                        .saveInformationUser(provider.userLoginNow!);
                    return Homepage();
                  }
                });
          } else {
            return OnboardingPage();
          }
        }
      }),
    );
  }
}
