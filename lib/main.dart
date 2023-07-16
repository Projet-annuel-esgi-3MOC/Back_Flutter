import 'package:flutter/material.dart';
import 'package:back_web_pa_flutter/routing/app_router.dart';


void main() {
  runApp(const CookUp());
}
class CookUp extends StatelessWidget {
  const CookUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "CookUp",
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationParser: AppRouter.router.routeInformationParser,
    );
  }
}
