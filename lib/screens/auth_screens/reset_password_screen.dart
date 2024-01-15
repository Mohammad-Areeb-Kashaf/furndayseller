import 'package:furndayseller/constants.dart';
import 'package:furndayseller/widgets/auth/auth_layout_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  static String? authError = 'null';

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  bool isEmailSent = false;

  @override
  Widget build(BuildContext context) {
    return AuthLayoutWidget(
      labelText: isEmailSent ? "Check your mail" : "Reset Password",
      children: Padding(
        padding: const EdgeInsets.all(10.0),
        child: isEmailSent
            ? Text(
                'We have sent a reset password link to your email.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
              )
            : Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AuthTextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      labelText: 'Email',
                      hintText: 'Enter your Email',
                      validate: validateEmail,
                    ),
                    const SizedBox(height: 20),
                    MaterialButton(
                      height: 48,
                      shape: RoundedRectangleBorder(
                        borderRadius: kBorderRadiusCard,
                      ),
                      color: Theme.of(context).primaryColor,
                      onPressed: () async {
                        setState(() {
                          ResetPasswordScreen.authError = 'null';
                        });
                        if (formKey.currentState!.validate()) {
                          final email = emailController.text.trim();

                          try {
                            await _auth
                                .sendPasswordResetEmail(
                              email: email,
                            )
                                .then((value) {
                              formKey.currentState!.validate();
                              formKey.currentState!.reset();
                            });

                            setState(() {
                              isEmailSent = true;
                            });
                          } on FirebaseAuthException catch (e) {
                            printError(info: e.toString());

                            setState(() {
                              ResetPasswordScreen.authError = e.toString();
                              formKey.currentState!.validate();
                            });
                          }
                        }
                      },
                      child: Text(
                        'Reset Password',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  validateEmail(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(value) || value.isEmpty) {
      return 'Enter a valid email address';
    } else if (ResetPasswordScreen.authError != 'null') {
      if (ResetPasswordScreen.authError ==
          '[firebase_auth/invalid-email] The email address is badly formatted.') {
        return 'Looks like your email is invalid';
      } else if (ResetPasswordScreen.authError ==
          '[firebase_auth/email-already-in-use] The email address is already in use by another account.') {
        return 'Email already in use, Login instead?';
      } else if (ResetPasswordScreen.authError ==
          '[firebase_auth/invalid-email] The email address is badly formatted.') {
        return 'This email address is not correctly formatted';
      } else if (ResetPasswordScreen.authError ==
          '[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.') {
        return 'User is not found';
      } else if (ResetPasswordScreen.authError ==
          '[firebase_auth/too-many-requests] We have blocked all requests from this device due to unusual activity. Try again later.') {
        return 'Too many request from this device. Please try again later';
      } else if (ResetPasswordScreen.authError ==
          '[firebase_auth/network-request-failed] A network error (such as timeout, interrupted connection or unreachable host) has occurred.') {
        return 'Internet unavailable. Please connect your mobile to a internet connection';
      }
    } else {
      return null;
    }
  }
}
