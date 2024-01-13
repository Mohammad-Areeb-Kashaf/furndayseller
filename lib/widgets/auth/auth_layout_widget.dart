import 'package:furndayseller/constants.dart';

class AuthLayoutWidget extends StatelessWidget {
  const AuthLayoutWidget({
    super.key,
    this.labelText,
    this.children,
  });

  final String? labelText;
  final Widget? children;

  @override
  Widget build(BuildContext context) {
    return InternetChecker(
      child: Scaffold(
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0, 0),
            child: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Text(
                        labelText!,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    children!,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
