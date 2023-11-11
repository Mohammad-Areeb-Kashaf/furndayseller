import 'package:furndayseller/constants.dart';

class AuthServices extends StatefulWidget {
  final Widget isAuthenticatedChild, isNotAuthenticatedChild;

  const AuthServices(
      {super.key,
      required this.isAuthenticatedChild,
      required this.isNotAuthenticatedChild});

  @override
  State<AuthServices> createState() => _AuthServicesState();
}

class _AuthServicesState extends State<AuthServices> {
  final _auth = FirebaseAuth.instance;
  late final user;
  bool isUserSignedIn = false;

  @override
  void initState() {
    super.initState();
    user = _auth.currentUser;
    if (user != null) {
      isUserSignedIn = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isUserSignedIn) {
      return widget.isNotAuthenticatedChild;
    } else {
      return widget.isAuthenticatedChild;
    }
  }
}
