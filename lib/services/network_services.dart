import 'package:furndayseller/constants.dart';

enum NetworkStatus { online, offline }

class NetworkStatusService {
  StreamController<NetworkStatus> networkStatusController =
      StreamController<NetworkStatus>();

  NetworkStatusService() {
    Connectivity().onConnectivityChanged.listen((status) async {
      networkStatusController.add(await _getNetworkStatus(status));
    });
    Timer.periodic(const Duration(seconds: 10), (timer) => checkInternet());
  }
  checkInternet() async {
    var connection = await InternetConnectionChecker().hasConnection;
    return connection
        ? networkStatusController.add(NetworkStatus.online)
        : networkStatusController.add(NetworkStatus.offline);
  }

  _getNetworkStatus(ConnectivityResult status) async {
    if (status != ConnectivityResult.none) {
      var connection = await InternetConnectionChecker().hasConnection;
      return connection ? NetworkStatus.online : NetworkStatus.offline;
    } else {
      return NetworkStatus.offline;
    }
  }
}
