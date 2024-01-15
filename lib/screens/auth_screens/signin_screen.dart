import 'package:furndayseller/constants.dart';
import 'package:furndayseller/widgets/auth/auth_layout_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      child: AuthLayoutWidget(
        labelText: "Sign In",
        children: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10.0),
          child: Column(
            children: [
              AuthForm(
                formKey: formKey,
                isSignIn: true,
                onPressed: signIn,
                signInWithGoogle: signInWithGoogle,
                signInWithFacebook: signInWithFacebook,
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: GestureDetector(
                  onTap: () async {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Don\'t have an account? ',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontFamily: 'Readex Pro',
                                    color: const Color(0xff14181B),
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        const TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  signIn({
    required String name,
    required String email,
    required String password,
  }) async {
    setState(() {
      isLoading = true;
    });
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then(
        (value) {
          formKey.currentState!.validate();
          formKey.currentState!.reset();
        },
      );
      context.mounted
          ? Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const MainScreen()))
          : null;
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
          await GoogleSignIn(scopes: ['email', "https://mail.google.com"])
              .signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

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
        Get.showSnackbar(
          const GetSnackBar(
            title: "Sign In Success",
            message: "Sign in using Google is successful",
            borderRadius: 20,
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = true;
      });

      NetworkStatusService().checkInternet();
      printError(info: e.toString());
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
