import 'package:furndayseller/constants.dart';

class MainEmailVerifiedChild extends StatelessWidget {
  const MainEmailVerifiedChild({super.key});

  @override
  Widget build(BuildContext context) {
    return const InternetChecker(
      child: Scaffold(
        body: Center(
          child: Text('This is the home page'),
        ),
      ),
    );
  }
}
