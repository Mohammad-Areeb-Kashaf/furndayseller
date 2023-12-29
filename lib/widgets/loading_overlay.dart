import 'package:furndayseller/constants.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay(
      {super.key, required this.child, required this.isLoading});

  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return OverlayLoaderWithAppIcon(
      appIcon: ClipOval(child: Image.asset("assets/logo.png")),
      isLoading: isLoading,
      circularProgressColor: kYellowColor,
      overlayBackgroundColor: Colors.black26,
      child: child,
    );
  }
}
