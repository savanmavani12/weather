import 'package:flutter/material.dart';

class SpleshPage extends StatefulWidget {
  const SpleshPage({Key? key}) : super(key: key);

  @override
  State<SpleshPage> createState() => _SpleshPageState();
}

class _SpleshPageState extends State<SpleshPage> {
  changeScreen() async {
    await Future.delayed(
      const Duration(seconds: 4),
    );
    return Navigator.pushReplacementNamed(context, "home");
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff272627),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(
              child: Image(
                image: AssetImage("assets/gif/logo.gif"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(28),
              child: Text(
                "Weather Forecast_ Loading...",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
