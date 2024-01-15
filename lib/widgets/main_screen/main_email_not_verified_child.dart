import 'package:furndayseller/constants.dart';

class MainEmailNotVerifiedChild extends StatelessWidget {
  const MainEmailNotVerifiedChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => FirebaseAuth.instance.signOut().then((value) {
            context.mounted
                ? Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
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
