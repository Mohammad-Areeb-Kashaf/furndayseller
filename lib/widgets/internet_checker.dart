import 'package:furndayseller/constants.dart';

class InternetChecker extends StatelessWidget {
  final Widget child;

  const InternetChecker({super.key, required this.child});

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
