import 'package:furndayseller/constants.dart';
import 'package:furndayseller/screens/auth_screens/reset_password_screen.dart';

class AuthForm extends StatefulWidget {
  const AuthForm(
      {super.key,
      required this.isSignIn,
      required this.formKey,
      required this.onPressed,
      required this.signInWithGoogle,
      required this.signInWithFacebook});

  final GlobalKey<FormState> formKey;
  final bool isSignIn;
  final Function onPressed;
  final Function signInWithGoogle;
  final Function signInWithFacebook;
  static String? authError = 'null';

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final TextEditingController nameController = TextEditingController(),
      emailController = TextEditingController(),
      passwordController = TextEditingController(),
      confirmPasswordController = TextEditingController();
  String? email, password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            widget.isSignIn == false
                ? Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                    child: AuthTextField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      labelText: 'Name',
                      hintText: 'Enter your Name',
                      validate: validateName,
                    ),
                  )
                : const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
              child: AuthTextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                labelText: 'Email',
                hintText: 'Enter your Email',
                validate: validateEmail,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
              child: AuthTextField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                labelText:
                    widget.isSignIn == false ? 'Create Password' : 'Password',
                hintText: 'Enter your Password',
                validate: validatePassword,
                obscureText: true,
              ),
            ),
            widget.isSignIn == false
                ? Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                    child: AuthTextField(
                      controller: confirmPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      labelText: 'Confirm Password',
                      hintText: 'Enter your Password',
                      validate: validatePassword,
                      obscureText: true,
                    ),
                  )
                : const SizedBox.shrink(),
            widget.isSignIn
                ? Align(
                    alignment: const AlignmentDirectional(-1, 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ResetPasswordScreen()));
                      },
                      child: Text(
                        'Forgot Password?',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    AuthForm.authError = 'null';
                  });
                  if (widget.formKey.currentState!.validate()) {
                    widget.formKey.currentState!.save();
                    final name = nameController.text.trim();
                    final email = emailController.text.trim();
                    final password = passwordController.text.trim();
                    widget.onPressed(
                      name: name,
                      email: email,
                      password: password,
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kYellowColor),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    Theme.of(context).textTheme.titleSmall!,
                  ),
                  elevation: MaterialStateProperty.all<double>(3.0),
                  side: MaterialStateProperty.all<BorderSide>(
                    const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                child: Text(widget.isSignIn ? 'Sign In' : 'Sign Up'),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 2.0,
                    color: Colors.grey.shade400,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3.0),
                  child:
                      const Text("OR", style: TextStyle(color: Colors.black38)),
                ),
                Expanded(
                  child: Container(
                    height: 2.0,
                    color: Colors.grey.shade400,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => widget.signInWithGoogle(),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Center(
                        child: Image.asset("assets/images/google.png"),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () => widget.signInWithFacebook(),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Center(
                        child: Image.asset("assets/images/facebook.png"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
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
    } else if (AuthForm.authError != 'null') {
      if (AuthForm.authError ==
          '[firebase_auth/invalid-email] The email address is badly formatted.') {
        return 'Looks like your email is invalid';
      } else if (AuthForm.authError ==
          '[firebase_auth/email-already-in-use] The email address is already in use by another account.') {
        return 'Email already in use, Login instead?';
      } else if (AuthForm.authError ==
          '[firebase_auth/invalid-email] The email address is badly formatted.') {
        return 'This email address is not correctly formatted';
      } else if (AuthForm.authError ==
          '[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.') {
        return 'User is not found';
      } else if (AuthForm.authError ==
          '[firebase_auth/too-many-requests] We have blocked all requests from this device due to unusual activity. Try again later.') {
        return 'Too many request from this device. Please try again later';
      } else if (AuthForm.authError ==
          '[firebase_auth/network-request-failed] A network error (such as timeout, interrupted connection or unreachable host) has occurred.') {
        return 'Internet unavailable. Please connect your mobile to a internet connection';
      }
    } else {
      return null;
    }
  }

  validatePassword(String value) {
    if (value.isEmpty) {
      return "Password should not be empty";
    } else if (value.length < 6) {
      return 'Password length should be at least 6';
    } else if (AuthForm.authError != 'null') {
      if (AuthForm.authError ==
          '[firebase_auth/wrong-password] The password is invalid or the user does not have a password.') {
        setState(() {
          passwordController.text = '';
        });
        return 'Password is incorrect';
      } else if (AuthForm.authError ==
          '[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.') {
        return 'User is not found';
      } else if (AuthForm.authError ==
          '[firebase_auth/too-many-requests] We have blocked all requests from this device due to unusual activity. Try again later.') {
        return 'Too many request from this device. Please try again later';
      } else if (AuthForm.authError ==
          '[firebase_auth/network-request-failed] A network error (such as timeout, interrupted connection or unreachable host) has occurred.') {
        return 'Internet unavailable. Please connect your mobile to a internet connection';
      } else if (AuthForm.authError ==
          '[firebase_auth/too-many-requests] Access to this account has been temporarily disabled due to many failed login attempts. You can immediately restore it by resetting your password or you can try again later.') {
        return 'Account has been disabled temporarily due to many failed login attempts';
      }
    } else {
      return null;
    }
  }

  validateConfirmPassword(String value) {
    if (value.isEmpty) {
      return "Confirm password should not be empty";
    } else if (value.length < 6) {
      return 'Password length should be at least 6';
    } else if (value.trim() != passwordController.text.trim()) {
      return "Password didn't match";
    }
  }

  validateName(String value) {
    if (value.isEmpty) {
      return "Name should not be empty";
    } else if (value.length < 6) {
      return 'Name length should be at least 6';
    } else {
      return null;
    }
  }
}
