import 'package:furndayseller/constants.dart';

enum ScreenDeterminer {
  home,
  allProducts,
  categories,
  furniture,
  hardware,
  refurbished,
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var myScreen = ScreenDeterminer.home;
  bool homeSelected = true;
  bool allProductsSelected = false;
  bool categoriesSelected = false;
  bool furnitureSelected = false;
  bool hardwareSelected = false;
  bool refurbishedSelected = false;
  final _auth = FirebaseAuth.instance;
  late final User? user;
  late bool isEmailVerified;
  bool canResendEmail = false;
  Timer timer = Timer(Duration.zero, () {});
  bool isUserSignedIn = false;

  @override
  void initState() {
    super.initState();
    user = _auth.currentUser;
    if (user != null) {
      isUserSignedIn = true;
    }
    if (isUserSignedIn) {
      setState(() {
        isEmailVerified = _auth.currentUser!.emailVerified;
      });

      if (!isEmailVerified) {
        sendVerificationEmail();

        timer = Timer.periodic(
          const Duration(seconds: 3),
          (_) => checkEmailVerified(),
        );
      }
    } else {
      setState(() {
        isEmailVerified = true;
      });
    }
  }

  Future checkEmailVerified() async {
    try {
      await _auth.currentUser!.reload();

      setState(() {
        isEmailVerified = _auth.currentUser!.emailVerified;
      });

      if (isEmailVerified) {
        timer.cancel();
      }
    } catch (e) {
      printError(info: e.toString());
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Future sendVerificationEmail() async {
    try {
      final user = _auth.currentUser!;
      await user.sendEmailVerification();

      setState(
        () => canResendEmail = false,
      );
      await Future.delayed(const Duration(seconds: 5));
      setState(
        () => canResendEmail = true,
      );
    } catch (e) {
      printError(info: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return isEmailVerified
        ? const MainEmailVerifiedChild()
        : const MainEmailNotVerifiedChild();
  }
}
