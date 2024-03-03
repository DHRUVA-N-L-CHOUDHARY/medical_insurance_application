part of 'app_pages.dart';

class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const SIGNIN = _Paths.SIGNIN;
  static const SIGNUP = _Paths.SIGNUP;
  static const DASHBOARD = _Paths.DASHBOARD;
  static const SEARCH = _Paths.SEARCH;
  static const CHECKOUT = _Paths.CHECKOUT;
  static const HOME = _Paths.HOME;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH = '/splash';
  static const SIGNIN = '/signin';
  static const SIGNUP = '/signup';
  static const DASHBOARD = '/dashboard';
  static const SEARCH = "/search";
  static const CHECKOUT = "/checkout";
  static const HOME = "/home";
}
