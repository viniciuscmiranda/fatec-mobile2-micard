import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // Cores utilizadas no App
  final darkBlue = Color.fromRGBO(46, 91, 94, 1);
  final accent = Color.fromRGBO(29, 71, 64, 1);
  final linkedInColor = Color.fromRGBO(40, 103, 178, 1);
  final collegeColor = Color.fromRGBO(178, 0, 0, 1);
  final githubColor = Color.fromRGBO(0, 0, 0, 1);

  Future<void> _launchInWebView(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  final imageUrl = 'https://avatars.githubusercontent.com/u/54918037?v=4';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 64),
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(imageUrl),
                )),
            SizedBox(
              height: 24,
              width: double.infinity,
            ),
            Text(
              'Vinícius Miranda',
              style: TextStyle(
                //Uso de fonte customizada por recurso adicional via pubspec.
                fontSize: 30, fontFamily: 'ScratchBoys',
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 8, 32, 12),
              child: Divider(
                height: 10,
                color: accent,
                thickness: 1,
              ),
            ),
            Text(
              'FLUTTER DEVELOPER (quase isso)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 26,
            ),
            Card(
              color: githubColor,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 32),
              elevation: 8,
              //Inclusao de WidGet ListTile para estruturar o icone a esquerda e o texto no centro sem utilização de Row()
              child: ListTile(
                onTap: () {
                  _launchInWebView('https://github.com/viniciuscmiranda/');
                },
                leading: Icon(FontAwesomeIcons.github),
                title: Text('GitHub'),
              ),
              //Arredondar os cantos do Card
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            Card(
              color: linkedInColor,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 32),
              elevation: 8,
              child: ListTile(
                onTap: () => {
                  _launchInWebView(
                      'https://www.linkedin.com/in/vin%C3%ADcius-miranda-225b42193/')
                },
                leading: Icon(FontAwesomeIcons.linkedin),
                title: Text('LinkeIn'),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              child: TextButton.icon(
                onPressed: () => {},
                icon: Icon(FontAwesomeIcons.solidEnvelope),
                label: Text('vinicius.miranda2@fatec.sp.gov.br'),
                style: TextButton.styleFrom(
                  primary: Colors.white54,
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            FontAwesomeIcons.graduationCap,
          ),
          onPressed: () =>
              {_launchInWebView('https://fatecararas.cps.sp.gov.br/')},
        ),
      ),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: collegeColor,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
