import 'package:flutter/material.dart';

import '../../utils/gif_player.dart';
import '../../utils/routes/routes_names.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with TickerProviderStateMixin{


  @override
  void initState() {
    super.initState();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: GifPlayer(
      gifPath: 'assets/gif/welcome_motion.gif',
      onGifCompleted: () {
        // Navigate to another screen after GIF completion
        Navigator.pushNamed(context, RouteNames.homeDealzLevel1);
        print('GIF finished playing!');

      },
    ),
    );
  }
}