import 'package:arna/arna.dart';
import 'package:arna_logger/arna_logger.dart';
import 'package:arna_response_validation/arna_response_validation.dart';
import 'package:arna_web_service/arna_web_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with ArnaWebServiceController {
  bool isLoading = false;

  Future<void> onButtonPressed() async {
    if (!isLoading) {
      setState(() => isLoading = true);
      final Response? response = await webService.get(
        Uri.parse('https://api.ipify.org'),
      );
      setState(() => isLoading = false);
      final body = ArnaResponseValidation().getBody(response);
      arnaLogger(title: 'Your IP', data: body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ArnaApp(
      home: ArnaScaffold(
        headerBar: ArnaHeaderBar(title: 'Arna Web Service Demo'),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ArnaButton.text(
                label: isLoading ? 'Loading...' : 'Click Me!',
                onPressed: onButtonPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
