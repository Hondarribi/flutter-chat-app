import 'package:chat/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'services/auth_services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: MaterialApp(
        title: 'Chat App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
        routes: appRoutes,
      ),
    );
  }
}
