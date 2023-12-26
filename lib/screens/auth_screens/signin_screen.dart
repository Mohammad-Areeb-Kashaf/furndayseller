import 'package:furndayseller/constants.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F4F8),
      body: SafeArea(
        top: true,
        child: Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Text(
                    'Sign In',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Material(
                    elevation: 10,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10, 10, 10, 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle:
                                    Theme.of(context).textTheme.labelMedium,
                                hintText: 'Enter your email',
                                hintStyle:
                                    Theme.of(context).textTheme.labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                              style: Theme.of(context).textTheme.bodyMedium,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 10, 0, 10),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle:
                                      Theme.of(context).textTheme.labelMedium,
                                  hintText: 'Enter your password',
                                  hintStyle:
                                      Theme.of(context).textTheme.labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                ),
                                style: Theme.of(context).textTheme.bodyMedium,
                                keyboardType: TextInputType.visiblePassword,
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1, 0),
                              child: Form(
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Text(
                                  'Forgot Password?',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 10, 0, 10),
                              child: ElevatedButton(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(kYellowColor),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  textStyle:
                                      MaterialStateProperty.all<TextStyle>(
                                    Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          fontFamily: 'Readex Pro',
                                        ),
                                  ),
                                  elevation:
                                      MaterialStateProperty.all<double>(3.0),
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
                                child: const Text('Sign In'),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                '--------OR--------',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 10, 0, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Form(
                                    autovalidateMode: AutovalidateMode.disabled,
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        'assets/images/google.png',
                                        fit: BoxFit.scaleDown,
                                        alignment: const Alignment(0, 0),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Form(
                                    autovalidateMode: AutovalidateMode.disabled,
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        'assets/images/facebook.png',
                                        fit: BoxFit.scaleDown,
                                        alignment: const Alignment(0, 0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
