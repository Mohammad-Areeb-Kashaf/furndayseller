import 'package:furndayseller/constants.dart';

class MainEmailVerifiedChild extends StatelessWidget {
  const MainEmailVerifiedChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => FirebaseAuth.instance.signOut().then((value) {
            GoogleSignIn().signOut();
            context.mounted
                ? Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const SignInScreen()))
                : null;
          }),
          child: const Text(
            'Sign Out',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
