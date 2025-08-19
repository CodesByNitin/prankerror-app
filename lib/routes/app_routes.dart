import 'package:flutter/material.dart';
import '../presentation/fake_error_screen/fake_error_screen.dart';

class AppRoutes {
  // TODO: Add your routes here
  static const String initial = '/';
  static const String fakeError = '/fake-error-screen';

  static Map<String, WidgetBuilder> routes = {
    initial: (context) => const FakeErrorScreen(),
    fakeError: (context) => const FakeErrorScreen(),
    // TODO: Add your other routes here
  };
}
