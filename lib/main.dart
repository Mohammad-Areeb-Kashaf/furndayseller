import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _auth = FirebaseAuth.instance;
  late final bool isUserSignedIn;
  late final User? user;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    user = _auth.currentUser;
    if (user != null) {
      isUserSignedIn = true;
    } else {
      isUserSignedIn = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<NetworkStatus>(
          create: (context) =>
              NetworkStatusService().networkStatusController.stream,
          initialData: NetworkStatus.online,
        ),
      ],
      child: GetMaterialApp(
        title: "FurnDay Seller",
        theme: ThemeData(
          textTheme: const TextTheme(
            labelMedium: TextStyle(
              fontWeight: FontWeight.w600,
              color: kGreyTextColor,
            ),
            labelLarge: TextStyle(
              fontWeight: FontWeight.w900,
            ),
          ),
          listTileTheme: const ListTileThemeData(
            selectedTileColor: kHighlightColor,
            selectedColor: Colors.black,
          ),
          highlightColor: kHighlightColor,
          colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: kYellowColor,
              onPrimary: kYellowColor,
              secondary: kWhiteBackground,
              onSecondary: kWhiteBackground,
              error: Colors.red,
              onError: Colors.red,
              background: kWhiteBackground,
              onBackground: kWhiteBackground,
              surface: kWhiteBackground,
              onSurface: kWhiteBackground),
          buttonTheme: ButtonThemeData(
            colorScheme: Theme.of(context).colorScheme,
            highlightColor: Theme.of(context).highlightColor,
          ),
          primarySwatch: const MaterialColor(
            0xfff6c33c,
            <int, Color>{
              50: Color(0xffFEF8E8),
              100: Color(0xffFCEDC5),
              200: Color(0xffFBE19E),
              300: Color(0xffF9D577),
              400: Color(0xffF7CC59),
              500: Color(0xffF6C33C),
              600: Color(0xffF5BD36),
              700: Color(0xffF3B52E),
              800: Color(0xffF2AE27),
              900: Color(0xffEFA11A),
            },
          ),
          scaffoldBackgroundColor: kWhiteBackground,
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
            centerTitle: true,
            backgroundColor: kYellowColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: kRadius,
              ),
            ),
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
        ),
        home: isUserSignedIn ? const MainScreen() : const SignInScreen(),
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
}
