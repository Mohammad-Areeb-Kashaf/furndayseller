import 'package:furndayseller/constants.dart';
import 'package:furndayseller/widgets/auth/auth_layout_widget.dart';

class MainEmailNotVerifiedChild extends StatefulWidget {
  const MainEmailNotVerifiedChild(
      {super.key,
      required this.canResendEmail,
      required this.sendVerificationEmail});

  final bool canResendEmail;
  final Function sendVerificationEmail;

  @override
  State<MainEmailNotVerifiedChild> createState() =>
      _MainEmailNotVerifiedChildState();
}

class _MainEmailNotVerifiedChildState extends State<MainEmailNotVerifiedChild> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return AuthLayoutWidget(
      labelText: "Verify Email",
      children: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                text:
                    'A verification email has been sent to your email address\n',
                children: [
                  TextSpan(
                    text: _auth.currentUser!.email,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: kYellowColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              onPressed: widget.canResendEmail
                  ? () => widget.sendVerificationEmail
                  : null,
              icon: const Icon(
                Icons.email,
                size: 32,
                color: Colors.black,
              ),
              label: const Text(
                'Resent Email',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                _auth.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ),
                );
              },
              child: const Text(
                'Cancel',
              ),
            )
          ],
        ),
      ),
    );
  }
}
