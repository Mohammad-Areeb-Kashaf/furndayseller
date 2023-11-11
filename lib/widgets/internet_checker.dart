import 'package:furndayseller/constants.dart';

class InternetChecker extends StatelessWidget {
  final Widget child;

  const InternetChecker({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NetworkAwareWidget(
        onlineChild: child,
        offlineChild: const NoInternetScreen(),
      ),
    );
  }
}
