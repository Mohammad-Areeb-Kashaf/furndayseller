import 'package:furndayseller/constants.dart';
import 'package:furndayseller/widgets/auth/auth_layout_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      child: AuthLayoutWidget(
        labelText: "Sign Up",
        children: Column(
          children: [
            AuthForm(
                isSignIn: false,
                formKey: formKey,
                onPressed: signUp,
                signInWithGoogle: signInWithGoogle,
                signInWithFacebook: signInWithFacebook),
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: GestureDetector(
                onTap: () async {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInScreen()));
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account? ',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontFamily: 'Readex Pro',
                              color: const Color(0xff14181B),
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      const TextSpan(
                        text: 'Sign In',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    setState(() {
      isLoading = true;
    });
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await _auth.currentUser!.updateDisplayName(name);
        formKey.currentState!.validate();
        formKey.currentState!.reset();
        await _auth.currentUser!.reload();
        context.mounted
            ? Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const MainScreen()))
            : null;
      });
    } on FirebaseAuthException catch (e) {
      printError(info: e.toString());
      setState(() {
        AuthForm.authError = e.toString();
        formKey.currentState!.validate();
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  signInWithGoogle() async {
    try {
      setState(() {
        isLoading = true;
      });
      final auth = FirebaseAuth.instance;
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn(scopes: ['email']).signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await auth.signInWithCredential(credential);
      context.mounted
          ? Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const MainScreen()))
          : null;
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = true;
      });
      NetworkStatusService().checkInternet();
      printError(info: e.toString());
      context.mounted
          ? Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const MainScreen()))
          : null;
      setState(() {
        isLoading = false;
      });
    }
  }

  signInWithFacebook() async {
    try {
      setState(() {
        isLoading = true;
      });
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;

        if (accessToken.token.isNotEmpty) {
          final OAuthCredential credential =
              FacebookAuthProvider.credential(result.accessToken!.token);
          await _auth.signInWithCredential(credential);
          context.mounted
              ? Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const MainScreen()))
              : null;
          setState(() {
            isLoading = false;
          });
        } else {
          setState(() {
            isLoading = false;
          });
        }
      } else {
        printInfo(info: result.status.toString());
        printInfo(info: result.message.toString());
        context.mounted
            ? Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const MainScreen()))
            : null;
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      printError(info: e.toString());
      setState(() {
        isLoading = false;
      });
    }
  }
}
